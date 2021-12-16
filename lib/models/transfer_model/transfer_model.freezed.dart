// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transfer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferModel _$TransferModelFromJson(Map<String, dynamic> json) {
  return _TransferModel.fromJson(json);
}

/// @nodoc
class _$TransferModelTearOff {
  const _$TransferModelTearOff();

  _TransferModel call(
      {required String source,
      required String amount,
      required String recipient,
      required String reason}) {
    return _TransferModel(
      source: source,
      amount: amount,
      recipient: recipient,
      reason: reason,
    );
  }

  TransferModel fromJson(Map<String, Object> json) {
    return TransferModel.fromJson(json);
  }
}

/// @nodoc
const $TransferModel = _$TransferModelTearOff();

/// @nodoc
mixin _$TransferModel {
  String get source => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferModelCopyWith<TransferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferModelCopyWith<$Res> {
  factory $TransferModelCopyWith(
          TransferModel value, $Res Function(TransferModel) then) =
      _$TransferModelCopyWithImpl<$Res>;
  $Res call({String source, String amount, String recipient, String reason});
}

/// @nodoc
class _$TransferModelCopyWithImpl<$Res>
    implements $TransferModelCopyWith<$Res> {
  _$TransferModelCopyWithImpl(this._value, this._then);

  final TransferModel _value;
  // ignore: unused_field
  final $Res Function(TransferModel) _then;

  @override
  $Res call({
    Object? source = freezed,
    Object? amount = freezed,
    Object? recipient = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: recipient == freezed
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TransferModelCopyWith<$Res>
    implements $TransferModelCopyWith<$Res> {
  factory _$TransferModelCopyWith(
          _TransferModel value, $Res Function(_TransferModel) then) =
      __$TransferModelCopyWithImpl<$Res>;
  @override
  $Res call({String source, String amount, String recipient, String reason});
}

/// @nodoc
class __$TransferModelCopyWithImpl<$Res>
    extends _$TransferModelCopyWithImpl<$Res>
    implements _$TransferModelCopyWith<$Res> {
  __$TransferModelCopyWithImpl(
      _TransferModel _value, $Res Function(_TransferModel) _then)
      : super(_value, (v) => _then(v as _TransferModel));

  @override
  _TransferModel get _value => super._value as _TransferModel;

  @override
  $Res call({
    Object? source = freezed,
    Object? amount = freezed,
    Object? recipient = freezed,
    Object? reason = freezed,
  }) {
    return _then(_TransferModel(
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: recipient == freezed
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferModel implements _TransferModel {
  const _$_TransferModel(
      {required this.source,
      required this.amount,
      required this.recipient,
      required this.reason});

  factory _$_TransferModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferModelFromJson(json);

  @override
  final String source;
  @override
  final String amount;
  @override
  final String recipient;
  @override
  final String reason;

  @override
  String toString() {
    return 'TransferModel(source: $source, amount: $amount, recipient: $recipient, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferModel &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.recipient, recipient) ||
                const DeepCollectionEquality()
                    .equals(other.recipient, recipient)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(recipient) ^
      const DeepCollectionEquality().hash(reason);

  @JsonKey(ignore: true)
  @override
  _$TransferModelCopyWith<_TransferModel> get copyWith =>
      __$TransferModelCopyWithImpl<_TransferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferModelToJson(this);
  }
}

abstract class _TransferModel implements TransferModel {
  const factory _TransferModel(
      {required String source,
      required String amount,
      required String recipient,
      required String reason}) = _$_TransferModel;

  factory _TransferModel.fromJson(Map<String, dynamic> json) =
      _$_TransferModel.fromJson;

  @override
  String get source => throw _privateConstructorUsedError;
  @override
  String get amount => throw _privateConstructorUsedError;
  @override
  String get recipient => throw _privateConstructorUsedError;
  @override
  String get reason => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransferModelCopyWith<_TransferModel> get copyWith =>
      throw _privateConstructorUsedError;
}
