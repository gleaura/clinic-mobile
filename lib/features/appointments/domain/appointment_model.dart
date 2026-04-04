import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required int id,
    required int patientId,
    required String patientFullName,
    required String appointmentDate,
    int? durationMinutes,
    String? doctor,
    String? type,
    String? note,
    required String status,
    required String createdBy,
    required String createdDate,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}

@freezed
class CreateAppointmentRequest with _$CreateAppointmentRequest {
  const factory CreateAppointmentRequest({
    required int patientId,
    required String appointmentDate,
    int? durationMinutes,
    String? doctor,
    String? type,
    String? note,
  }) = _CreateAppointmentRequest;

  factory CreateAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentRequestFromJson(json);
}

@freezed
class UpdateAppointmentRequest with _$UpdateAppointmentRequest {
  const factory UpdateAppointmentRequest({
    required String appointmentDate,
    int? durationMinutes,
    String? doctor,
    String? type,
    String? note,
  }) = _UpdateAppointmentRequest;

  factory UpdateAppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppointmentRequestFromJson(json);
}
