import 'package:dio/dio.dart';
import 'package:clinic_mobile/core/constants/api_constants.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/treatments/domain/treatment_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

class TreatmentRepository {
  final Dio _dio;

  TreatmentRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<Treatment>> getTreatments({
    int page = 0,
    int size = 10,
    String? sort,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
      };
      if (sort != null) params['sort'] = sort;
      if (status != null && status.isNotEmpty) params['status'] = status;

      final response =
          await _dio.get(ApiConstants.treatments, queryParameters: params);
      return PageResponse.fromJson(response.data, Treatment.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Treatment> createTreatment(CreateTreatmentRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.treatments, data: request.toJson());
      return Treatment.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Treatment> updateTreatment(
      int id, UpdateTreatmentRequest request) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.treatments}/$id',
        data: request.toJson(),
      );
      return Treatment.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deleteTreatment(int id) async {
    try {
      await _dio.delete('${ApiConstants.treatments}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}
