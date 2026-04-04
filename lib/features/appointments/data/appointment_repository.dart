import 'package:dio/dio.dart';
import 'package:clinic_mobile/core/constants/api_constants.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/appointments/domain/appointment_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

class AppointmentRepository {
  final Dio _dio;

  AppointmentRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<Appointment>> getAppointments({
    int page = 0,
    int size = 10,
    String? sort,
    String? doctor,
    String? type,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
      };
      if (sort != null) params['sort'] = sort;
      if (doctor != null && doctor.isNotEmpty) params['doctor'] = doctor;
      if (type != null && type.isNotEmpty) params['type'] = type;
      if (status != null && status.isNotEmpty) params['status'] = status;

      final response =
          await _dio.get(ApiConstants.appointments, queryParameters: params);
      return PageResponse.fromJson(response.data, Appointment.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Appointment> createAppointment(
      CreateAppointmentRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.appointments, data: request.toJson());
      return Appointment.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Appointment> updateAppointment(
      int id, UpdateAppointmentRequest request) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.appointments}/$id',
        data: request.toJson(),
      );
      return Appointment.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deleteAppointment(int id) async {
    try {
      await _dio.delete('${ApiConstants.appointments}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}
