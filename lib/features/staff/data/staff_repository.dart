import 'package:dio/dio.dart';
import 'package:clinic_mobile/core/constants/api_constants.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/staff/domain/staff_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

class StaffRepository {
  final Dio _dio;

  StaffRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<Staff>> getStaffList({
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
          await _dio.get(ApiConstants.staff, queryParameters: params);
      return PageResponse.fromJson(response.data, Staff.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Staff> createStaff(CreateStaffRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.staff, data: request.toJson());
      return Staff.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Staff> updateStaff(int id, UpdateStaffRequest request) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.staff}/$id',
        data: request.toJson(),
      );
      return Staff.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deleteStaff(int id) async {
    try {
      await _dio.delete('${ApiConstants.staff}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}
