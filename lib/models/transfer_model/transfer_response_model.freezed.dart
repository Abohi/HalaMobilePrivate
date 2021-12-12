// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transfer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferResponseModel _$TransferResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TransferResponseModel.fromJson(json);
}

/// @nodoc
class _$TransferResponseModelTearOff {
  const _$TransferResponseModelTearOff();

  _TransferResponseModel call(
      {required bool status,
      required String message,
      required TransferResponseDataModel data}) {
    return _TransferResponseModel(
      status: status,
      message: message,
      data: data,
    );
  }

  TransferResponseModel fromJson(Map<String, Object> json) {
    return TransferResponseModel.fromJson(json);
  }
}

/// @nodoc
const $TransferResponseModel = _$TransferResponseModelTearOff();

/// @nodoc
mixin _$TransferResponseModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  TransferResponseDataModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferResponseModelCopyWith<TransferResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferResponseModelCopyWith<$Res> {
  factory $TransferResponseModelCopyWith(TransferResponseModel value,
          $Res Function(TransferResponseModel) then) =
      _$TransferResponseModelCopyWithImpl<$Res>;
  $Res call({bool status, String message, TransferResponseDataModel data});

  $TransferResponseDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$TransferResponseModelCopyWithImpl<$Res>
    implements $TransferResponseModelCopyWith<$Res> {
  _$TransferResponseModelCopyWithImpl(this._value, this._then);

  final TransferResponseModel _value;
  // ignore: unused_field
  final $Res Function(TransferResponseModel) _then;

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
              as TransferResponseDataModel,
    ));
  }

  @override
  $TransferResponseDataModelCopyWith<$Res> get data {
    return $TransferResponseDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$TransferResponseModelCopyWith<$Res>
    implements $TransferResponseModelCopyWith<$Res> {
  factory _$TransferResponseModelCopyWith(_TransferResponseModel value,
          $Res Function(_TransferResponseModel) then) =
      __$TransferResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({bool status, String message, TransferResponseDataModel data});

  @override
  $TransferResponseDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$TransferResponseModelCopyWithImpl<$Res>
    extends _$TransferResponseModelCopyWithImpl<$Res>
    implements _$TransferResponseModelCopyWith<$Res> {
  __$TransferResponseModelCopyWithImpl(_TransferResponseModel _value,
      $Res Function(_TransferResponseModel) _then)
      : super(_value, (v) => _then(v as _TransferResponseModel));

  @override
  _TransferResponseModel get _value => super._value as _TransferResponseModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_TransferResponseModel(
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
              as TransferResponseDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferResponseModel implements _TransferResponseModel {
  const _$_TransferResponseModel(
      {required this.status, required this.message, required this.data});

  factory _$_TransferResponseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferResponseModelFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final TransferResponseDataModel data;

  @override
  String toString() {
    return 'TransferResponseModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferResponseModel &&
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
  _$TransferResponseModelCopyWith<_TransferResponseModel> get copyWith =>
      __$TransferResponseModelCopyWithImpl<_TransferResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferResponseModelToJson(this);
  }
}

abstract class _TransferResponseModel implements TransferResponseModel {
  const factory _TransferResponseModel(
      {required bool status,
      required String message,
      required TransferResponseDataModel data}) = _$_TransferResponseModel;

  factory _TransferResponseModel.fromJson(Map<String, dynamic> json) =
      _$_TransferResponseModel.fromJson;

  @override
  bool get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  TransferResponseDataModel get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransferResponseModelCopyWith<_TransferResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
