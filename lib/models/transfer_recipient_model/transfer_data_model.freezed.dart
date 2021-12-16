// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transfer_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferDataModel _$TransferDataModelFromJson(Map<String, dynamic> json) {
  return _TransferDataModel.fromJson(json);
}

/// @nodoc
class _$TransferDataModelTearOff {
  const _$TransferDataModelTearOff();

  _TransferDataModel call(
      {required String createdAt,
      required String recipient_code,
      required TransferUserDetailsModel details}) {
    return _TransferDataModel(
      createdAt: createdAt,
      recipient_code: recipient_code,
      details: details,
    );
  }

  TransferDataModel fromJson(Map<String, Object> json) {
    return TransferDataModel.fromJson(json);
  }
}

/// @nodoc
const $TransferDataModel = _$TransferDataModelTearOff();

/// @nodoc
mixin _$TransferDataModel {
  String get createdAt => throw _privateConstructorUsedError;
  String get recipient_code => throw _privateConstructorUsedError;
  TransferUserDetailsModel get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferDataModelCopyWith<TransferDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferDataModelCopyWith<$Res> {
  factory $TransferDataModelCopyWith(
          TransferDataModel value, $Res Function(TransferDataModel) then) =
      _$TransferDataModelCopyWithImpl<$Res>;
  $Res call(
      {String createdAt,
      String recipient_code,
      TransferUserDetailsModel details});

  $TransferUserDetailsModelCopyWith<$Res> get details;
}

/// @nodoc
class _$TransferDataModelCopyWithImpl<$Res>
    implements $TransferDataModelCopyWith<$Res> {
  _$TransferDataModelCopyWithImpl(this._value, this._then);

  final TransferDataModel _value;
  // ignore: unused_field
  final $Res Function(TransferDataModel) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? recipient_code = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recipient_code: recipient_code == freezed
          ? _value.recipient_code
          : recipient_code // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as TransferUserDetailsModel,
    ));
  }

  @override
  $TransferUserDetailsModelCopyWith<$Res> get details {
    return $TransferUserDetailsModelCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc
abstract class _$TransferDataModelCopyWith<$Res>
    implements $TransferDataModelCopyWith<$Res> {
  factory _$TransferDataModelCopyWith(
          _TransferDataModel value, $Res Function(_TransferDataModel) then) =
      __$TransferDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String createdAt,
      String recipient_code,
      TransferUserDetailsModel details});

  @override
  $TransferUserDetailsModelCopyWith<$Res> get details;
}

/// @nodoc
class __$TransferDataModelCopyWithImpl<$Res>
    extends _$TransferDataModelCopyWithImpl<$Res>
    implements _$TransferDataModelCopyWith<$Res> {
  __$TransferDataModelCopyWithImpl(
      _TransferDataModel _value, $Res Function(_TransferDataModel) _then)
      : super(_value, (v) => _then(v as _TransferDataModel));

  @override
  _TransferDataModel get _value => super._value as _TransferDataModel;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? recipient_code = freezed,
    Object? details = freezed,
  }) {
    return _then(_TransferDataModel(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recipient_code: recipient_code == freezed
          ? _value.recipient_code
          : recipient_code // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as TransferUserDetailsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferDataModel implements _TransferDataModel {
  const _$_TransferDataModel(
      {required this.createdAt,
      required this.recipient_code,
      required this.details});

  factory _$_TransferDataModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferDataModelFromJson(json);

  @override
  final String createdAt;
  @override
  final String recipient_code;
  @override
  final TransferUserDetailsModel details;

  @override
  String toString() {
    return 'TransferDataModel(createdAt: $createdAt, recipient_code: $recipient_code, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferDataModel &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.recipient_code, recipient_code) ||
                const DeepCollectionEquality()
                    .equals(other.recipient_code, recipient_code)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(recipient_code) ^
      const DeepCollectionEquality().hash(details);

  @JsonKey(ignore: true)
  @override
  _$TransferDataModelCopyWith<_TransferDataModel> get copyWith =>
      __$TransferDataModelCopyWithImpl<_TransferDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferDataModelToJson(this);
  }
}

abstract class _TransferDataModel implements TransferDataModel {
  const factory _TransferDataModel(
      {required String createdAt,
      required String recipient_code,
      required TransferUserDetailsModel details}) = _$_TransferDataModel;

  factory _TransferDataModel.fromJson(Map<String, dynamic> json) =
      _$_TransferDataModel.fromJson;

  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String get recipient_code => throw _privateConstructorUsedError;
  @override
  TransferUserDetailsModel get details => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransferDataModelCopyWith<_TransferDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
