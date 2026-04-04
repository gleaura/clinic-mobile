import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/constants/app_colors.dart';
import 'package:clinic_mobile/core/constants/permission_keys.dart';
import 'package:clinic_mobile/core/network/api_exceptions.dart';
import 'package:clinic_mobile/core/utils/date_utils.dart';
import 'package:clinic_mobile/features/auth/presentation/auth_provider.dart';
import 'package:clinic_mobile/features/appointments/domain/appointment_model.dart';
import 'package:clinic_mobile/features/appointments/presentation/appointment_form_dialog.dart';
import 'package:clinic_mobile/features/appointments/presentation/appointments_provider.dart';
import 'package:clinic_mobile/shared/widgets/confirm_dialog.dart';
import 'package:clinic_mobile/shared/widgets/empty_state_widget.dart';
import 'package:clinic_mobile/shared/widgets/status_chip.dart';

class AppointmentsPage extends ConsumerStatefulWidget {
  const AppointmentsPage({super.key});

  @override
  ConsumerState<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends ConsumerState<AppointmentsPage> {
  bool _showFilters = false;
  final _doctorFilter = TextEditingController();
  final _typeFilter = TextEditingController();
  String? _statusFilter;

  @override
  void dispose() {
    _doctorFilter.dispose();
    _typeFilter.dispose();
    super.dispose();
  }

  void _applyFilters() {
    final filters = <String, String>{};
    if (_doctorFilter.text.isNotEmpty) {
      filters['doctor'] = _doctorFilter.text;
    }
    if (_typeFilter.text.isNotEmpty) filters['type'] = _typeFilter.text;
    if (_statusFilter != null) filters['status'] = _statusFilter!;
    ref.read(appointmentsProvider.notifier).setFilters(filters);
  }

  void _clearFilters() {
    _doctorFilter.clear();
    _typeFilter.clear();
    setState(() => _statusFilter = null);
    ref.read(appointmentsProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsState = ref.watch(appointmentsProvider);
    final authNotifier = ref.read(authProvider.notifier);
    final canCreate =
        authNotifier.hasPermission(PermissionKeys.appointmentCreate);
    final canUpdate =
        authNotifier.hasPermission(PermissionKeys.appointmentUpdate);
    final canDelete =
        authNotifier.hasPermission(PermissionKeys.appointmentDelete);

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Randevular',
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
                        controller: _doctorFilter,
                        decoration: const InputDecoration(
                          labelText: 'Doktor',
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _typeFilter,
                        decoration: const InputDecoration(
                          labelText: 'Tur',
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
                              value: 'SCHEDULED', child: Text('SCHEDULED')),
                          DropdownMenuItem(
                              value: 'COMPLETED', child: Text('COMPLETED')),
                          DropdownMenuItem(
                              value: 'CANCELLED', child: Text('CANCELLED')),
                          DropdownMenuItem(
                              value: 'NO_SHOW', child: Text('NO_SHOW')),
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
          child: appointmentsState.when(
            data: (pageResponse) {
              if (pageResponse.content.isEmpty) {
                return const EmptyStateWidget(
                  icon: Icons.calendar_today_outlined,
                  message: 'Randevu bulunamadi',
                );
              }
              return RefreshIndicator(
                onRefresh: () => ref
                    .read(appointmentsProvider.notifier)
                    .fetchAppointments(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: pageResponse.content.length,
                        itemBuilder: (context, index) {
                          final appointment = pageResponse.content[index];
                          return _AppointmentCard(
                            appointment: appointment,
                            canUpdate: canUpdate,
                            canDelete: canDelete,
                            onEdit: () =>
                                _showEditDialog(context, appointment),
                            onDelete: () => _handleDelete(appointment),
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
                                      .read(appointmentsProvider.notifier)
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
                                      .read(appointmentsProvider.notifier)
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
                    onPressed: () => ref
                        .read(appointmentsProvider.notifier)
                        .fetchAppointments(),
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
      builder: (_) => AppointmentFormDialog(
        onSave: (request) async {
          await ref
              .read(appointmentsProvider.notifier)
              .createAppointment(request as CreateAppointmentRequest);
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, Appointment appointment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => AppointmentFormDialog(
        appointment: appointment,
        onSave: (request) async {
          await ref
              .read(appointmentsProvider.notifier)
              .updateAppointment(
                  appointment.id, request as UpdateAppointmentRequest);
        },
      ),
    );
  }

  Future<void> _handleDelete(Appointment appointment) async {
    final confirmed = await showConfirmDialog(
      context,
      title: 'Randevuyu Sil',
      message:
          '${appointment.patientFullName} randevusunu silmek istediginize emin misiniz?',
    );
    if (confirmed) {
      try {
        await ref
            .read(appointmentsProvider.notifier)
            .deleteAppointment(appointment.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Randevu silindi'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  e is ApiException ? e.message : 'Randevu silinemedi'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }
}

class _AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final bool canUpdate;
  final bool canDelete;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AppointmentCard({
    required this.appointment,
    required this.canUpdate,
    required this.canDelete,
    required this.onEdit,
    required this.onDelete,
  });

  Color get _statusColor => switch (appointment.status) {
        'SCHEDULED' => AppColors.info,
        'COMPLETED' => AppColors.success,
        'CANCELLED' => AppColors.error,
        'NO_SHOW' => AppColors.warning,
        _ => AppColors.textSecondary,
      };

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
                  backgroundColor: _statusColor.withValues(alpha: 0.1),
                  child: Icon(Icons.calendar_today,
                      color: _statusColor, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.patientFullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        formatDateTime(appointment.appointmentDate),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                StatusChip(status: appointment.status),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (appointment.durationMinutes != null) ...[
                  const Icon(Icons.timer_outlined,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    '${appointment.durationMinutes} dk',
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                  const SizedBox(width: 16),
                ],
                if (appointment.doctor != null &&
                    appointment.doctor!.isNotEmpty) ...[
                  const Icon(Icons.person_outline,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    appointment.doctor!,
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                  const SizedBox(width: 16),
                ],
                if (appointment.type != null &&
                    appointment.type!.isNotEmpty) ...[
                  const Icon(Icons.medical_services_outlined,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    appointment.type!,
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
