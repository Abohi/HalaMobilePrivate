// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'account_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountInfoModel _$AccountInfoModelFromJson(Map<String, dynamic> json) {
  return _AccountInfoModel.fromJson(json);
}

/// @nodoc
class _$AccountInfoModelTearOff {
  const _$AccountInfoModelTearOff();

  _AccountInfoModel call(
      {required bool status,
      required String message,
      AccountInfoDataModel? data}) {
    return _AccountInfoModel(
      status: status,
      message: message,
      data: data,
    );
  }

  AccountInfoModel fromJson(Map<String, Object> json) {
    return AccountInfoModel.fromJson(json);
  }
}

/// @nodoc
const $AccountInfoModel = _$AccountInfoModelTearOff();

/// @nodoc
mixin _$AccountInfoModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AccountInfoDataModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountInfoModelCopyWith<AccountInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountInfoModelCopyWith<$Res> {
  factory $AccountInfoModelCopyWith(
          AccountInfoModel value, $Res Function(AccountInfoModel) then) =
      _$AccountInfoModelCopyWithImpl<$Res>;
  $Res call({bool status, String message, AccountInfoDataModel? data});

  $AccountInfoDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$AccountInfoModelCopyWithImpl<$Res>
    implements $AccountInfoModelCopyWith<$Res> {
  _$AccountInfoModelCopyWithImpl(this._value, this._then);

  final AccountInfoModel _value;
  // ignore: unused_field
  final $Res Function(AccountInfoModel) _then;

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
              as AccountInfoDataModel?,
    ));
  }

  @override
  $AccountInfoDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AccountInfoDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$AccountInfoModelCopyWith<$Res>
    implements $AccountInfoModelCopyWith<$Res> {
  factory _$AccountInfoModelCopyWith(
          _AccountInfoModel value, $Res Function(_AccountInfoModel) then) =
      __$AccountInfoModelCopyWithImpl<$Res>;
  @override
  $Res call({bool status, String message, AccountInfoDataModel? data});

  @override
  $AccountInfoDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$AccountInfoModelCopyWithImpl<$Res>
    extends _$AccountInfoModelCopyWithImpl<$Res>
    implements _$AccountInfoModelCopyWith<$Res> {
  __$AccountInfoModelCopyWithImpl(
      _AccountInfoModel _value, $Res Function(_AccountInfoModel) _then)
      : super(_value, (v) => _then(v as _AccountInfoModel));

  @override
  _AccountInfoModel get _value => super._value as _AccountInfoModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_AccountInfoModel(
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
              as AccountInfoDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountInfoModel implements _AccountInfoModel {
  const _$_AccountInfoModel(
      {required this.status, required this.message, this.data});

  factory _$_AccountInfoModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AccountInfoModelFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final AccountInfoDataModel? data;

  @override
  String toString() {
    return 'AccountInfoModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountInfoModel &&
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
  _$AccountInfoModelCopyWith<_AccountInfoModel> get copyWith =>
      __$AccountInfoModelCopyWithImpl<_AccountInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountInfoModelToJson(this);
  }
}

abstract class _AccountInfoModel implements AccountInfoModel {
  const factory _AccountInfoModel(
      {required bool status,
      required String message,
      AccountInfoDataModel? data}) = _$_AccountInfoModel;

  factory _AccountInfoModel.fromJson(Map<String, dynamic> json) =
      _$_AccountInfoModel.fromJson;

  @override
  bool get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  AccountInfoDataModel? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccountInfoModelCopyWith<_AccountInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
