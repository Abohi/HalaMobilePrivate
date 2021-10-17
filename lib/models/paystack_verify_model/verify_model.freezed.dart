// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyModel _$VerifyModelFromJson(Map<String, dynamic> json) {
  return _VerifyModel.fromJson(json);
}

/// @nodoc
class _$VerifyModelTearOff {
  const _$VerifyModelTearOff();

  _VerifyModel call(
      {required bool status,
      required String message,
      required VerifyDataModel data}) {
    return _VerifyModel(
      status: status,
      message: message,
      data: data,
    );
  }

  VerifyModel fromJson(Map<String, Object> json) {
    return VerifyModel.fromJson(json);
  }
}

/// @nodoc
const $VerifyModel = _$VerifyModelTearOff();

/// @nodoc
mixin _$VerifyModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  VerifyDataModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyModelCopyWith<VerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyModelCopyWith<$Res> {
  factory $VerifyModelCopyWith(
          VerifyModel value, $Res Function(VerifyModel) then) =
      _$VerifyModelCopyWithImpl<$Res>;
  $Res call({bool status, String message, VerifyDataModel data});

  $VerifyDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$VerifyModelCopyWithImpl<$Res> implements $VerifyModelCopyWith<$Res> {
  _$VerifyModelCopyWithImpl(this._value, this._then);

  final VerifyModel _value;
  // ignore: unused_field
  final $Res Function(VerifyModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VerifyDataModel,
    ));
  }

  @override
  $VerifyDataModelCopyWith<$Res> get data {
    return $VerifyDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$VerifyModelCopyWith<$Res>
    implements $VerifyModelCopyWith<$Res> {
  factory _$VerifyModelCopyWith(
          _VerifyModel value, $Res Function(_VerifyModel) then) =
      __$VerifyModelCopyWithImpl<$Res>;
  @override
  $Res call({bool status, String message, VerifyDataModel data});

  @override
  $VerifyDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$VerifyModelCopyWithImpl<$Res> extends _$VerifyModelCopyWithImpl<$Res>
    implements _$VerifyModelCopyWith<$Res> {
  __$VerifyModelCopyWithImpl(
      _VerifyModel _value, $Res Function(_VerifyModel) _then)
      : super(_value, (v) => _then(v as _VerifyModel));

  @override
  _VerifyModel get _value => super._value as _VerifyModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_VerifyModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as VerifyDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyModel implements _VerifyModel {
  const _$_VerifyModel(
      {required this.status, required this.message, required this.data});

  factory _$_VerifyModel.fromJson(Map<String, dynamic> json) =>
      _$_$_VerifyModelFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final VerifyDataModel data;

  @override
  String toString() {
    return 'VerifyModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VerifyModel &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$VerifyModelCopyWith<_VerifyModel> get copyWith =>
      __$VerifyModelCopyWithImpl<_VerifyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VerifyModelToJson(this);
  }
}

abstract class _VerifyModel implements VerifyModel {
  const factory _VerifyModel(
      {required bool status,
      required String message,
      required VerifyDataModel data}) = _$_VerifyModel;

  factory _VerifyModel.fromJson(Map<String, dynamic> json) =
      _$_VerifyModel.fromJson;

  @override
  bool get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  VerifyDataModel get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VerifyModelCopyWith<_VerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
