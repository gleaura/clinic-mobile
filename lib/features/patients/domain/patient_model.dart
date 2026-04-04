import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    required int id,
    required String firstName,
    required String lastName,
    String? birthDate,
    String? gender,
    String? phone,
    String? email,
    String? address,
    String? identityNumber,
    String? bloodType,
    String? allergies,
    String? chronicDiseases,
    String? note,
    required String status,
    required String createdBy,
    required String createdDate,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

@freezed
class CreatePatientRequest with _$CreatePatientRequest {
  const factory CreatePatientRequest({
    required String firstName,
    required String lastName,
    String? birthDate,
    String? gender,
    String? phone,
    String? email,
    String? address,
    String? identityNumber,
    String? bloodType,
    String? allergies,
    String? chronicDiseases,
    String? note,
  }) = _CreatePatientRequest;

  factory CreatePatientRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePatientRequestFromJson(json);
}

@freezed
class UpdatePatientRequest with _$UpdatePatientRequest {
  const factory UpdatePatientRequest({
    required String firstName,
    required String lastName,
    String? birthDate,
    String? gender,
    String? phone,
    String? email,
    String? address,
    String? identityNumber,
    String? bloodType,
    String? allergies,
    String? chronicDiseases,
    String? note,
  }) = _UpdatePatientRequest;

  factory UpdatePatientRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePatientRequestFromJson(json);
}
