// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Treatment _$TreatmentFromJson(Map<String, dynamic> json) {
  return _Treatment.fromJson(json);
}

/// @nodoc
mixin _$Treatment {
  int get id => throw _privateConstructorUsedError;
  int get appointmentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get treatmentDate => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;

  /// Serializes this Treatment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentCopyWith<Treatment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentCopyWith<$Res> {
  factory $TreatmentCopyWith(Treatment value, $Res Function(Treatment) then) =
      _$TreatmentCopyWithImpl<$Res, Treatment>;
  @useResult
  $Res call(
      {int id,
      int appointmentId,
      String name,
      String? description,
      String treatmentDate,
      double? cost,
      String? currency,
      String? note,
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class _$TreatmentCopyWithImpl<$Res, $Val extends Treatment>
    implements $TreatmentCopyWith<$Res> {
  _$TreatmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? appointmentId = null,
    Object? name = null,
    Object? description = freezed,
    Object? treatmentDate = null,
    Object? cost = freezed,
    Object? currency = freezed,
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
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentDate: null == treatmentDate
          ? _value.treatmentDate
          : treatmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TreatmentImplCopyWith<$Res>
    implements $TreatmentCopyWith<$Res> {
  factory _$$TreatmentImplCopyWith(
          _$TreatmentImpl value, $Res Function(_$TreatmentImpl) then) =
      __$$TreatmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int appointmentId,
      String name,
      String? description,
      String treatmentDate,
      double? cost,
      String? currency,
      String? note,
      String status,
      String createdBy,
      String createdDate});
}

/// @nodoc
class __$$TreatmentImplCopyWithImpl<$Res>
    extends _$TreatmentCopyWithImpl<$Res, _$TreatmentImpl>
    implements _$$TreatmentImplCopyWith<$Res> {
  __$$TreatmentImplCopyWithImpl(
      _$TreatmentImpl _value, $Res Function(_$TreatmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? appointmentId = null,
    Object? name = null,
    Object? description = freezed,
    Object? treatmentDate = null,
    Object? cost = freezed,
    Object? currency = freezed,
    Object? note = freezed,
    Object? status = null,
    Object? createdBy = null,
    Object? createdDate = null,
  }) {
    return _then(_$TreatmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentDate: null == treatmentDate
          ? _value.treatmentDate
          : treatmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
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
class _$TreatmentImpl implements _Treatment {
  const _$TreatmentImpl(
      {required this.id,
      required this.appointmentId,
      required this.name,
      this.description,
      required this.treatmentDate,
      this.cost,
      this.currency,
      this.note,
      required this.status,
      required this.createdBy,
      required this.createdDate});

  factory _$TreatmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreatmentImplFromJson(json);

  @override
  final int id;
  @override
  final int appointmentId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String treatmentDate;
  @override
  final double? cost;
  @override
  final String? currency;
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
    return 'Treatment(id: $id, appointmentId: $appointmentId, name: $name, description: $description, treatmentDate: $treatmentDate, cost: $cost, currency: $currency, note: $note, status: $status, createdBy: $createdBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.treatmentDate, treatmentDate) ||
                other.treatmentDate == treatmentDate) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
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
      appointmentId,
      name,
      description,
      treatmentDate,
      cost,
      currency,
      note,
      status,
      createdBy,
      createdDate);

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentImplCopyWith<_$TreatmentImpl> get copyWith =>
      __$$TreatmentImplCopyWithImpl<_$TreatmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreatmentImplToJson(
      this,
    );
  }
}

abstract class _Treatment implements Treatment {
  const factory _Treatment(
      {required final int id,
      required final int appointmentId,
      required final String name,
      final String? description,
      required final String treatmentDate,
      final double? cost,
      final String? currency,
      final String? note,
      required final String status,
      required final String createdBy,
      required final String createdDate}) = _$TreatmentImpl;

  factory _Treatment.fromJson(Map<String, dynamic> json) =
      _$TreatmentImpl.fromJson;

  @override
  int get id;
  @override
  int get appointmentId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get treatmentDate;
  @override
  double? get cost;
  @override
  String? get currency;
  @override
  String? get note;
  @override
  String get status;
  @override
  String get createdBy;
  @override
  String get createdDate;

  /// Create a copy of Treatment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentImplCopyWith<_$TreatmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTreatmentRequest _$CreateTreatmentRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateTreatmentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTreatmentRequest {
  int get appointmentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get treatmentDate => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CreateTreatmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTreatmentRequestCopyWith<CreateTreatmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTreatmentRequestCopyWith<$Res> {
  factory $CreateTreatmentRequestCopyWith(CreateTreatmentRequest value,
          $Res Function(CreateTreatmentRequest) then) =
      _$CreateTreatmentRequestCopyWithImpl<$Res, CreateTreatmentRequest>;
  @useResult
  $Res call(
      {int appointmentId,
      String name,
      String? description,
      String treatmentDate,
      double? cost,
      String? currency,
      String? note});
}

/// @nodoc
class _$CreateTreatmentRequestCopyWithImpl<$Res,
        $Val extends CreateTreatmentRequest>
    implements $CreateTreatmentRequestCopyWith<$Res> {
  _$CreateTreatmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? name = null,
    Object? description = freezed,
    Object? treatmentDate = null,
    Object? cost = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentDate: null == treatmentDate
          ? _value.treatmentDate
          : treatmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTreatmentRequestImplCopyWith<$Res>
    implements $CreateTreatmentRequestCopyWith<$Res> {
  factory _$$CreateTreatmentRequestImplCopyWith(
          _$CreateTreatmentRequestImpl value,
          $Res Function(_$CreateTreatmentRequestImpl) then) =
      __$$CreateTreatmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int appointmentId,
      String name,
      String? description,
      String treatmentDate,
      double? cost,
      String? currency,
      String? note});
}

/// @nodoc
class __$$CreateTreatmentRequestImplCopyWithImpl<$Res>
    extends _$CreateTreatmentRequestCopyWithImpl<$Res,
        _$CreateTreatmentRequestImpl>
    implements _$$CreateTreatmentRequestImplCopyWith<$Res> {
  __$$CreateTreatmentRequestImplCopyWithImpl(
      _$CreateTreatmentRequestImpl _value,
      $Res Function(_$CreateTreatmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? name = null,
    Object? description = freezed,
    Object? treatmentDate = null,
    Object? cost = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_$CreateTreatmentRequestImpl(
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentDate: null == treatmentDate
          ? _value.treatmentDate
          : treatmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
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
class _$CreateTreatmentRequestImpl implements _CreateTreatmentRequest {
  const _$CreateTreatmentRequestImpl(
      {required this.appointmentId,
      required this.name,
      this.description,
      required this.treatmentDate,
      this.cost,
      this.currency,
      this.note});

  factory _$CreateTreatmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTreatmentRequestImplFromJson(json);

  @override
  final int appointmentId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String treatmentDate;
  @override
  final double? cost;
  @override
  final String? currency;
  @override
  final String? note;

  @override
  String toString() {
    return 'CreateTreatmentRequest(appointmentId: $appointmentId, name: $name, description: $description, treatmentDate: $treatmentDate, cost: $cost, currency: $currency, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTreatmentRequestImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.treatmentDate, treatmentDate) ||
                other.treatmentDate == treatmentDate) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appointmentId, name, description,
      treatmentDate, cost, currency, note);

  /// Create a copy of CreateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTreatmentRequestImplCopyWith<_$CreateTreatmentRequestImpl>
      get copyWith => __$$CreateTreatmentRequestImplCopyWithImpl<
          _$CreateTreatmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTreatmentRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTreatmentRequest implements CreateTreatmentRequest {
  const factory _CreateTreatmentRequest(
      {required final int appointmentId,
      required final String name,
      final String? description,
      required final String treatmentDate,
      final double? cost,
      final String? currency,
      final String? note}) = _$CreateTreatmentRequestImpl;

  factory _CreateTreatmentRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTreatmentRequestImpl.fromJson;

  @override
  int get appointmentId;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get treatmentDate;
  @override
  double? get cost;
  @override
  String? get currency;
  @override
  String? get note;

  /// Create a copy of CreateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTreatmentRequestImplCopyWith<_$CreateTreatmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateTreatmentRequest _$UpdateTreatmentRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateTreatmentRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateTreatmentRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get treatmentDate => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this UpdateTreatmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTreatmentRequestCopyWith<UpdateTreatmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTreatmentRequestCopyWith<$Res> {
  factory $UpdateTreatmentRequestCopyWith(UpdateTreatmentRequest value,
          $Res Function(UpdateTreatmentRequest) then) =
      _$UpdateTreatmentRequestCopyWithImpl<$Res, UpdateTreatmentRequest>;
  @useResult
  $Res call(
      {String name,
      String? description,
      String treatmentDate,
      double? cost,
      String? currency,
      String? note});
}

/// @nodoc
class _$UpdateTreatmentRequestCopyWithImpl<$Res,
        $Val extends UpdateTreatmentRequest>
    implements $UpdateTreatmentRequestCopyWith<$Res> {
  _$UpdateTreatmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? treatmentDate = null,
    Object? cost = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentDate: null == treatmentDate
          ? _value.treatmentDate
          : treatmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTreatmentRequestImplCopyWith<$Res>
    implements $UpdateTreatmentRequestCopyWith<$Res> {
  factory _$$UpdateTreatmentRequestImplCopyWith(
          _$UpdateTreatmentRequestImpl value,
          $Res Function(_$UpdateTreatmentRequestImpl) then) =
      __$$UpdateTreatmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      String treatmentDate,
      double? cost,
      String? currency,
      String? note});
}

/// @nodoc
class __$$UpdateTreatmentRequestImplCopyWithImpl<$Res>
    extends _$UpdateTreatmentRequestCopyWithImpl<$Res,
        _$UpdateTreatmentRequestImpl>
    implements _$$UpdateTreatmentRequestImplCopyWith<$Res> {
  __$$UpdateTreatmentRequestImplCopyWithImpl(
      _$UpdateTreatmentRequestImpl _value,
      $Res Function(_$UpdateTreatmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? treatmentDate = null,
    Object? cost = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_$UpdateTreatmentRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      treatmentDate: null == treatmentDate
          ? _value.treatmentDate
          : treatmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
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
class _$UpdateTreatmentRequestImpl implements _UpdateTreatmentRequest {
  const _$UpdateTreatmentRequestImpl(
      {required this.name,
      this.description,
      required this.treatmentDate,
      this.cost,
      this.currency,
      this.note});

  factory _$UpdateTreatmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTreatmentRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String treatmentDate;
  @override
  final double? cost;
  @override
  final String? currency;
  @override
  final String? note;

  @override
  String toString() {
    return 'UpdateTreatmentRequest(name: $name, description: $description, treatmentDate: $treatmentDate, cost: $cost, currency: $currency, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTreatmentRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.treatmentDate, treatmentDate) ||
                other.treatmentDate == treatmentDate) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, description, treatmentDate, cost, currency, note);

  /// Create a copy of UpdateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTreatmentRequestImplCopyWith<_$UpdateTreatmentRequestImpl>
      get copyWith => __$$UpdateTreatmentRequestImplCopyWithImpl<
          _$UpdateTreatmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTreatmentRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateTreatmentRequest implements UpdateTreatmentRequest {
  const factory _UpdateTreatmentRequest(
      {required final String name,
      final String? description,
      required final String treatmentDate,
      final double? cost,
      final String? currency,
      final String? note}) = _$UpdateTreatmentRequestImpl;

  factory _UpdateTreatmentRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateTreatmentRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  String get treatmentDate;
  @override
  double? get cost;
  @override
  String? get currency;
  @override
  String? get note;

  /// Create a copy of UpdateTreatmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTreatmentRequestImplCopyWith<_$UpdateTreatmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
