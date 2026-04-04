import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/patients/data/patient_repository.dart';
import 'package:clinic_mobile/features/patients/domain/patient_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(dio: ref.watch(dioProvider));
});

final patientsProvider =
    StateNotifierProvider<PatientsNotifier, AsyncValue<PageResponse<Patient>>>(
        (ref) {
  return PatientsNotifier(ref.watch(patientRepositoryProvider));
});

class PatientsNotifier
    extends StateNotifier<AsyncValue<PageResponse<Patient>>> {
  final PatientRepository _repository;
  int _page = 0;
  int _size = 10;
  String _sort = 'firstName,asc';
  Map<String, String> _filters = {};

  PatientsNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getPatients(
        page: _page,
        size: _size,
        sort: _sort,
        firstName: _filters['firstName'],
        lastName: _filters['lastName'],
        phone: _filters['phone'],
        email: _filters['email'],
        status: _filters['status'],
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setPage(int page) async {
    _page = page;
    await fetchPatients();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchPatients();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchPatients();
  }

  Future<void> createPatient(CreatePatientRequest request) async {
    await _repository.createPatient(request);
    await fetchPatients();
  }

  Future<void> updatePatient(int id, UpdatePatientRequest request) async {
    await _repository.updatePatient(id, request);
    await fetchPatients();
  }

  Future<void> deletePatient(int id) async {
    await _repository.deletePatient(id);
    await fetchPatients();
  }
}
