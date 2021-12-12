// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transfer_recipient_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferRecipientRequestModel _$TransferRecipientRequestModelFromJson(
    Map<String, dynamic> json) {
  return _TransferRecipientResonseModel.fromJson(json);
}

/// @nodoc
class _$TransferRecipientRequestModelTearOff {
  const _$TransferRecipientRequestModelTearOff();

  _TransferRecipientResonseModel call(
      {required String type,
      required String name,
      required String account_number,
      required String bank_code,
      required String currency}) {
    return _TransferRecipientResonseModel(
      type: type,
      name: name,
      account_number: account_number,
      bank_code: bank_code,
      currency: currency,
    );
  }

  TransferRecipientRequestModel fromJson(Map<String, Object> json) {
    return TransferRecipientRequestModel.fromJson(json);
  }
}

/// @nodoc
const $TransferRecipientRequestModel = _$TransferRecipientRequestModelTearOff();

/// @nodoc
mixin _$TransferRecipientRequestModel {
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get account_number => throw _privateConstructorUsedError;
  String get bank_code => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferRecipientRequestModelCopyWith<TransferRecipientRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferRecipientRequestModelCopyWith<$Res> {
  factory $TransferRecipientRequestModelCopyWith(
          TransferRecipientRequestModel value,
          $Res Function(TransferRecipientRequestModel) then) =
      _$TransferRecipientRequestModelCopyWithImpl<$Res>;
  $Res call(
      {String type,
      String name,
      String account_number,
      String bank_code,
      String currency});
}

/// @nodoc
class _$TransferRecipientRequestModelCopyWithImpl<$Res>
    implements $TransferRecipientRequestModelCopyWith<$Res> {
  _$TransferRecipientRequestModelCopyWithImpl(this._value, this._then);

  final TransferRecipientRequestModel _value;
  // ignore: unused_field
  final $Res Function(TransferRecipientRequestModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
    Object? account_number = freezed,
    Object? bank_code = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      account_number: account_number == freezed
          ? _value.account_number
          : account_number // ignore: cast_nullable_to_non_nullable
              as String,
      bank_code: bank_code == freezed
          ? _value.bank_code
          : bank_code // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TransferRecipientResonseModelCopyWith<$Res>
    implements $TransferRecipientRequestModelCopyWith<$Res> {
  factory _$TransferRecipientResonseModelCopyWith(
          _TransferRecipientResonseModel value,
          $Res Function(_TransferRecipientResonseModel) then) =
      __$TransferRecipientResonseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String name,
      String account_number,
      String bank_code,
      String currency});
}

/// @nodoc
class __$TransferRecipientResonseModelCopyWithImpl<$Res>
    extends _$TransferRecipientRequestModelCopyWithImpl<$Res>
    implements _$TransferRecipientResonseModelCopyWith<$Res> {
  __$TransferRecipientResonseModelCopyWithImpl(
      _TransferRecipientResonseModel _value,
      $Res Function(_TransferRecipientResonseModel) _then)
      : super(_value, (v) => _then(v as _TransferRecipientResonseModel));

  @override
  _TransferRecipientResonseModel get _value =>
      super._value as _TransferRecipientResonseModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
    Object? account_number = freezed,
    Object? bank_code = freezed,
    Object? currency = freezed,
  }) {
    return _then(_TransferRecipientResonseModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      account_number: account_number == freezed
          ? _value.account_number
          : account_number // ignore: cast_nullable_to_non_nullable
              as String,
      bank_code: bank_code == freezed
          ? _value.bank_code
          : bank_code // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferRecipientResonseModel
    implements _TransferRecipientResonseModel {
  const _$_TransferRecipientResonseModel(
      {required this.type,
      required this.name,
      required this.account_number,
      required this.bank_code,
      required this.currency});

  factory _$_TransferRecipientResonseModel.fromJson(
          Map<String, dynamic> json) =>
      _$_$_TransferRecipientResonseModelFromJson(json);

  @override
  final String type;
  @override
  final String name;
  @override
  final String account_number;
  @override
  final String bank_code;
  @override
  final String currency;

  @override
  String toString() {
    return 'TransferRecipientRequestModel(type: $type, name: $name, account_number: $account_number, bank_code: $bank_code, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferRecipientResonseModel &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.account_number, account_number) ||
                const DeepCollectionEquality()
                    .equals(other.account_number, account_number)) &&
            (identical(other.bank_code, bank_code) ||
                const DeepCollectionEquality()
                    .equals(other.bank_code, bank_code)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(account_number) ^
      const DeepCollectionEquality().hash(bank_code) ^
      const DeepCollectionEquality().hash(currency);

  @JsonKey(ignore: true)
  @override
  _$TransferRecipientResonseModelCopyWith<_TransferRecipientResonseModel>
      get copyWith => __$TransferRecipientResonseModelCopyWithImpl<
          _TransferRecipientResonseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferRecipientResonseModelToJson(this);
  }
}

abstract class _TransferRecipientResonseModel
    implements TransferRecipientRequestModel {
  const factory _TransferRecipientResonseModel(
      {required String type,
      required String name,
      required String account_number,
      required String bank_code,
      required String currency}) = _$_TransferRecipientResonseModel;

  factory _TransferRecipientResonseModel.fromJson(Map<String, dynamic> json) =
      _$_TransferRecipientResonseModel.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get account_number => throw _privateConstructorUsedError;
  @override
  String get bank_code => throw _privateConstructorUsedError;
  @override
  String get currency => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransferRecipientResonseModelCopyWith<_TransferRecipientResonseModel>
      get copyWith => throw _privateConstructorUsedError;
}
