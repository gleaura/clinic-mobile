import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/appointments/data/appointment_repository.dart';
import 'package:clinic_mobile/features/appointments/domain/appointment_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepository(dio: ref.watch(dioProvider));
});

final appointmentsProvider = StateNotifierProvider<AppointmentsNotifier,
    AsyncValue<PageResponse<Appointment>>>((ref) {
  return AppointmentsNotifier(ref.watch(appointmentRepositoryProvider));
});

class AppointmentsNotifier
    extends StateNotifier<AsyncValue<PageResponse<Appointment>>> {
  final AppointmentRepository _repository;
  int _page = 0;
  int _size = 10;
  String _sort = 'appointmentDate,desc';
  Map<String, String> _filters = {};

  AppointmentsNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getAppointments(
        page: _page,
        size: _size,
        sort: _sort,
        doctor: _filters['doctor'],
        type: _filters['type'],
        status: _filters['status'],
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setPage(int page) async {
    _page = page;
    await fetchAppointments();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchAppointments();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchAppointments();
  }

  Future<void> createAppointment(CreateAppointmentRequest request) async {
    await _repository.createAppointment(request);
    await fetchAppointments();
  }

  Future<void> updateAppointment(
      int id, UpdateAppointmentRequest request) async {
    await _repository.updateAppointment(id, request);
    await fetchAppointments();
  }

  Future<void> deleteAppointment(int id) async {
    await _repository.deleteAppointment(id);
    await fetchAppointments();
  }
}
