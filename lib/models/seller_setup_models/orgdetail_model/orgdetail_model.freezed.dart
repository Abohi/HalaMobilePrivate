// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'orgdetail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrgDetailModel _$OrgDetailModelFromJson(Map<String, dynamic> json) {
  return _OrgDetailModel.fromJson(json);
}

/// @nodoc
class _$OrgDetailModelTearOff {
  const _$OrgDetailModelTearOff();

  _OrgDetailModel call(
      {required String companiesName,
      required String companiesDescription,
      required String companiesNumber,
      required String firstName,
      required String lastName,
      required DateTime dateFounded}) {
    return _OrgDetailModel(
      companiesName: companiesName,
      companiesDescription: companiesDescription,
      companiesNumber: companiesNumber,
      firstName: firstName,
      lastName: lastName,
      dateFounded: dateFounded,
    );
  }

  OrgDetailModel fromJson(Map<String, Object> json) {
    return OrgDetailModel.fromJson(json);
  }
}

/// @nodoc
const $OrgDetailModel = _$OrgDetailModelTearOff();

/// @nodoc
mixin _$OrgDetailModel {
  String get companiesName => throw _privateConstructorUsedError;
  String get companiesDescription => throw _privateConstructorUsedError;
  String get companiesNumber => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  DateTime get dateFounded => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrgDetailModelCopyWith<OrgDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgDetailModelCopyWith<$Res> {
  factory $OrgDetailModelCopyWith(
          OrgDetailModel value, $Res Function(OrgDetailModel) then) =
      _$OrgDetailModelCopyWithImpl<$Res>;
  $Res call(
      {String companiesName,
      String companiesDescription,
      String companiesNumber,
      String firstName,
      String lastName,
      DateTime dateFounded});
}

/// @nodoc
class _$OrgDetailModelCopyWithImpl<$Res>
    implements $OrgDetailModelCopyWith<$Res> {
  _$OrgDetailModelCopyWithImpl(this._value, this._then);

  final OrgDetailModel _value;
  // ignore: unused_field
  final $Res Function(OrgDetailModel) _then;

  @override
  $Res call({
    Object? companiesName = freezed,
    Object? companiesDescription = freezed,
    Object? companiesNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateFounded = freezed,
  }) {
    return _then(_value.copyWith(
      companiesName: companiesName == freezed
          ? _value.companiesName
          : companiesName // ignore: cast_nullable_to_non_nullable
              as String,
      companiesDescription: companiesDescription == freezed
          ? _value.companiesDescription
          : companiesDescription // ignore: cast_nullable_to_non_nullable
              as String,
      companiesNumber: companiesNumber == freezed
          ? _value.companiesNumber
          : companiesNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateFounded: dateFounded == freezed
          ? _value.dateFounded
          : dateFounded // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$OrgDetailModelCopyWith<$Res>
    implements $OrgDetailModelCopyWith<$Res> {
  factory _$OrgDetailModelCopyWith(
          _OrgDetailModel value, $Res Function(_OrgDetailModel) then) =
      __$OrgDetailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String companiesName,
      String companiesDescription,
      String companiesNumber,
      String firstName,
      String lastName,
      DateTime dateFounded});
}

/// @nodoc
class __$OrgDetailModelCopyWithImpl<$Res>
    extends _$OrgDetailModelCopyWithImpl<$Res>
    implements _$OrgDetailModelCopyWith<$Res> {
  __$OrgDetailModelCopyWithImpl(
      _OrgDetailModel _value, $Res Function(_OrgDetailModel) _then)
      : super(_value, (v) => _then(v as _OrgDetailModel));

  @override
  _OrgDetailModel get _value => super._value as _OrgDetailModel;

  @override
  $Res call({
    Object? companiesName = freezed,
    Object? companiesDescription = freezed,
    Object? companiesNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateFounded = freezed,
  }) {
    return _then(_OrgDetailModel(
      companiesName: companiesName == freezed
          ? _value.companiesName
          : companiesName // ignore: cast_nullable_to_non_nullable
              as String,
      companiesDescription: companiesDescription == freezed
          ? _value.companiesDescription
          : companiesDescription // ignore: cast_nullable_to_non_nullable
              as String,
      companiesNumber: companiesNumber == freezed
          ? _value.companiesNumber
          : companiesNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      dateFounded: dateFounded == freezed
          ? _value.dateFounded
          : dateFounded // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrgDetailModel implements _OrgDetailModel {
  const _$_OrgDetailModel(
      {required this.companiesName,
      required this.companiesDescription,
      required this.companiesNumber,
      required this.firstName,
      required this.lastName,
      required this.dateFounded});

  factory _$_OrgDetailModel.fromJson(Map<String, dynamic> json) =>
      _$_$_OrgDetailModelFromJson(json);

  @override
  final String companiesName;
  @override
  final String companiesDescription;
  @override
  final String companiesNumber;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final DateTime dateFounded;

  @override
  String toString() {
    return 'OrgDetailModel(companiesName: $companiesName, companiesDescription: $companiesDescription, companiesNumber: $companiesNumber, firstName: $firstName, lastName: $lastName, dateFounded: $dateFounded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrgDetailModel &&
            (identical(other.companiesName, companiesName) ||
                const DeepCollectionEquality()
                    .equals(other.companiesName, companiesName)) &&
            (identical(other.companiesDescription, companiesDescription) ||
                const DeepCollectionEquality().equals(
                    other.companiesDescription, companiesDescription)) &&
            (identical(other.companiesNumber, companiesNumber) ||
                const DeepCollectionEquality()
                    .equals(other.companiesNumber, companiesNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.dateFounded, dateFounded) ||
                const DeepCollectionEquality()
                    .equals(other.dateFounded, dateFounded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(companiesName) ^
      const DeepCollectionEquality().hash(companiesDescription) ^
      const DeepCollectionEquality().hash(companiesNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(dateFounded);

  @JsonKey(ignore: true)
  @override
  _$OrgDetailModelCopyWith<_OrgDetailModel> get copyWith =>
      __$OrgDetailModelCopyWithImpl<_OrgDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrgDetailModelToJson(this);
  }
}

abstract class _OrgDetailModel implements OrgDetailModel {
  const factory _OrgDetailModel(
      {required String companiesName,
      required String companiesDescription,
      required String companiesNumber,
      required String firstName,
      required String lastName,
      required DateTime dateFounded}) = _$_OrgDetailModel;

  factory _OrgDetailModel.fromJson(Map<String, dynamic> json) =
      _$_OrgDetailModel.fromJson;

  @override
  String get companiesName => throw _privateConstructorUsedError;
  @override
  String get companiesDescription => throw _privateConstructorUsedError;
  @override
  String get companiesNumber => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  DateTime get dateFounded => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrgDetailModelCopyWith<_OrgDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
