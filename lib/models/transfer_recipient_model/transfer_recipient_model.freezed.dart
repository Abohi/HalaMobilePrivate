// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transfer_recipient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferRecipientModel _$TransferRecipientModelFromJson(
    Map<String, dynamic> json) {
  return _TransferRecipientModel.fromJson(json);
}

/// @nodoc
class _$TransferRecipientModelTearOff {
  const _$TransferRecipientModelTearOff();

  _TransferRecipientModel call(
      {required bool status,
      required String message,
      required TransferDataModel data}) {
    return _TransferRecipientModel(
      status: status,
      message: message,
      data: data,
    );
  }

  TransferRecipientModel fromJson(Map<String, Object> json) {
    return TransferRecipientModel.fromJson(json);
  }
}

/// @nodoc
const $TransferRecipientModel = _$TransferRecipientModelTearOff();

/// @nodoc
mixin _$TransferRecipientModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  TransferDataModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferRecipientModelCopyWith<TransferRecipientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferRecipientModelCopyWith<$Res> {
  factory $TransferRecipientModelCopyWith(TransferRecipientModel value,
          $Res Function(TransferRecipientModel) then) =
      _$TransferRecipientModelCopyWithImpl<$Res>;
  $Res call({bool status, String message, TransferDataModel data});

  $TransferDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$TransferRecipientModelCopyWithImpl<$Res>
    implements $TransferRecipientModelCopyWith<$Res> {
  _$TransferRecipientModelCopyWithImpl(this._value, this._then);

  final TransferRecipientModel _value;
  // ignore: unused_field
  final $Res Function(TransferRecipientModel) _then;

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
              as TransferDataModel,
    ));
  }

  @override
  $TransferDataModelCopyWith<$Res> get data {
    return $TransferDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$TransferRecipientModelCopyWith<$Res>
    implements $TransferRecipientModelCopyWith<$Res> {
  factory _$TransferRecipientModelCopyWith(_TransferRecipientModel value,
          $Res Function(_TransferRecipientModel) then) =
      __$TransferRecipientModelCopyWithImpl<$Res>;
  @override
  $Res call({bool status, String message, TransferDataModel data});

  @override
  $TransferDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$TransferRecipientModelCopyWithImpl<$Res>
    extends _$TransferRecipientModelCopyWithImpl<$Res>
    implements _$TransferRecipientModelCopyWith<$Res> {
  __$TransferRecipientModelCopyWithImpl(_TransferRecipientModel _value,
      $Res Function(_TransferRecipientModel) _then)
      : super(_value, (v) => _then(v as _TransferRecipientModel));

  @override
  _TransferRecipientModel get _value => super._value as _TransferRecipientModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_TransferRecipientModel(
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
              as TransferDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferRecipientModel implements _TransferRecipientModel {
  const _$_TransferRecipientModel(
      {required this.status, required this.message, required this.data});

  factory _$_TransferRecipientModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferRecipientModelFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final TransferDataModel data;

  @override
  String toString() {
    return 'TransferRecipientModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferRecipientModel &&
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
  _$TransferRecipientModelCopyWith<_TransferRecipientModel> get copyWith =>
      __$TransferRecipientModelCopyWithImpl<_TransferRecipientModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferRecipientModelToJson(this);
  }
}

abstract class _TransferRecipientModel implements TransferRecipientModel {
  const factory _TransferRecipientModel(
      {required bool status,
      required String message,
      required TransferDataModel data}) = _$_TransferRecipientModel;

  factory _TransferRecipientModel.fromJson(Map<String, dynamic> json) =
      _$_TransferRecipientModel.fromJson;

  @override
  bool get status => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  TransferDataModel get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransferRecipientModelCopyWith<_TransferRecipientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
