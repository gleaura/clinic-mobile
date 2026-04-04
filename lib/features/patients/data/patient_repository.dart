import 'package:dio/dio.dart';
import 'package:clinic_mobile/core/constants/api_constants.dart';
import 'package:clinic_mobile/core/network/dio_client.dart';
import 'package:clinic_mobile/features/patients/domain/patient_model.dart';
import 'package:clinic_mobile/shared/models/page_response.dart';

class PatientRepository {
  final Dio _dio;

  PatientRepository({required Dio dio}) : _dio = dio;

  Future<PageResponse<Patient>> getPatients({
    int page = 0,
    int size = 10,
    String? sort,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
      };
      if (sort != null) params['sort'] = sort;
      if (firstName != null && firstName.isNotEmpty) {
        params['firstName'] = firstName;
      }
      if (lastName != null && lastName.isNotEmpty) {
        params['lastName'] = lastName;
      }
      if (phone != null && phone.isNotEmpty) params['phone'] = phone;
      if (email != null && email.isNotEmpty) params['email'] = email;
      if (status != null && status.isNotEmpty) params['status'] = status;

      final response =
          await _dio.get(ApiConstants.patients, queryParameters: params);
      return PageResponse.fromJson(response.data, Patient.fromJson);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Patient> createPatient(CreatePatientRequest request) async {
    try {
      final response =
          await _dio.post(ApiConstants.patients, data: request.toJson());
      return Patient.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<Patient> updatePatient(int id, UpdatePatientRequest request) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.patients}/$id',
        data: request.toJson(),
      );
      return Patient.fromJson(response.data);
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }

  Future<void> deletePatient(int id) async {
    try {
      await _dio.delete('${ApiConstants.patients}/$id');
    } on DioException catch (e) {
      throw DioClient.handleError(e);
    }
  }
}
