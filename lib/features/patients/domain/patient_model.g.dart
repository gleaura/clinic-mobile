// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      identityNumber: json['identityNumber'] as String?,
      bloodType: json['bloodType'] as String?,
      allergies: json['allergies'] as String?,
      chronicDiseases: json['chronicDiseases'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'identityNumber': instance.identityNumber,
      'bloodType': instance.bloodType,
      'allergies': instance.allergies,
      'chronicDiseases': instance.chronicDiseases,
      'note': instance.note,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };

_$CreatePatientRequestImpl _$$CreatePatientRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePatientRequestImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      identityNumber: json['identityNumber'] as String?,
      bloodType: json['bloodType'] as String?,
      allergies: json['allergies'] as String?,
      chronicDiseases: json['chronicDiseases'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CreatePatientRequestImplToJson(
        _$CreatePatientRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'identityNumber': instance.identityNumber,
      'bloodType': instance.bloodType,
      'allergies': instance.allergies,
      'chronicDiseases': instance.chronicDiseases,
      'note': instance.note,
    };

_$UpdatePatientRequestImpl _$$UpdatePatientRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePatientRequestImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      identityNumber: json['identityNumber'] as String?,
      bloodType: json['bloodType'] as String?,
      allergies: json['allergies'] as String?,
      chronicDiseases: json['chronicDiseases'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$UpdatePatientRequestImplToJson(
        _$UpdatePatientRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'identityNumber': instance.identityNumber,
      'bloodType': instance.bloodType,
      'allergies': instance.allergies,
      'chronicDiseases': instance.chronicDiseases,
      'note': instance.note,
    };
