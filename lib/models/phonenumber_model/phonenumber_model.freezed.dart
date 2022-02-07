// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'phonenumber_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneNumberModel _$PhoneNumberModelFromJson(Map<String, dynamic> json) {
  return _PhoneNumberModel.fromJson(json);
}

/// @nodoc
class _$PhoneNumberModelTearOff {
  const _$PhoneNumberModelTearOff();

  _PhoneNumberModel call({bool? isPhoneNumberVerified}) {
    return _PhoneNumberModel(
      isPhoneNumberVerified: isPhoneNumberVerified,
    );
  }

  PhoneNumberModel fromJson(Map<String, Object> json) {
    return PhoneNumberModel.fromJson(json);
  }
}

/// @nodoc
const $PhoneNumberModel = _$PhoneNumberModelTearOff();

/// @nodoc
mixin _$PhoneNumberModel {
  bool? get isPhoneNumberVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneNumberModelCopyWith<PhoneNumberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberModelCopyWith<$Res> {
  factory $PhoneNumberModelCopyWith(
          PhoneNumberModel value, $Res Function(PhoneNumberModel) then) =
      _$PhoneNumberModelCopyWithImpl<$Res>;
  $Res call({bool? isPhoneNumberVerified});
}

/// @nodoc
class _$PhoneNumberModelCopyWithImpl<$Res>
    implements $PhoneNumberModelCopyWith<$Res> {
  _$PhoneNumberModelCopyWithImpl(this._value, this._then);

  final PhoneNumberModel _value;
  // ignore: unused_field
  final $Res Function(PhoneNumberModel) _then;

  @override
  $Res call({
    Object? isPhoneNumberVerified = freezed,
  }) {
    return _then(_value.copyWith(
      isPhoneNumberVerified: isPhoneNumberVerified == freezed
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PhoneNumberModelCopyWith<$Res>
    implements $PhoneNumberModelCopyWith<$Res> {
  factory _$PhoneNumberModelCopyWith(
          _PhoneNumberModel value, $Res Function(_PhoneNumberModel) then) =
      __$PhoneNumberModelCopyWithImpl<$Res>;
  @override
  $Res call({bool? isPhoneNumberVerified});
}

/// @nodoc
class __$PhoneNumberModelCopyWithImpl<$Res>
    extends _$PhoneNumberModelCopyWithImpl<$Res>
    implements _$PhoneNumberModelCopyWith<$Res> {
  __$PhoneNumberModelCopyWithImpl(
      _PhoneNumberModel _value, $Res Function(_PhoneNumberModel) _then)
      : super(_value, (v) => _then(v as _PhoneNumberModel));

  @override
  _PhoneNumberModel get _value => super._value as _PhoneNumberModel;

  @override
  $Res call({
    Object? isPhoneNumberVerified = freezed,
  }) {
    return _then(_PhoneNumberModel(
      isPhoneNumberVerified: isPhoneNumberVerified == freezed
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhoneNumberModel implements _PhoneNumberModel {
  const _$_PhoneNumberModel({this.isPhoneNumberVerified});

  factory _$_PhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PhoneNumberModelFromJson(json);

  @override
  final bool? isPhoneNumberVerified;

  @override
  String toString() {
    return 'PhoneNumberModel(isPhoneNumberVerified: $isPhoneNumberVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhoneNumberModel &&
            (identical(other.isPhoneNumberVerified, isPhoneNumberVerified) ||
                const DeepCollectionEquality().equals(
                    other.isPhoneNumberVerified, isPhoneNumberVerified)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isPhoneNumberVerified);

  @JsonKey(ignore: true)
  @override
  _$PhoneNumberModelCopyWith<_PhoneNumberModel> get copyWith =>
      __$PhoneNumberModelCopyWithImpl<_PhoneNumberModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhoneNumberModelToJson(this);
  }
}

abstract class _PhoneNumberModel implements PhoneNumberModel {
  const factory _PhoneNumberModel({bool? isPhoneNumberVerified}) =
      _$_PhoneNumberModel;

  factory _PhoneNumberModel.fromJson(Map<String, dynamic> json) =
      _$_PhoneNumberModel.fromJson;

  @override
  bool? get isPhoneNumberVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhoneNumberModelCopyWith<_PhoneNumberModel> get copyWith =>
      throw _privateConstructorUsedError;
}
