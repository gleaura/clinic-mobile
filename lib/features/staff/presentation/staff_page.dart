import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/constants/permission_keys.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/core/utils/date_utils.dart';
import 'package:clinic_mobile/features/auth/presentation/auth_provider.dart';
import 'package:clinic_mobile/features/staff/domain/staff_model.dart';
import 'package:clinic_mobile/features/staff/presentation/staff_form_dialog.dart';
import 'package:clinic_mobile/features/staff/presentation/staff_provider.dart';
import 'package:clinic_mobile/shared/widgets/confirm_dialog.dart';
import 'package:clinic_mobile/shared/widgets/empty_state_widget.dart';
import 'package:clinic_mobile/shared/widgets/status_chip.dart';

class StaffPage extends ConsumerStatefulWidget {
  const StaffPage({super.key});

  @override
  ConsumerState<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends ConsumerState<StaffPage> {
  bool _showFilters = false;
  String? _statusFilter;

  void _applyFilters() {
    final filters = <String, String>{};
    if (_statusFilter != null) filters['status'] = _statusFilter!;
    ref.read(staffProvider.notifier).setFilters(filters);
  }

  void _clearFilters() {
    setState(() => _statusFilter = null);
    ref.read(staffProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final staffState = ref.watch(staffProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final canCreate =
        authNotifier.hasPermission(PermissionKeys.staffCreate);
    final canUpdate =
        authNotifier.hasPermission(PermissionKeys.staffUpdate);
    final canDelete =
        authNotifier.hasPermission(PermissionKeys.staffDelete);

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Personel',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _showFilters ? Icons.filter_list_off : Icons.filter_list,
                      color: AppColors.primary,
                    ),
                    onPressed: () =>
                        setState(() => _showFilters = !_showFilters),
                  ),
                  if (canCreate)
                    FilledButton.icon(
                      onPressed: () => _showCreateDialog(context),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Yeni'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        // Filters
        if (_showFilters)
          Container(
            margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _statusFilter,
                    decoration: const InputDecoration(
                      labelText: 'Durum',
                      isDense: true,
                    ),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('Tumu')),
                      DropdownMenuItem(
                          value: 'ACTIVE', child: Text('ACTIVE')),
                      DropdownMenuItem(
                          value: 'INACTIVE', child: Text('INACTIVE')),
                      DropdownMenuItem(
                          value: 'CANCELLED', child: Text('CANCELLED')),
                    ],
                    onChanged: (v) => setState(() => _statusFilter = v),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: _applyFilters,
                  icon: const Icon(Icons.search, size: 18),
                  label: const Text('Ara'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: _clearFilters,
                  child: const Text('Temizle'),
                ),
              ],
            ),
          ),

        const SizedBox(height: 12),

        // Content
        Expanded(
          child: staffState.when(
            data: (pageResponse) {
              if (pageResponse.content.isEmpty) {
                return const EmptyStateWidget(
                  icon: Icons.badge_outlined,
                  message: 'Personel bulunamadi',
                );
              }
              return RefreshIndicator(
                onRefresh: () =>
                    ref.read(staffProvider.notifier).fetchStaff(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: pageResponse.content.length,
                        itemBuilder: (context, index) {
                          final staff = pageResponse.content[index];
                          return _StaffCard(
                            staff: staff,
                            canUpdate: canUpdate,
                            canDelete: canDelete,
                            onEdit: () =>
                                _showEditDialog(context, staff),
                            onDelete: () => _handleDelete(staff),
                          );
                        },
                      ),
                    ),
                    // Pagination
                    if (pageResponse.totalPages > 1)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: pageResponse.number > 0
                                  ? () => ref
                                      .read(staffProvider.notifier)
                                      .setPage(pageResponse.number - 1)
                                  : null,
                              icon: const Icon(Icons.chevron_left),
                            ),
                            Text(
                              '${pageResponse.number + 1} / ${pageResponse.totalPages}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              onPressed: pageResponse.number <
                                      pageResponse.totalPages - 1
                                  ? () => ref
                                      .read(staffProvider.notifier)
                                      .setPage(pageResponse.number + 1)
                                  : null,
                              icon: const Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'Hata: ${e is ApiException ? e.message : 'Yuklenemedi'}'),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () =>
                        ref.read(staffProvider.notifier).fetchStaff(),
                    child: const Text('Tekrar Dene'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showCreateDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => StaffFormDialog(
        onSave: (request) async {
          await ref
              .read(staffProvider.notifier)
              .createStaff(request as CreateStaffRequest);
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, Staff staff) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => StaffFormDialog(
        staff: staff,
        onSave: (request) async {
          await ref
              .read(staffProvider.notifier)
              .updateStaff(
                  staff.id, request as UpdateStaffRequest);
        },
      ),
    );
  }

  Future<void> _handleDelete(Staff staff) async {
    final confirmed = await showConfirmDialog(
      context,
      title: 'Personeli Sil',
      message:
          '${staff.firstName} ${staff.lastName} personelini silmek istediginize emin misiniz?',
    );
    if (confirmed) {
      try {
        await ref
            .read(staffProvider.notifier)
            .deleteStaff(staff.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Personel silindi'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  e is ApiException ? e.message : 'Personel silinemedi'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }
}

class _StaffCard extends StatelessWidget {
  final Staff staff;
  final bool canUpdate;
  final bool canDelete;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _StaffCard({
    required this.staff,
    required this.canUpdate,
    required this.canDelete,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  child: const Icon(Icons.badge_outlined,
                      color: AppColors.primary, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${staff.firstName} ${staff.lastName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      if (staff.title != null || staff.specialization != null)
                        Text(
                          [staff.title, staff.specialization]
                              .where((e) => e != null)
                              .join(' - '),
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                    ],
                  ),
                ),
                StatusChip(status: staff.status),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (staff.phone != null) ...[
                  const Icon(Icons.phone_outlined,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    staff.phone!,
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                  const SizedBox(width: 16),
                ],
                if (staff.hireDate != null) ...[
                  const Icon(Icons.calendar_today,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    formatDate(staff.hireDate),
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                ],
              ],
            ),
            if (canUpdate || canDelete) ...[
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (canUpdate)
                    TextButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined, size: 16),
                      label: const Text('Duzenle'),
                      style:
                          TextButton.styleFrom(foregroundColor: AppColors.info),
                    ),
                  if (canDelete)
                    TextButton.icon(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_outline, size: 16),
                      label: const Text('Sil'),
                      style: TextButton.styleFrom(
                          foregroundColor: AppColors.error),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
