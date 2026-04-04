// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  int get id => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  String get patientFullName => throw _privateConstructorUsedError;
  String get appointmentDate => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  String? get doctor => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call(
      {int id,
      int patientId,
      String patientFullName,
      String appointmentDate,
      int? durationMinutes,
      String? doctor,
      String? type,
      String? note,
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? patientFullName = null,
    Object? appointmentDate = null,
    Object? durationMinutes = freezed,
    Object? doctor = freezed,
    Object? type = freezed,
    Object? note = freezed,
    Object? status = null,
    Object? createdBy = null,
    Object? createdDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      patientFullName: null == patientFullName
          ? _value.patientFullName
          : patientFullName // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentImplCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$AppointmentImplCopyWith(
          _$AppointmentImpl value, $Res Function(_$AppointmentImpl) then) =
      __$$AppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int patientId,
      String patientFullName,
      String appointmentDate,
      int? durationMinutes,
      String? doctor,
      String? type,
      String? note,
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class __$$AppointmentImplCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$AppointmentImpl>
    implements _$$AppointmentImplCopyWith<$Res> {
  __$$AppointmentImplCopyWithImpl(
      _$AppointmentImpl _value, $Res Function(_$AppointmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? patientFullName = null,
    Object? appointmentDate = null,
    Object? durationMinutes = freezed,
    Object? doctor = freezed,
    Object? type = freezed,
    Object? note = freezed,
    Object? status = null,
    Object? createdBy = null,
    Object? createdDate = null,
  }) {
    return _then(_$AppointmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      patientFullName: null == patientFullName
          ? _value.patientFullName
          : patientFullName // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentImpl implements _Appointment {
  const _$AppointmentImpl(
      {required this.id,
      required this.patientId,
      required this.patientFullName,
      required this.appointmentDate,
      this.durationMinutes,
      this.doctor,
      this.type,
      this.note,
      required this.status,
      required this.createdBy,
      required this.createdDate});

  factory _$AppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentImplFromJson(json);

  @override
  final int id;
  @override
  final int patientId;
  @override
  final String patientFullName;
  @override
  final String appointmentDate;
  @override
  final int? durationMinutes;
  @override
  final String? doctor;
  @override
  final String? type;
  @override
  final String? note;
  @override
  final String status;
  @override
  final String createdBy;
  @override
  final String createdDate;

  @override
  String toString() {
    return 'Appointment(id: $id, patientId: $patientId, patientFullName: $patientFullName, appointmentDate: $appointmentDate, durationMinutes: $durationMinutes, doctor: $doctor, type: $type, note: $note, status: $status, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.patientFullName, patientFullName) ||
                other.patientFullName == patientFullName) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      patientId,
      patientFullName,
      appointmentDate,
      durationMinutes,
      doctor,
      type,
      note,
      status,
      createdBy,
      createdDate);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      __$$AppointmentImplCopyWithImpl<_$AppointmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentImplToJson(
      this,
    );
  }
}

abstract class _Appointment implements Appointment {
  const factory _Appointment(
      {required final int id,
      required final int patientId,
      required final String patientFullName,
      required final String appointmentDate,
      final int? durationMinutes,
      final String? doctor,
      final String? type,
      final String? note,
      required final String status,
      required final String createdBy,
      required final String createdDate}) = _$AppointmentImpl;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$AppointmentImpl.fromJson;

  @override
  int get id;
  @override
  int get patientId;
  @override
  String get patientFullName;
  @override
  String get appointmentDate;
  @override
  int? get durationMinutes;
  @override
  String? get doctor;
  @override
  String? get type;
  @override
  String? get note;
  @override
  String get status;
  @override
  String get createdBy;
  @override
  String get createdDate;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateAppointmentRequest _$CreateAppointmentRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateAppointmentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateAppointmentRequest {
  int get patientId => throw _privateConstructorUsedError;
  String get appointmentDate => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  String? get doctor => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CreateAppointmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAppointmentRequestCopyWith<CreateAppointmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAppointmentRequestCopyWith<$Res> {
  factory $CreateAppointmentRequestCopyWith(CreateAppointmentRequest value,
          $Res Function(CreateAppointmentRequest) then) =
      _$CreateAppointmentRequestCopyWithImpl<$Res, CreateAppointmentRequest>;
  @useResult
  $Res call(
      {int patientId,
      String appointmentDate,
      int? durationMinutes,
      String? doctor,
      String? type,
      String? note});
}

/// @nodoc
class _$CreateAppointmentRequestCopyWithImpl<$Res,
        $Val extends CreateAppointmentRequest>
    implements $CreateAppointmentRequestCopyWith<$Res> {
  _$CreateAppointmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? appointmentDate = null,
    Object? durationMinutes = freezed,
    Object? doctor = freezed,
    Object? type = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAppointmentRequestImplCopyWith<$Res>
    implements $CreateAppointmentRequestCopyWith<$Res> {
  factory _$$CreateAppointmentRequestImplCopyWith(
          _$CreateAppointmentRequestImpl value,
          $Res Function(_$CreateAppointmentRequestImpl) then) =
      __$$CreateAppointmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int patientId,
      String appointmentDate,
      int? durationMinutes,
      String? doctor,
      String? type,
      String? note});
}

/// @nodoc
class __$$CreateAppointmentRequestImplCopyWithImpl<$Res>
    extends _$CreateAppointmentRequestCopyWithImpl<$Res,
        _$CreateAppointmentRequestImpl>
    implements _$$CreateAppointmentRequestImplCopyWith<$Res> {
  __$$CreateAppointmentRequestImplCopyWithImpl(
      _$CreateAppointmentRequestImpl _value,
      $Res Function(_$CreateAppointmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? appointmentDate = null,
    Object? durationMinutes = freezed,
    Object? doctor = freezed,
    Object? type = freezed,
    Object? note = freezed,
  }) {
    return _then(_$CreateAppointmentRequestImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAppointmentRequestImpl implements _CreateAppointmentRequest {
  const _$CreateAppointmentRequestImpl(
      {required this.patientId,
      required this.appointmentDate,
      this.durationMinutes,
      this.doctor,
      this.type,
      this.note});

  factory _$CreateAppointmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAppointmentRequestImplFromJson(json);

  @override
  final int patientId;
  @override
  final String appointmentDate;
  @override
  final int? durationMinutes;
  @override
  final String? doctor;
  @override
  final String? type;
  @override
  final String? note;

  @override
  String toString() {
    return 'CreateAppointmentRequest(patientId: $patientId, appointmentDate: $appointmentDate, durationMinutes: $durationMinutes, doctor: $doctor, type: $type, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAppointmentRequestImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, patientId, appointmentDate,
      durationMinutes, doctor, type, note);

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAppointmentRequestImplCopyWith<_$CreateAppointmentRequestImpl>
      get copyWith => __$$CreateAppointmentRequestImplCopyWithImpl<
          _$CreateAppointmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAppointmentRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateAppointmentRequest implements CreateAppointmentRequest {
  const factory _CreateAppointmentRequest(
      {required final int patientId,
      required final String appointmentDate,
      final int? durationMinutes,
      final String? doctor,
      final String? type,
      final String? note}) = _$CreateAppointmentRequestImpl;

  factory _CreateAppointmentRequest.fromJson(Map<String, dynamic> json) =
      _$CreateAppointmentRequestImpl.fromJson;

  @override
  int get patientId;
  @override
  String get appointmentDate;
  @override
  int? get durationMinutes;
  @override
  String? get doctor;
  @override
  String? get type;
  @override
  String? get note;

  /// Create a copy of CreateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAppointmentRequestImplCopyWith<_$CreateAppointmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateAppointmentRequest _$UpdateAppointmentRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateAppointmentRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateAppointmentRequest {
  String get appointmentDate => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  String? get doctor => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this UpdateAppointmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateAppointmentRequestCopyWith<UpdateAppointmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAppointmentRequestCopyWith<$Res> {
  factory $UpdateAppointmentRequestCopyWith(UpdateAppointmentRequest value,
          $Res Function(UpdateAppointmentRequest) then) =
      _$UpdateAppointmentRequestCopyWithImpl<$Res, UpdateAppointmentRequest>;
  @useResult
  $Res call(
      {String appointmentDate,
      int? durationMinutes,
      String? doctor,
      String? type,
      String? note});
}

/// @nodoc
class _$UpdateAppointmentRequestCopyWithImpl<$Res,
        $Val extends UpdateAppointmentRequest>
    implements $UpdateAppointmentRequestCopyWith<$Res> {
  _$UpdateAppointmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentDate = null,
    Object? durationMinutes = freezed,
    Object? doctor = freezed,
    Object? type = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateAppointmentRequestImplCopyWith<$Res>
    implements $UpdateAppointmentRequestCopyWith<$Res> {
  factory _$$UpdateAppointmentRequestImplCopyWith(
          _$UpdateAppointmentRequestImpl value,
          $Res Function(_$UpdateAppointmentRequestImpl) then) =
      __$$UpdateAppointmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appointmentDate,
      int? durationMinutes,
      String? doctor,
      String? type,
      String? note});
}

/// @nodoc
class __$$UpdateAppointmentRequestImplCopyWithImpl<$Res>
    extends _$UpdateAppointmentRequestCopyWithImpl<$Res,
        _$UpdateAppointmentRequestImpl>
    implements _$$UpdateAppointmentRequestImplCopyWith<$Res> {
  __$$UpdateAppointmentRequestImplCopyWithImpl(
      _$UpdateAppointmentRequestImpl _value,
      $Res Function(_$UpdateAppointmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentDate = null,
    Object? durationMinutes = freezed,
    Object? doctor = freezed,
    Object? type = freezed,
    Object? note = freezed,
  }) {
    return _then(_$UpdateAppointmentRequestImpl(
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateAppointmentRequestImpl implements _UpdateAppointmentRequest {
  const _$UpdateAppointmentRequestImpl(
      {required this.appointmentDate,
      this.durationMinutes,
      this.doctor,
      this.type,
      this.note});

  factory _$UpdateAppointmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateAppointmentRequestImplFromJson(json);

  @override
  final String appointmentDate;
  @override
  final int? durationMinutes;
  @override
  final String? doctor;
  @override
  final String? type;
  @override
  final String? note;

  @override
  String toString() {
    return 'UpdateAppointmentRequest(appointmentDate: $appointmentDate, durationMinutes: $durationMinutes, doctor: $doctor, type: $type, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAppointmentRequestImpl &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, appointmentDate, durationMinutes, doctor, type, note);

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAppointmentRequestImplCopyWith<_$UpdateAppointmentRequestImpl>
      get copyWith => __$$UpdateAppointmentRequestImplCopyWithImpl<
          _$UpdateAppointmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateAppointmentRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateAppointmentRequest implements UpdateAppointmentRequest {
  const factory _UpdateAppointmentRequest(
      {required final String appointmentDate,
      final int? durationMinutes,
      final String? doctor,
      final String? type,
      final String? note}) = _$UpdateAppointmentRequestImpl;

  factory _UpdateAppointmentRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateAppointmentRequestImpl.fromJson;

  @override
  String get appointmentDate;
  @override
  int? get durationMinutes;
  @override
  String? get doctor;
  @override
  String? get type;
  @override
  String? get note;

  /// Create a copy of UpdateAppointmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAppointmentRequestImplCopyWith<_$UpdateAppointmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
