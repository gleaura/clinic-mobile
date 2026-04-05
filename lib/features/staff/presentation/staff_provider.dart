import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/staff/data/staff_repository.dart';
import 'package:clinic_mobile/features/staff/domain/staff_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

final staffRepositoryProvider = Provider<StaffRepository>((ref) {
  return StaffRepository(dio: ref.watch(dioProvider));
});

final staffProvider = StateNotifierProvider<StaffNotifier,
    AsyncValue<PageResponse<Staff>>>((ref) {
  return StaffNotifier(ref.watch(staffRepositoryProvider));
});

class StaffNotifier
    extends StateNotifier<AsyncValue<PageResponse<Staff>>> {
  final StaffRepository _repository;
  int _page = 0;
  int _size = 10;
  String _sort = 'lastName,asc';
  Map<String, String> _filters = {};

  StaffNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchStaff();
  }

  Future<void> fetchStaff() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getStaffList(
        page: _page,
        size: _size,
        sort: _sort,
        status: _filters['status'],
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setPage(int page) async {
    _page = page;
    await fetchStaff();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchStaff();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchStaff();
  }

  Future<void> createStaff(CreateStaffRequest request) async {
    await _repository.createStaff(request);
    await fetchStaff();
  }

  Future<void> updateStaff(int id, UpdateStaffRequest request) async {
    await _repository.updateStaff(id, request);
    await fetchStaff();
  }

  Future<void> deleteStaff(int id) async {
    await _repository.deleteStaff(id);
    await fetchStaff();
  }
}
