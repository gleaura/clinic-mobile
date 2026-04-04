// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreatmentImpl _$$TreatmentImplFromJson(Map<String, dynamic> json) =>
    _$TreatmentImpl(
      id: (json['id'] as num).toInt(),
      appointmentId: (json['appointmentId'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      treatmentDate: json['treatmentDate'] as String,
      cost: (json['cost'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$$TreatmentImplToJson(_$TreatmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appointmentId': instance.appointmentId,
      'name': instance.name,
      'description': instance.description,
      'treatmentDate': instance.treatmentDate,
      'cost': instance.cost,
      'currency': instance.currency,
      'note': instance.note,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };

_$CreateTreatmentRequestImpl _$$CreateTreatmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTreatmentRequestImpl(
      appointmentId: (json['appointmentId'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      treatmentDate: json['treatmentDate'] as String,
      cost: (json['cost'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CreateTreatmentRequestImplToJson(
        _$CreateTreatmentRequestImpl instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'name': instance.name,
      'description': instance.description,
      'treatmentDate': instance.treatmentDate,
      'cost': instance.cost,
      'currency': instance.currency,
      'note': instance.note,
    };

_$UpdateTreatmentRequestImpl _$$UpdateTreatmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateTreatmentRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      treatmentDate: json['treatmentDate'] as String,
      cost: (json['cost'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$UpdateTreatmentRequestImplToJson(
        _$UpdateTreatmentRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'treatmentDate': instance.treatmentDate,
      'cost': instance.cost,
      'currency': instance.currency,
      'note': instance.note,
    };
