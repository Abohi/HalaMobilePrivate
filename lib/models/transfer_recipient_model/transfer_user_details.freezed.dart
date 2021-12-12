// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transfer_user_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferUserDetailsModel _$TransferUserDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _TransferUserDetailsModel.fromJson(json);
}

/// @nodoc
class _$TransferUserDetailsModelTearOff {
  const _$TransferUserDetailsModelTearOff();

  _TransferUserDetailsModel call(
      {required String account_number,
      required String account_name,
      required String bank_code,
      required String bank_name}) {
    return _TransferUserDetailsModel(
      account_number: account_number,
      account_name: account_name,
      bank_code: bank_code,
      bank_name: bank_name,
    );
  }

  TransferUserDetailsModel fromJson(Map<String, Object> json) {
    return TransferUserDetailsModel.fromJson(json);
  }
}

/// @nodoc
const $TransferUserDetailsModel = _$TransferUserDetailsModelTearOff();

/// @nodoc
mixin _$TransferUserDetailsModel {
  String get account_number => throw _privateConstructorUsedError;
  String get account_name => throw _privateConstructorUsedError;
  String get bank_code => throw _privateConstructorUsedError;
  String get bank_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferUserDetailsModelCopyWith<TransferUserDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferUserDetailsModelCopyWith<$Res> {
  factory $TransferUserDetailsModelCopyWith(TransferUserDetailsModel value,
          $Res Function(TransferUserDetailsModel) then) =
      _$TransferUserDetailsModelCopyWithImpl<$Res>;
  $Res call(
      {String account_number,
      String account_name,
      String bank_code,
      String bank_name});
}

/// @nodoc
class _$TransferUserDetailsModelCopyWithImpl<$Res>
    implements $TransferUserDetailsModelCopyWith<$Res> {
  _$TransferUserDetailsModelCopyWithImpl(this._value, this._then);

  final TransferUserDetailsModel _value;
  // ignore: unused_field
  final $Res Function(TransferUserDetailsModel) _then;

  @override
  $Res call({
    Object? account_number = freezed,
    Object? account_name = freezed,
    Object? bank_code = freezed,
    Object? bank_name = freezed,
  }) {
    return _then(_value.copyWith(
      account_number: account_number == freezed
          ? _value.account_number
          : account_number // ignore: cast_nullable_to_non_nullable
              as String,
      account_name: account_name == freezed
          ? _value.account_name
          : account_name // ignore: cast_nullable_to_non_nullable
              as String,
      bank_code: bank_code == freezed
          ? _value.bank_code
          : bank_code // ignore: cast_nullable_to_non_nullable
              as String,
      bank_name: bank_name == freezed
          ? _value.bank_name
          : bank_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TransferUserDetailsModelCopyWith<$Res>
    implements $TransferUserDetailsModelCopyWith<$Res> {
  factory _$TransferUserDetailsModelCopyWith(_TransferUserDetailsModel value,
          $Res Function(_TransferUserDetailsModel) then) =
      __$TransferUserDetailsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String account_number,
      String account_name,
      String bank_code,
      String bank_name});
}

/// @nodoc
class __$TransferUserDetailsModelCopyWithImpl<$Res>
    extends _$TransferUserDetailsModelCopyWithImpl<$Res>
    implements _$TransferUserDetailsModelCopyWith<$Res> {
  __$TransferUserDetailsModelCopyWithImpl(_TransferUserDetailsModel _value,
      $Res Function(_TransferUserDetailsModel) _then)
      : super(_value, (v) => _then(v as _TransferUserDetailsModel));

  @override
  _TransferUserDetailsModel get _value =>
      super._value as _TransferUserDetailsModel;

  @override
  $Res call({
    Object? account_number = freezed,
    Object? account_name = freezed,
    Object? bank_code = freezed,
    Object? bank_name = freezed,
  }) {
    return _then(_TransferUserDetailsModel(
      account_number: account_number == freezed
          ? _value.account_number
          : account_number // ignore: cast_nullable_to_non_nullable
              as String,
      account_name: account_name == freezed
          ? _value.account_name
          : account_name // ignore: cast_nullable_to_non_nullable
              as String,
      bank_code: bank_code == freezed
          ? _value.bank_code
          : bank_code // ignore: cast_nullable_to_non_nullable
              as String,
      bank_name: bank_name == freezed
          ? _value.bank_name
          : bank_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferUserDetailsModel implements _TransferUserDetailsModel {
  const _$_TransferUserDetailsModel(
      {required this.account_number,
      required this.account_name,
      required this.bank_code,
      required this.bank_name});

  factory _$_TransferUserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TransferUserDetailsModelFromJson(json);

  @override
  final String account_number;
  @override
  final String account_name;
  @override
  final String bank_code;
  @override
  final String bank_name;

  @override
  String toString() {
    return 'TransferUserDetailsModel(account_number: $account_number, account_name: $account_name, bank_code: $bank_code, bank_name: $bank_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransferUserDetailsModel &&
            (identical(other.account_number, account_number) ||
                const DeepCollectionEquality()
                    .equals(other.account_number, account_number)) &&
            (identical(other.account_name, account_name) ||
                const DeepCollectionEquality()
                    .equals(other.account_name, account_name)) &&
            (identical(other.bank_code, bank_code) ||
                const DeepCollectionEquality()
                    .equals(other.bank_code, bank_code)) &&
            (identical(other.bank_name, bank_name) ||
                const DeepCollectionEquality()
                    .equals(other.bank_name, bank_name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account_number) ^
      const DeepCollectionEquality().hash(account_name) ^
      const DeepCollectionEquality().hash(bank_code) ^
      const DeepCollectionEquality().hash(bank_name);

  @JsonKey(ignore: true)
  @override
  _$TransferUserDetailsModelCopyWith<_TransferUserDetailsModel> get copyWith =>
      __$TransferUserDetailsModelCopyWithImpl<_TransferUserDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransferUserDetailsModelToJson(this);
  }
}

abstract class _TransferUserDetailsModel implements TransferUserDetailsModel {
  const factory _TransferUserDetailsModel(
      {required String account_number,
      required String account_name,
      required String bank_code,
      required String bank_name}) = _$_TransferUserDetailsModel;

  factory _TransferUserDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_TransferUserDetailsModel.fromJson;

  @override
  String get account_number => throw _privateConstructorUsedError;
  @override
  String get account_name => throw _privateConstructorUsedError;
  @override
  String get bank_code => throw _privateConstructorUsedError;
  @override
  String get bank_name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransferUserDetailsModelCopyWith<_TransferUserDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
