import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/constants/permission_keys.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/features/auth/presentation/auth_provider.dart';
import 'package:clinic_mobile/features/patients/domain/patient_model.dart';
import 'package:clinic_mobile/features/patients/presentation/patient_form_dialog.dart';
import 'package:clinic_mobile/features/patients/presentation/patients_provider.dart';
import 'package:clinic_mobile/shared/widgets/confirm_dialog.dart';
import 'package:clinic_mobile/shared/widgets/empty_state_widget.dart';
import 'package:clinic_mobile/shared/widgets/status_chip.dart';

class PatientsPage extends ConsumerStatefulWidget {
  const PatientsPage({super.key});

  @override
  ConsumerState<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends ConsumerState<PatientsPage> {
  bool _showFilters = false;
  final _firstNameFilter = TextEditingController();
  final _lastNameFilter = TextEditingController();
  final _phoneFilter = TextEditingController();
  final _emailFilter = TextEditingController();
  String? _statusFilter;

  @override
  void dispose() {
    _firstNameFilter.dispose();
    _lastNameFilter.dispose();
    _phoneFilter.dispose();
    _emailFilter.dispose();
    super.dispose();
  }

  void _applyFilters() {
    final filters = <String, String>{};
    if (_firstNameFilter.text.isNotEmpty) {
      filters['firstName'] = _firstNameFilter.text;
    }
    if (_lastNameFilter.text.isNotEmpty) {
      filters['lastName'] = _lastNameFilter.text;
    }
    if (_phoneFilter.text.isNotEmpty) filters['phone'] = _phoneFilter.text;
    if (_emailFilter.text.isNotEmpty) filters['email'] = _emailFilter.text;
    if (_statusFilter != null) filters['status'] = _statusFilter!;
    ref.read(patientsProvider.notifier).setFilters(filters);
  }

  void _clearFilters() {
    _firstNameFilter.clear();
    _lastNameFilter.clear();
    _phoneFilter.clear();
    _emailFilter.clear();
    setState(() => _statusFilter = null);
    ref.read(patientsProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final patientsState = ref.watch(patientsProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final canCreate = authNotifier.hasPermission(PermissionKeys.patientCreate);
    final canUpdate = authNotifier.hasPermission(PermissionKeys.patientUpdate);
    final canDelete = authNotifier.hasPermission(PermissionKeys.patientDelete);

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hastalar',
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
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _firstNameFilter,
                        decoration: const InputDecoration(
                          labelText: 'Ad',
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _lastNameFilter,
                        decoration: const InputDecoration(
                          labelText: 'Soyad',
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _phoneFilter,
                        decoration: const InputDecoration(
                          labelText: 'Telefon',
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _emailFilter,
                        decoration: const InputDecoration(
                          labelText: 'E-posta',
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
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
              ],
            ),
          ),

        const SizedBox(height: 12),

        // Content
        Expanded(
          child: patientsState.when(
            data: (pageResponse) {
              if (pageResponse.content.isEmpty) {
                return const EmptyStateWidget(
                  icon: Icons.person_off_outlined,
                  message: 'Hasta bulunamadi',
                );
              }
              return RefreshIndicator(
                onRefresh: () =>
                    ref.read(patientsProvider.notifier).fetchPatients(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: pageResponse.content.length,
                        itemBuilder: (context, index) {
                          final patient = pageResponse.content[index];
                          return _PatientCard(
                            patient: patient,
                            canUpdate: canUpdate,
                            canDelete: canDelete,
                            onEdit: () => _showEditDialog(context, patient),
                            onDelete: () => _handleDelete(patient),
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
                                      .read(patientsProvider.notifier)
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
                                      .read(patientsProvider.notifier)
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
                        ref.read(patientsProvider.notifier).fetchPatients(),
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
      builder: (_) => PatientFormDialog(
        onSave: (request) async {
          await ref
              .read(patientsProvider.notifier)
              .createPatient(request as CreatePatientRequest);
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, Patient patient) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => PatientFormDialog(
        patient: patient,
        onSave: (request) async {
          await ref
              .read(patientsProvider.notifier)
              .updatePatient(patient.id, request as UpdatePatientRequest);
        },
      ),
    );
  }

  Future<void> _handleDelete(Patient patient) async {
    final confirmed = await showConfirmDialog(
      context,
      title: 'Hastayi Sil',
      message:
          '${patient.firstName} ${patient.lastName} hastasini silmek istediginize emin misiniz?',
    );
    if (confirmed) {
      try {
        await ref.read(patientsProvider.notifier).deletePatient(patient.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Hasta silindi'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(e is ApiException ? e.message : 'Hasta silinemedi'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }
}

class _PatientCard extends StatelessWidget {
  final Patient patient;
  final bool canUpdate;
  final bool canDelete;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _PatientCard({
    required this.patient,
    required this.canUpdate,
    required this.canDelete,
    required this.onEdit,
    required this.onDelete,
  });

  String get _initials {
    final f = patient.firstName.isNotEmpty ? patient.firstName[0] : '';
    final l = patient.lastName.isNotEmpty ? patient.lastName[0] : '';
    return '$f$l'.toUpperCase();
  }

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
                  child: Text(
                    _initials,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${patient.firstName} ${patient.lastName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                StatusChip(status: patient.status),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (patient.phone != null && patient.phone!.isNotEmpty) ...[
                  const Icon(Icons.phone_outlined,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    patient.phone!,
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                  const SizedBox(width: 16),
                ],
                if (patient.email != null && patient.email!.isNotEmpty) ...[
                  const Icon(Icons.email_outlined,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      patient.email!,
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.textSecondary),
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
