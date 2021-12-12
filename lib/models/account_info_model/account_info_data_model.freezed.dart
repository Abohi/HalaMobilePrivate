// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'account_info_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountInfoDataModel _$AccountInfoDataModelFromJson(Map<String, dynamic> json) {
  return _AccountInfoDataModel.fromJson(json);
}

/// @nodoc
class _$AccountInfoDataModelTearOff {
  const _$AccountInfoDataModelTearOff();

  _AccountInfoDataModel call(
      {required String account_number,
      required String account_name,
      String? bankCode,
      String? documentId}) {
    return _AccountInfoDataModel(
      account_number: account_number,
      account_name: account_name,
      bankCode: bankCode,
      documentId: documentId,
    );
  }

  AccountInfoDataModel fromJson(Map<String, Object> json) {
    return AccountInfoDataModel.fromJson(json);
  }
}

/// @nodoc
const $AccountInfoDataModel = _$AccountInfoDataModelTearOff();

/// @nodoc
mixin _$AccountInfoDataModel {
  String get account_number => throw _privateConstructorUsedError;
  String get account_name => throw _privateConstructorUsedError;
  String? get bankCode => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountInfoDataModelCopyWith<AccountInfoDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountInfoDataModelCopyWith<$Res> {
  factory $AccountInfoDataModelCopyWith(AccountInfoDataModel value,
          $Res Function(AccountInfoDataModel) then) =
      _$AccountInfoDataModelCopyWithImpl<$Res>;
  $Res call(
      {String account_number,
      String account_name,
      String? bankCode,
      String? documentId});
}

/// @nodoc
class _$AccountInfoDataModelCopyWithImpl<$Res>
    implements $AccountInfoDataModelCopyWith<$Res> {
  _$AccountInfoDataModelCopyWithImpl(this._value, this._then);

  final AccountInfoDataModel _value;
  // ignore: unused_field
  final $Res Function(AccountInfoDataModel) _then;

  @override
  $Res call({
    Object? account_number = freezed,
    Object? account_name = freezed,
    Object? bankCode = freezed,
    Object? documentId = freezed,
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
      bankCode: bankCode == freezed
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AccountInfoDataModelCopyWith<$Res>
    implements $AccountInfoDataModelCopyWith<$Res> {
  factory _$AccountInfoDataModelCopyWith(_AccountInfoDataModel value,
          $Res Function(_AccountInfoDataModel) then) =
      __$AccountInfoDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String account_number,
      String account_name,
      String? bankCode,
      String? documentId});
}

/// @nodoc
class __$AccountInfoDataModelCopyWithImpl<$Res>
    extends _$AccountInfoDataModelCopyWithImpl<$Res>
    implements _$AccountInfoDataModelCopyWith<$Res> {
  __$AccountInfoDataModelCopyWithImpl(
      _AccountInfoDataModel _value, $Res Function(_AccountInfoDataModel) _then)
      : super(_value, (v) => _then(v as _AccountInfoDataModel));

  @override
  _AccountInfoDataModel get _value => super._value as _AccountInfoDataModel;

  @override
  $Res call({
    Object? account_number = freezed,
    Object? account_name = freezed,
    Object? bankCode = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_AccountInfoDataModel(
      account_number: account_number == freezed
          ? _value.account_number
          : account_number // ignore: cast_nullable_to_non_nullable
              as String,
      account_name: account_name == freezed
          ? _value.account_name
          : account_name // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: bankCode == freezed
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountInfoDataModel implements _AccountInfoDataModel {
  const _$_AccountInfoDataModel(
      {required this.account_number,
      required this.account_name,
      this.bankCode,
      this.documentId});

  factory _$_AccountInfoDataModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AccountInfoDataModelFromJson(json);

  @override
  final String account_number;
  @override
  final String account_name;
  @override
  final String? bankCode;
  @override
  final String? documentId;

  @override
  String toString() {
    return 'AccountInfoDataModel(account_number: $account_number, account_name: $account_name, bankCode: $bankCode, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountInfoDataModel &&
            (identical(other.account_number, account_number) ||
                const DeepCollectionEquality()
                    .equals(other.account_number, account_number)) &&
            (identical(other.account_name, account_name) ||
                const DeepCollectionEquality()
                    .equals(other.account_name, account_name)) &&
            (identical(other.bankCode, bankCode) ||
                const DeepCollectionEquality()
                    .equals(other.bankCode, bankCode)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account_number) ^
      const DeepCollectionEquality().hash(account_name) ^
      const DeepCollectionEquality().hash(bankCode) ^
      const DeepCollectionEquality().hash(documentId);

  @JsonKey(ignore: true)
  @override
  _$AccountInfoDataModelCopyWith<_AccountInfoDataModel> get copyWith =>
      __$AccountInfoDataModelCopyWithImpl<_AccountInfoDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountInfoDataModelToJson(this);
  }
}

abstract class _AccountInfoDataModel implements AccountInfoDataModel {
  const factory _AccountInfoDataModel(
      {required String account_number,
      required String account_name,
      String? bankCode,
      String? documentId}) = _$_AccountInfoDataModel;

  factory _AccountInfoDataModel.fromJson(Map<String, dynamic> json) =
      _$_AccountInfoDataModel.fromJson;

  @override
  String get account_number => throw _privateConstructorUsedError;
  @override
  String get account_name => throw _privateConstructorUsedError;
  @override
  String? get bankCode => throw _privateConstructorUsedError;
  @override
  String? get documentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccountInfoDataModelCopyWith<_AccountInfoDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
