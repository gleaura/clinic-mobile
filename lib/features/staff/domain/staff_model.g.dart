// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffImpl _$$StaffImplFromJson(Map<String, dynamic> json) => _$StaffImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      title: json['title'] as String?,
      specialization: json['specialization'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      hireDate: json['hireDate'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$$StaffImplToJson(_$StaffImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'specialization': instance.specialization,
      'phone': instance.phone,
      'email': instance.email,
      'licenseNumber': instance.licenseNumber,
      'hireDate': instance.hireDate,
      'note': instance.note,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
    };

_$CreateStaffRequestImpl _$$CreateStaffRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateStaffRequestImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      title: json['title'] as String?,
      specialization: json['specialization'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      hireDate: json['hireDate'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CreateStaffRequestImplToJson(
        _$CreateStaffRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'specialization': instance.specialization,
      'phone': instance.phone,
      'email': instance.email,
      'licenseNumber': instance.licenseNumber,
      'hireDate': instance.hireDate,
      'note': instance.note,
    };

_$UpdateStaffRequestImpl _$$UpdateStaffRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateStaffRequestImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      title: json['title'] as String?,
      specialization: json['specialization'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      hireDate: json['hireDate'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$UpdateStaffRequestImplToJson(
        _$UpdateStaffRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'specialization': instance.specialization,
      'phone': instance.phone,
      'email': instance.email,
      'licenseNumber': instance.licenseNumber,
      'hireDate': instance.hireDate,
      'note': instance.note,
    };
