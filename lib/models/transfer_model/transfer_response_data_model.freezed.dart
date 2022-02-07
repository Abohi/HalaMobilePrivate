// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transfer_response_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferResponseDataModel _$TransferResponseDataModelFromJson(
    Map<String, dynamic> json) {
  return _TransferResponseDataModel.fromJson(json);
}

/// @nodoc
class _$TransferResponseDataModelTearOff {
  const _$TransferResponseDataModelTearOff();

  _TransferResponseDataModel call(
      {required String reference,
      required num amount,
      required String reason,
      required String transfer_code,
      required String createdAt,
      String? documentId}) {
    return _TransferResponseDataModel(
      reference: reference,
      amount: amount,
      reason: reason,
      transfer_code: transfer_code,
      createdAt: createdAt,
      documentId: documentId,
    );
  }

  TransferResponseDataModel fromJson(Map<String, Object> json) {
    return TransferResponseDataModel.fromJson(json);
  }
}

/// @nodoc
const $TransferResponseDataModel = _$TransferResponseDataModelTearOff();

/// @nodoc
mixin _$TransferResponseDataModel {
  String get reference => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get transfer_code => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferResponseDataModelCopyWith<TransferResponseDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferResponseDataModelCopyWith<$Res> {
  factory $TransferResponseDataModelCopyWith(TransferResponseDataModel value,
          $Res Function(TransferResponseDataModel) then) =
      _$TransferResponseDataModelCopyWithImpl<$Res>;
  $Res call(
      {String reference,
      num amount,
      String reason,
      String transfer_code,
      String createdAt,
      String? documentId});
}

/// @nodoc
class _$TransferResponseDataModelCopyWithImpl<$Res>
    implements $TransferResponseDataModelCopyWith<$Res> {
  _$TransferResponseDataModelCopyWithImpl(this._value, this._then);

  final TransferResponseDataModel _value;
  // ignore: unused_field
  final $Res Function(TransferResponseDataModel) _then;

  @override
  $Res call({
    Object? reference = freezed,
    Object? amount = freezed,
    Object? reason = freezed,
    Object? transfer_code = freezed,
    Object? createdAt = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_value.copyWith(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      transfer_code: transfer_code == freezed
          ? _value.transfer_code
          : transfer_code // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TransferResponseDataModelCopyWith<$Res>
    implements $TransferResponseDataModelCopyWith<$Res> {
  factory _$TransferResponseDataModelCopyWith(_TransferResponseDataModel value,
          $Res Function(_TransferResponseDataModel) then) =
      __$TransferResponseDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String reference,
      num amount,
      String reason,
      String transfer_code,
      String createdAt,
      String? documentId});
}

/// @nodoc
class __$TransferResponseDataModelCopyWithImpl<$Res>
    extends _$TransferResponseDataModelCopyWithImpl<$Res>
    implements _$TransferResponseDataModelCopyWith<$Res> {
  __$TransferResponseDataModelCopyWithImpl(_TransferResponseDataModel _value,
      $Res Function(_TransferResponseDataModel) _then)
      : super(_value, (v) => _then(v as _TransferResponseDataModel));

  @override
  _TransferResponseDataModel get _value =>
      super._value as _TransferResponseDataModel;

  @override
  $Res call({
    Object? reference = freezed,
    Object? amount = freezed,
    Object? reason = freezed,
    Object? transfer_code = freezed,
    Object? createdAt = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_TransferResponseDataModel(
      reference: reference == freezed
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      transfer_code: transfer_code == freezed
          ? _value.transfer_code
          : transfer_code // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferResponseDataModel implements _TransferResponseDataModel {
  const _$_TransferResponseDataModel(
      {required this.reference,
      required this.amount,
      required this.reason,
      required this.transfer_code,
      required this.createdAt,
      this.documentId});

  factory _$_TransferResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferResponseDataModelFromJson(json);

  @override
  final String reference;
  @override
  final num amount;
  @override
  final String reason;
  @override
  final String transfer_code;
  @override
  final String createdAt;
  @override
  final String? documentId;

  @override
  String toString() {
    return 'TransferResponseDataModel(reference: $reference, amount: $amount, reason: $reason, transfer_code: $transfer_code, createdAt: $createdAt, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferResponseDataModel &&
            (identical(other.reference, reference) ||
                const DeepCollectionEquality()
                    .equals(other.reference, reference)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.transfer_code, transfer_code) ||
                const DeepCollectionEquality()
                    .equals(other.transfer_code, transfer_code)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reference) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(transfer_code) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(documentId);

  @JsonKey(ignore: true)
  @override
  _$TransferResponseDataModelCopyWith<_TransferResponseDataModel>
      get copyWith =>
          __$TransferResponseDataModelCopyWithImpl<_TransferResponseDataModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferResponseDataModelToJson(this);
  }
}

abstract class _TransferResponseDataModel implements TransferResponseDataModel {
  const factory _TransferResponseDataModel(
      {required String reference,
      required num amount,
      required String reason,
      required String transfer_code,
      required String createdAt,
      String? documentId}) = _$_TransferResponseDataModel;

  factory _TransferResponseDataModel.fromJson(Map<String, dynamic> json) =
      _$_TransferResponseDataModel.fromJson;

  @override
  String get reference => throw _privateConstructorUsedError;
  @override
  num get amount => throw _privateConstructorUsedError;
  @override
  String get reason => throw _privateConstructorUsedError;
  @override
  String get transfer_code => throw _privateConstructorUsedError;
  @override
  String get createdAt => throw _privateConstructorUsedError;
  @override
  String? get documentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransferResponseDataModelCopyWith<_TransferResponseDataModel>
      get copyWith => throw _privateConstructorUsedError;
}
