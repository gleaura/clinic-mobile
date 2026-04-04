import 'package:freezed_annotation/freezed_annotation.dart';

part 'treatment_model.freezed.dart';
part 'treatment_model.g.dart';

@freezed
class Treatment with _$Treatment {
  const factory Treatment({
    required int id,
    required int appointmentId,
    required String name,
    String? description,
    required String treatmentDate,
    double? cost,
    String? currency,
    String? note,
    required String status,
    required String createdBy,
    required String createdDate,
  }) = _Treatment;

  factory Treatment.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFromJson(json);
}

@freezed
class CreateTreatmentRequest with _$CreateTreatmentRequest {
  const factory CreateTreatmentRequest({
    required int appointmentId,
    required String name,
    String? description,
    required String treatmentDate,
    double? cost,
    String? currency,
    String? note,
  }) = _CreateTreatmentRequest;

  factory CreateTreatmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTreatmentRequestFromJson(json);
}

@freezed
class UpdateTreatmentRequest with _$UpdateTreatmentRequest {
  const factory UpdateTreatmentRequest({
    required String name,
    String? description,
    required String treatmentDate,
    double? cost,
    String? currency,
    String? note,
  }) = _UpdateTreatmentRequest;

  factory UpdateTreatmentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTreatmentRequestFromJson(json);
}
