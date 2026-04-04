// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get identityNumber => throw _privateConstructorUsedError;
  String? get bloodType => throw _privateConstructorUsedError;
  String? get allergies => throw _privateConstructorUsedError;
  String? get chronicDiseases => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
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
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? identityNumber = freezed,
    Object? bloodType = freezed,
    Object? allergies = freezed,
    Object? chronicDiseases = freezed,
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      chronicDiseases: freezed == chronicDiseases
          ? _value.chronicDiseases
          : chronicDiseases // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
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
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? identityNumber = freezed,
    Object? bloodType = freezed,
    Object? allergies = freezed,
    Object? chronicDiseases = freezed,
    Object? note = freezed,
    Object? status = null,
    Object? createdBy = null,
    Object? createdDate = null,
  }) {
    return _then(_$PatientImpl(
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      chronicDiseases: freezed == chronicDiseases
          ? _value.chronicDiseases
          : chronicDiseases // ignore: cast_nullable_to_non_nullable
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
class _$PatientImpl implements _Patient {
  const _$PatientImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.birthDate,
      this.gender,
      this.phone,
      this.email,
      this.address,
      this.identityNumber,
      this.bloodType,
      this.allergies,
      this.chronicDiseases,
      this.note,
      required this.status,
      required this.createdBy,
      required this.createdDate});

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? birthDate;
  @override
  final String? gender;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? identityNumber;
  @override
  final String? bloodType;
  @override
  final String? allergies;
  @override
  final String? chronicDiseases;
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
    return 'Patient(id: $id, firstName: $firstName, lastName: $lastName, birthDate: $birthDate, gender: $gender, phone: $phone, email: $email, address: $address, identityNumber: $identityNumber, bloodType: $bloodType, allergies: $allergies, chronicDiseases: $chronicDiseases, note: $note, status: $status, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            (identical(other.chronicDiseases, chronicDiseases) ||
                other.chronicDiseases == chronicDiseases) &&
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
      birthDate,
      gender,
      phone,
      email,
      address,
      identityNumber,
      bloodType,
      allergies,
      chronicDiseases,
      note,
      status,
      createdBy,
      createdDate);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {required final int id,
      required final String firstName,
      required final String lastName,
      final String? birthDate,
      final String? gender,
      final String? phone,
      final String? email,
      final String? address,
      final String? identityNumber,
      final String? bloodType,
      final String? allergies,
      final String? chronicDiseases,
      final String? note,
      required final String status,
      required final String createdBy,
      required final String createdDate}) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get birthDate;
  @override
  String? get gender;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get identityNumber;
  @override
  String? get bloodType;
  @override
  String? get allergies;
  @override
  String? get chronicDiseases;
  @override
  String? get note;
  @override
  String get status;
  @override
  String get createdBy;
  @override
  String get createdDate;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePatientRequest _$CreatePatientRequestFromJson(Map<String, dynamic> json) {
  return _CreatePatientRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePatientRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get identityNumber => throw _privateConstructorUsedError;
  String? get bloodType => throw _privateConstructorUsedError;
  String? get allergies => throw _privateConstructorUsedError;
  String? get chronicDiseases => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CreatePatientRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePatientRequestCopyWith<CreatePatientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePatientRequestCopyWith<$Res> {
  factory $CreatePatientRequestCopyWith(CreatePatientRequest value,
          $Res Function(CreatePatientRequest) then) =
      _$CreatePatientRequestCopyWithImpl<$Res, CreatePatientRequest>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? birthDate,
      String? gender,
      String? phone,
      String? email,
      String? address,
      String? identityNumber,
      String? bloodType,
      String? allergies,
      String? chronicDiseases,
      String? note});
}

/// @nodoc
class _$CreatePatientRequestCopyWithImpl<$Res,
        $Val extends CreatePatientRequest>
    implements $CreatePatientRequestCopyWith<$Res> {
  _$CreatePatientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? identityNumber = freezed,
    Object? bloodType = freezed,
    Object? allergies = freezed,
    Object? chronicDiseases = freezed,
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      chronicDiseases: freezed == chronicDiseases
          ? _value.chronicDiseases
          : chronicDiseases // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePatientRequestImplCopyWith<$Res>
    implements $CreatePatientRequestCopyWith<$Res> {
  factory _$$CreatePatientRequestImplCopyWith(_$CreatePatientRequestImpl value,
          $Res Function(_$CreatePatientRequestImpl) then) =
      __$$CreatePatientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? birthDate,
      String? gender,
      String? phone,
      String? email,
      String? address,
      String? identityNumber,
      String? bloodType,
      String? allergies,
      String? chronicDiseases,
      String? note});
}

/// @nodoc
class __$$CreatePatientRequestImplCopyWithImpl<$Res>
    extends _$CreatePatientRequestCopyWithImpl<$Res, _$CreatePatientRequestImpl>
    implements _$$CreatePatientRequestImplCopyWith<$Res> {
  __$$CreatePatientRequestImplCopyWithImpl(_$CreatePatientRequestImpl _value,
      $Res Function(_$CreatePatientRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? identityNumber = freezed,
    Object? bloodType = freezed,
    Object? allergies = freezed,
    Object? chronicDiseases = freezed,
    Object? note = freezed,
  }) {
    return _then(_$CreatePatientRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      chronicDiseases: freezed == chronicDiseases
          ? _value.chronicDiseases
          : chronicDiseases // ignore: cast_nullable_to_non_nullable
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
class _$CreatePatientRequestImpl implements _CreatePatientRequest {
  const _$CreatePatientRequestImpl(
      {required this.firstName,
      required this.lastName,
      this.birthDate,
      this.gender,
      this.phone,
      this.email,
      this.address,
      this.identityNumber,
      this.bloodType,
      this.allergies,
      this.chronicDiseases,
      this.note});

  factory _$CreatePatientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePatientRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? birthDate;
  @override
  final String? gender;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? identityNumber;
  @override
  final String? bloodType;
  @override
  final String? allergies;
  @override
  final String? chronicDiseases;
  @override
  final String? note;

  @override
  String toString() {
    return 'CreatePatientRequest(firstName: $firstName, lastName: $lastName, birthDate: $birthDate, gender: $gender, phone: $phone, email: $email, address: $address, identityNumber: $identityNumber, bloodType: $bloodType, allergies: $allergies, chronicDiseases: $chronicDiseases, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePatientRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            (identical(other.chronicDiseases, chronicDiseases) ||
                other.chronicDiseases == chronicDiseases) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      birthDate,
      gender,
      phone,
      email,
      address,
      identityNumber,
      bloodType,
      allergies,
      chronicDiseases,
      note);

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePatientRequestImplCopyWith<_$CreatePatientRequestImpl>
      get copyWith =>
          __$$CreatePatientRequestImplCopyWithImpl<_$CreatePatientRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePatientRequestImplToJson(
      this,
    );
  }
}

abstract class _CreatePatientRequest implements CreatePatientRequest {
  const factory _CreatePatientRequest(
      {required final String firstName,
      required final String lastName,
      final String? birthDate,
      final String? gender,
      final String? phone,
      final String? email,
      final String? address,
      final String? identityNumber,
      final String? bloodType,
      final String? allergies,
      final String? chronicDiseases,
      final String? note}) = _$CreatePatientRequestImpl;

  factory _CreatePatientRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePatientRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get birthDate;
  @override
  String? get gender;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get identityNumber;
  @override
  String? get bloodType;
  @override
  String? get allergies;
  @override
  String? get chronicDiseases;
  @override
  String? get note;

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePatientRequestImplCopyWith<_$CreatePatientRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdatePatientRequest _$UpdatePatientRequestFromJson(Map<String, dynamic> json) {
  return _UpdatePatientRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePatientRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get identityNumber => throw _privateConstructorUsedError;
  String? get bloodType => throw _privateConstructorUsedError;
  String? get allergies => throw _privateConstructorUsedError;
  String? get chronicDiseases => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this UpdatePatientRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePatientRequestCopyWith<UpdatePatientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePatientRequestCopyWith<$Res> {
  factory $UpdatePatientRequestCopyWith(UpdatePatientRequest value,
          $Res Function(UpdatePatientRequest) then) =
      _$UpdatePatientRequestCopyWithImpl<$Res, UpdatePatientRequest>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? birthDate,
      String? gender,
      String? phone,
      String? email,
      String? address,
      String? identityNumber,
      String? bloodType,
      String? allergies,
      String? chronicDiseases,
      String? note});
}

/// @nodoc
class _$UpdatePatientRequestCopyWithImpl<$Res,
        $Val extends UpdatePatientRequest>
    implements $UpdatePatientRequestCopyWith<$Res> {
  _$UpdatePatientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? identityNumber = freezed,
    Object? bloodType = freezed,
    Object? allergies = freezed,
    Object? chronicDiseases = freezed,
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      chronicDiseases: freezed == chronicDiseases
          ? _value.chronicDiseases
          : chronicDiseases // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePatientRequestImplCopyWith<$Res>
    implements $UpdatePatientRequestCopyWith<$Res> {
  factory _$$UpdatePatientRequestImplCopyWith(_$UpdatePatientRequestImpl value,
          $Res Function(_$UpdatePatientRequestImpl) then) =
      __$$UpdatePatientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? birthDate,
      String? gender,
      String? phone,
      String? email,
      String? address,
      String? identityNumber,
      String? bloodType,
      String? allergies,
      String? chronicDiseases,
      String? note});
}

/// @nodoc
class __$$UpdatePatientRequestImplCopyWithImpl<$Res>
    extends _$UpdatePatientRequestCopyWithImpl<$Res, _$UpdatePatientRequestImpl>
    implements _$$UpdatePatientRequestImplCopyWith<$Res> {
  __$$UpdatePatientRequestImplCopyWithImpl(_$UpdatePatientRequestImpl _value,
      $Res Function(_$UpdatePatientRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? identityNumber = freezed,
    Object? bloodType = freezed,
    Object? allergies = freezed,
    Object? chronicDiseases = freezed,
    Object? note = freezed,
  }) {
    return _then(_$UpdatePatientRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      identityNumber: freezed == identityNumber
          ? _value.identityNumber
          : identityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      chronicDiseases: freezed == chronicDiseases
          ? _value.chronicDiseases
          : chronicDiseases // ignore: cast_nullable_to_non_nullable
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
class _$UpdatePatientRequestImpl implements _UpdatePatientRequest {
  const _$UpdatePatientRequestImpl(
      {required this.firstName,
      required this.lastName,
      this.birthDate,
      this.gender,
      this.phone,
      this.email,
      this.address,
      this.identityNumber,
      this.bloodType,
      this.allergies,
      this.chronicDiseases,
      this.note});

  factory _$UpdatePatientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePatientRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? birthDate;
  @override
  final String? gender;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? identityNumber;
  @override
  final String? bloodType;
  @override
  final String? allergies;
  @override
  final String? chronicDiseases;
  @override
  final String? note;

  @override
  String toString() {
    return 'UpdatePatientRequest(firstName: $firstName, lastName: $lastName, birthDate: $birthDate, gender: $gender, phone: $phone, email: $email, address: $address, identityNumber: $identityNumber, bloodType: $bloodType, allergies: $allergies, chronicDiseases: $chronicDiseases, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePatientRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.identityNumber, identityNumber) ||
                other.identityNumber == identityNumber) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            (identical(other.chronicDiseases, chronicDiseases) ||
                other.chronicDiseases == chronicDiseases) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      birthDate,
      gender,
      phone,
      email,
      address,
      identityNumber,
      bloodType,
      allergies,
      chronicDiseases,
      note);

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePatientRequestImplCopyWith<_$UpdatePatientRequestImpl>
      get copyWith =>
          __$$UpdatePatientRequestImplCopyWithImpl<_$UpdatePatientRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePatientRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdatePatientRequest implements UpdatePatientRequest {
  const factory _UpdatePatientRequest(
      {required final String firstName,
      required final String lastName,
      final String? birthDate,
      final String? gender,
      final String? phone,
      final String? email,
      final String? address,
      final String? identityNumber,
      final String? bloodType,
      final String? allergies,
      final String? chronicDiseases,
      final String? note}) = _$UpdatePatientRequestImpl;

  factory _UpdatePatientRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePatientRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get birthDate;
  @override
  String? get gender;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get identityNumber;
  @override
  String? get bloodType;
  @override
  String? get allergies;
  @override
  String? get chronicDiseases;
  @override
  String? get note;

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePatientRequestImplCopyWith<_$UpdatePatientRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
