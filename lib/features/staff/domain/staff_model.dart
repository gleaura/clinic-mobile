import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_model.freezed.dart';
part 'staff_model.g.dart';

@freezed
class Staff with _$Staff {
  const factory Staff({
    required int id,
    required String firstName,
    required String lastName,
    String? title,
    String? specialization,
    String? phone,
    String? email,
    String? licenseNumber,
    String? hireDate,
    String? note,
    required String status,
    required String createdBy,
    required String createdDate,
  }) = _Staff;

  factory Staff.fromJson(Map<String, dynamic> json) =>
      _$StaffFromJson(json);
}

@freezed
class CreateStaffRequest with _$CreateStaffRequest {
  const factory CreateStaffRequest({
    required String firstName,
    required String lastName,
    String? title,
    String? specialization,
    String? phone,
    String? email,
    String? licenseNumber,
    String? hireDate,
    String? note,
  }) = _CreateStaffRequest;

  factory CreateStaffRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateStaffRequestFromJson(json);
}

@freezed
class UpdateStaffRequest with _$UpdateStaffRequest {
  const factory UpdateStaffRequest({
    required String firstName,
    required String lastName,
    String? title,
    String? specialization,
    String? phone,
    String? email,
    String? licenseNumber,
    String? hireDate,
    String? note,
  }) = _UpdateStaffRequest;

  factory UpdateStaffRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateStaffRequestFromJson(json);
}
