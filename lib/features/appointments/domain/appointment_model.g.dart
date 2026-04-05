// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
      id: (json['id'] as num).toInt(),
      patientId: (json['patientId'] as num).toInt(),
      patientFullName: json['patientFullName'] as String,
      appointmentDate: json['appointmentDate'] as String,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      staffId: (json['staffId'] as num?)?.toInt(),
      staffFullName: json['staffFullName'] as String?,
      type: json['type'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$$AppointmentImplToJson(_$AppointmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'patientFullName': instance.patientFullName,
      'appointmentDate': instance.appointmentDate,
      'durationMinutes': instance.durationMinutes,
      'staffId': instance.staffId,
      'staffFullName': instance.staffFullName,
      'type': instance.type,
      'note': instance.note,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };

_$CreateAppointmentRequestImpl _$$CreateAppointmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAppointmentRequestImpl(
      patientId: (json['patientId'] as num).toInt(),
      appointmentDate: json['appointmentDate'] as String,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      staffId: (json['staffId'] as num?)?.toInt(),
      type: json['type'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CreateAppointmentRequestImplToJson(
        _$CreateAppointmentRequestImpl instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'appointmentDate': instance.appointmentDate,
      'durationMinutes': instance.durationMinutes,
      'staffId': instance.staffId,
      'type': instance.type,
      'note': instance.note,
    };

_$UpdateAppointmentRequestImpl _$$UpdateAppointmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateAppointmentRequestImpl(
      appointmentDate: json['appointmentDate'] as String,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      staffId: (json['staffId'] as num?)?.toInt(),
      type: json['type'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$UpdateAppointmentRequestImplToJson(
        _$UpdateAppointmentRequestImpl instance) =>
    <String, dynamic>{
      'appointmentDate': instance.appointmentDate,
      'durationMinutes': instance.durationMinutes,
      'staffId': instance.staffId,
      'type': instance.type,
      'note': instance.note,
    };
