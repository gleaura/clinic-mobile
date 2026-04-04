import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/treatments/data/treatment_repository.dart';
import 'package:clinic_mobile/features/treatments/domain/treatment_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

final treatmentRepositoryProvider = Provider<TreatmentRepository>((ref) {
  return TreatmentRepository(dio: ref.watch(dioProvider));
});

final treatmentsProvider = StateNotifierProvider<TreatmentsNotifier,
    AsyncValue<PageResponse<Treatment>>>((ref) {
  return TreatmentsNotifier(ref.watch(treatmentRepositoryProvider));
});

class TreatmentsNotifier
    extends StateNotifier<AsyncValue<PageResponse<Treatment>>> {
  final TreatmentRepository _repository;
  int _page = 0;
  int _size = 10;
  String _sort = 'treatmentDate,desc';
  Map<String, String> _filters = {};

  TreatmentsNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchTreatments();
  }

  Future<void> fetchTreatments() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getTreatments(
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
    await fetchTreatments();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchTreatments();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchTreatments();
  }

  Future<void> createTreatment(CreateTreatmentRequest request) async {
    await _repository.createTreatment(request);
    await fetchTreatments();
  }

  Future<void> updateTreatment(int id, UpdateTreatmentRequest request) async {
    await _repository.updateTreatment(id, request);
    await fetchTreatments();
  }

  Future<void> deleteTreatment(int id) async {
    await _repository.deleteTreatment(id);
    await fetchTreatments();
  }
}
