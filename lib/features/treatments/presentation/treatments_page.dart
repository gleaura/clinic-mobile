import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/constants/permission_keys.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/core/utils/date_utils.dart';
import 'package:clinic_mobile/features/auth/presentation/auth_provider.dart';
import 'package:clinic_mobile/features/treatments/domain/treatment_model.dart';
import 'package:clinic_mobile/features/treatments/presentation/treatment_form_dialog.dart';
import 'package:clinic_mobile/features/treatments/presentation/treatments_provider.dart';
import 'package:clinic_mobile/shared/widgets/confirm_dialog.dart';
import 'package:clinic_mobile/shared/widgets/empty_state_widget.dart';
import 'package:clinic_mobile/shared/widgets/status_chip.dart';

class TreatmentsPage extends ConsumerStatefulWidget {
  const TreatmentsPage({super.key});

  @override
  ConsumerState<TreatmentsPage> createState() => _TreatmentsPageState();
}

class _TreatmentsPageState extends ConsumerState<TreatmentsPage> {
  bool _showFilters = false;
  String? _statusFilter;

  void _applyFilters() {
    final filters = <String, String>{};
    if (_statusFilter != null) filters['status'] = _statusFilter!;
    ref.read(treatmentsProvider.notifier).setFilters(filters);
  }

  void _clearFilters() {
    setState(() => _statusFilter = null);
    ref.read(treatmentsProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final treatmentsState = ref.watch(treatmentsProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final canCreate =
        authNotifier.hasPermission(PermissionKeys.treatmentCreate);
    final canUpdate =
        authNotifier.hasPermission(PermissionKeys.treatmentUpdate);
    final canDelete =
        authNotifier.hasPermission(PermissionKeys.treatmentDelete);

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tedaviler',
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
          child: treatmentsState.when(
            data: (pageResponse) {
              if (pageResponse.content.isEmpty) {
                return const EmptyStateWidget(
                  icon: Icons.medical_services_outlined,
                  message: 'Tedavi bulunamadi',
                );
              }
              return RefreshIndicator(
                onRefresh: () =>
                    ref.read(treatmentsProvider.notifier).fetchTreatments(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: pageResponse.content.length,
                        itemBuilder: (context, index) {
                          final treatment = pageResponse.content[index];
                          return _TreatmentCard(
                            treatment: treatment,
                            canUpdate: canUpdate,
                            canDelete: canDelete,
                            onEdit: () =>
                                _showEditDialog(context, treatment),
                            onDelete: () => _handleDelete(treatment),
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
                                      .read(treatmentsProvider.notifier)
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
                                      .read(treatmentsProvider.notifier)
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
                        ref.read(treatmentsProvider.notifier).fetchTreatments(),
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
      builder: (_) => TreatmentFormDialog(
        onSave: (request) async {
          await ref
              .read(treatmentsProvider.notifier)
              .createTreatment(request as CreateTreatmentRequest);
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, Treatment treatment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => TreatmentFormDialog(
        treatment: treatment,
        onSave: (request) async {
          await ref
              .read(treatmentsProvider.notifier)
              .updateTreatment(
                  treatment.id, request as UpdateTreatmentRequest);
        },
      ),
    );
  }

  Future<void> _handleDelete(Treatment treatment) async {
    final confirmed = await showConfirmDialog(
      context,
      title: 'Tedaviyi Sil',
      message:
          '${treatment.name} tedavisini silmek istediginize emin misiniz?',
    );
    if (confirmed) {
      try {
        await ref
            .read(treatmentsProvider.notifier)
            .deleteTreatment(treatment.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tedavi silindi'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  e is ApiException ? e.message : 'Tedavi silinemedi'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }
}

class _TreatmentCard extends StatelessWidget {
  final Treatment treatment;
  final bool canUpdate;
  final bool canDelete;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _TreatmentCard({
    required this.treatment,
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
                  child: const Icon(Icons.medical_services_outlined,
                      color: AppColors.primary, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        treatment.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        formatDateTime(treatment.treatmentDate),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                StatusChip(status: treatment.status),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (treatment.cost != null) ...[
                  const Icon(Icons.attach_money,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    '${treatment.cost!.toStringAsFixed(2)} ${treatment.currency ?? ''}',
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                  const SizedBox(width: 16),
                ],
                if (treatment.description != null &&
                    treatment.description!.isNotEmpty) ...[
                  Expanded(
                    child: Text(
                      treatment.description!,
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.textSecondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
