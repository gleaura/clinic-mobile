// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Staff _$StaffFromJson(Map<String, dynamic> json) {
  return _Staff.fromJson(json);
}

/// @nodoc
mixin _$Staff {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get licenseNumber => throw _privateConstructorUsedError;
  String? get hireDate => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;

  /// Serializes this Staff to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Staff
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffCopyWith<Staff> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffCopyWith<$Res> {
  factory $StaffCopyWith(Staff value, $Res Function(Staff) then) =
      _$StaffCopyWithImpl<$Res, Staff>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String? title,
      String? specialization,
      String? phone,
      String? email,
      String? licenseNumber,
      String? hireDate,
      String? note,
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class _$StaffCopyWithImpl<$Res, $Val extends Staff>
    implements $StaffCopyWith<$Res> {
  _$StaffCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Staff
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? title = freezed,
    Object? specialization = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? licenseNumber = freezed,
    Object? hireDate = freezed,
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
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$StaffImplCopyWith<$Res> implements $StaffCopyWith<$Res> {
  factory _$$StaffImplCopyWith(
          _$StaffImpl value, $Res Function(_$StaffImpl) then) =
      __$$StaffImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String? title,
      String? specialization,
      String? phone,
      String? email,
      String? licenseNumber,
      String? hireDate,
      String? note,
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class __$$StaffImplCopyWithImpl<$Res>
    extends _$StaffCopyWithImpl<$Res, _$StaffImpl>
    implements _$$StaffImplCopyWith<$Res> {
  __$$StaffImplCopyWithImpl(
      _$StaffImpl _value, $Res Function(_$StaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of Staff
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? title = freezed,
    Object? specialization = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? licenseNumber = freezed,
    Object? hireDate = freezed,
    Object? note = freezed,
    Object? status = null,
    Object? createdBy = null,
    Object? createdDate = null,
  }) {
    return _then(_$StaffImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
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
class _$StaffImpl implements _Staff {
  const _$StaffImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.title,
      this.specialization,
      this.phone,
      this.email,
      this.licenseNumber,
      this.hireDate,
      this.note,
      required this.status,
      required this.createdBy,
      required this.createdDate});

  factory _$StaffImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffImplFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? title;
  @override
  final String? specialization;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? licenseNumber;
  @override
  final String? hireDate;
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
    return 'Staff(id: $id, firstName: $firstName, lastName: $lastName, title: $title, specialization: $specialization, phone: $phone, email: $email, licenseNumber: $licenseNumber, hireDate: $hireDate, note: $note, status: $status, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.hireDate, hireDate) ||
                other.hireDate == hireDate) &&
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
      firstName,
      lastName,
      title,
      specialization,
      phone,
      email,
      licenseNumber,
      hireDate,
      note,
      status,
      createdBy,
      createdDate);

  /// Create a copy of Staff
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffImplCopyWith<_$StaffImpl> get copyWith =>
      __$$StaffImplCopyWithImpl<_$StaffImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffImplToJson(
      this,
    );
  }
}

abstract class _Staff implements Staff {
  const factory _Staff(
      {required final int id,
      required final String firstName,
      required final String lastName,
      final String? title,
      final String? specialization,
      final String? phone,
      final String? email,
      final String? licenseNumber,
      final String? hireDate,
      final String? note,
      required final String status,
      required final String createdBy,
      required final String createdDate}) = _$StaffImpl;

  factory _Staff.fromJson(Map<String, dynamic> json) = _$StaffImpl.fromJson;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get title;
  @override
  String? get specialization;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get licenseNumber;
  @override
  String? get hireDate;
  @override
  String? get note;
  @override
  String get status;
  @override
  String get createdBy;
  @override
  String get createdDate;

  /// Create a copy of Staff
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffImplCopyWith<_$StaffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateStaffRequest _$CreateStaffRequestFromJson(Map<String, dynamic> json) {
  return _CreateStaffRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateStaffRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get licenseNumber => throw _privateConstructorUsedError;
  String? get hireDate => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CreateStaffRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateStaffRequestCopyWith<CreateStaffRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStaffRequestCopyWith<$Res> {
  factory $CreateStaffRequestCopyWith(
          CreateStaffRequest value, $Res Function(CreateStaffRequest) then) =
      _$CreateStaffRequestCopyWithImpl<$Res, CreateStaffRequest>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? title,
      String? specialization,
      String? phone,
      String? email,
      String? licenseNumber,
      String? hireDate,
      String? note});
}

/// @nodoc
class _$CreateStaffRequestCopyWithImpl<$Res, $Val extends CreateStaffRequest>
    implements $CreateStaffRequestCopyWith<$Res> {
  _$CreateStaffRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? title = freezed,
    Object? specialization = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? licenseNumber = freezed,
    Object? hireDate = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateStaffRequestImplCopyWith<$Res>
    implements $CreateStaffRequestCopyWith<$Res> {
  factory _$$CreateStaffRequestImplCopyWith(_$CreateStaffRequestImpl value,
          $Res Function(_$CreateStaffRequestImpl) then) =
      __$$CreateStaffRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? title,
      String? specialization,
      String? phone,
      String? email,
      String? licenseNumber,
      String? hireDate,
      String? note});
}

/// @nodoc
class __$$CreateStaffRequestImplCopyWithImpl<$Res>
    extends _$CreateStaffRequestCopyWithImpl<$Res, _$CreateStaffRequestImpl>
    implements _$$CreateStaffRequestImplCopyWith<$Res> {
  __$$CreateStaffRequestImplCopyWithImpl(_$CreateStaffRequestImpl _value,
      $Res Function(_$CreateStaffRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? title = freezed,
    Object? specialization = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? licenseNumber = freezed,
    Object? hireDate = freezed,
    Object? note = freezed,
  }) {
    return _then(_$CreateStaffRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
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
class _$CreateStaffRequestImpl implements _CreateStaffRequest {
  const _$CreateStaffRequestImpl(
      {required this.firstName,
      required this.lastName,
      this.title,
      this.specialization,
      this.phone,
      this.email,
      this.licenseNumber,
      this.hireDate,
      this.note});

  factory _$CreateStaffRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateStaffRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? title;
  @override
  final String? specialization;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? licenseNumber;
  @override
  final String? hireDate;
  @override
  final String? note;

  @override
  String toString() {
    return 'CreateStaffRequest(firstName: $firstName, lastName: $lastName, title: $title, specialization: $specialization, phone: $phone, email: $email, licenseNumber: $licenseNumber, hireDate: $hireDate, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStaffRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.hireDate, hireDate) ||
                other.hireDate == hireDate) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, title,
      specialization, phone, email, licenseNumber, hireDate, note);

  /// Create a copy of CreateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStaffRequestImplCopyWith<_$CreateStaffRequestImpl> get copyWith =>
      __$$CreateStaffRequestImplCopyWithImpl<_$CreateStaffRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateStaffRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateStaffRequest implements CreateStaffRequest {
  const factory _CreateStaffRequest(
      {required final String firstName,
      required final String lastName,
      final String? title,
      final String? specialization,
      final String? phone,
      final String? email,
      final String? licenseNumber,
      final String? hireDate,
      final String? note}) = _$CreateStaffRequestImpl;

  factory _CreateStaffRequest.fromJson(Map<String, dynamic> json) =
      _$CreateStaffRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get title;
  @override
  String? get specialization;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get licenseNumber;
  @override
  String? get hireDate;
  @override
  String? get note;

  /// Create a copy of CreateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStaffRequestImplCopyWith<_$CreateStaffRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateStaffRequest _$UpdateStaffRequestFromJson(Map<String, dynamic> json) {
  return _UpdateStaffRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateStaffRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get licenseNumber => throw _privateConstructorUsedError;
  String? get hireDate => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this UpdateStaffRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateStaffRequestCopyWith<UpdateStaffRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStaffRequestCopyWith<$Res> {
  factory $UpdateStaffRequestCopyWith(
          UpdateStaffRequest value, $Res Function(UpdateStaffRequest) then) =
      _$UpdateStaffRequestCopyWithImpl<$Res, UpdateStaffRequest>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? title,
      String? specialization,
      String? phone,
      String? email,
      String? licenseNumber,
      String? hireDate,
      String? note});
}

/// @nodoc
class _$UpdateStaffRequestCopyWithImpl<$Res, $Val extends UpdateStaffRequest>
    implements $UpdateStaffRequestCopyWith<$Res> {
  _$UpdateStaffRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? title = freezed,
    Object? specialization = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? licenseNumber = freezed,
    Object? hireDate = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateStaffRequestImplCopyWith<$Res>
    implements $UpdateStaffRequestCopyWith<$Res> {
  factory _$$UpdateStaffRequestImplCopyWith(_$UpdateStaffRequestImpl value,
          $Res Function(_$UpdateStaffRequestImpl) then) =
      __$$UpdateStaffRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? title,
      String? specialization,
      String? phone,
      String? email,
      String? licenseNumber,
      String? hireDate,
      String? note});
}

/// @nodoc
class __$$UpdateStaffRequestImplCopyWithImpl<$Res>
    extends _$UpdateStaffRequestCopyWithImpl<$Res, _$UpdateStaffRequestImpl>
    implements _$$UpdateStaffRequestImplCopyWith<$Res> {
  __$$UpdateStaffRequestImplCopyWithImpl(_$UpdateStaffRequestImpl _value,
      $Res Function(_$UpdateStaffRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? title = freezed,
    Object? specialization = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? licenseNumber = freezed,
    Object? hireDate = freezed,
    Object? note = freezed,
  }) {
    return _then(_$UpdateStaffRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: freezed == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hireDate: freezed == hireDate
          ? _value.hireDate
          : hireDate // ignore: cast_nullable_to_non_nullable
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
class _$UpdateStaffRequestImpl implements _UpdateStaffRequest {
  const _$UpdateStaffRequestImpl(
      {required this.firstName,
      required this.lastName,
      this.title,
      this.specialization,
      this.phone,
      this.email,
      this.licenseNumber,
      this.hireDate,
      this.note});

  factory _$UpdateStaffRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateStaffRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? title;
  @override
  final String? specialization;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? licenseNumber;
  @override
  final String? hireDate;
  @override
  final String? note;

  @override
  String toString() {
    return 'UpdateStaffRequest(firstName: $firstName, lastName: $lastName, title: $title, specialization: $specialization, phone: $phone, email: $email, licenseNumber: $licenseNumber, hireDate: $hireDate, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStaffRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.hireDate, hireDate) ||
                other.hireDate == hireDate) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, title,
      specialization, phone, email, licenseNumber, hireDate, note);

  /// Create a copy of UpdateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStaffRequestImplCopyWith<_$UpdateStaffRequestImpl> get copyWith =>
      __$$UpdateStaffRequestImplCopyWithImpl<_$UpdateStaffRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateStaffRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateStaffRequest implements UpdateStaffRequest {
  const factory _UpdateStaffRequest(
      {required final String firstName,
      required final String lastName,
      final String? title,
      final String? specialization,
      final String? phone,
      final String? email,
      final String? licenseNumber,
      final String? hireDate,
      final String? note}) = _$UpdateStaffRequestImpl;

  factory _UpdateStaffRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateStaffRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get title;
  @override
  String? get specialization;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get licenseNumber;
  @override
  String? get hireDate;
  @override
  String? get note;

  /// Create a copy of UpdateStaffRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStaffRequestImplCopyWith<_$UpdateStaffRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
