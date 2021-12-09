// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bank_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankDataModel _$BankDataModelFromJson(Map<String, dynamic> json) {
  return _BankDataModel.fromJson(json);
}

/// @nodoc
class _$BankDataModelTearOff {
  const _$BankDataModelTearOff();

  _BankDataModel call(
      {required String name, required String code, String? accountNumber}) {
    return _BankDataModel(
      name: name,
      code: code,
      accountNumber: accountNumber,
    );
  }

  BankDataModel fromJson(Map<String, Object> json) {
    return BankDataModel.fromJson(json);
  }
}

/// @nodoc
const $BankDataModel = _$BankDataModelTearOff();

/// @nodoc
mixin _$BankDataModel {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankDataModelCopyWith<BankDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDataModelCopyWith<$Res> {
  factory $BankDataModelCopyWith(
          BankDataModel value, $Res Function(BankDataModel) then) =
      _$BankDataModelCopyWithImpl<$Res>;
  $Res call({String name, String code, String? accountNumber});
}

/// @nodoc
class _$BankDataModelCopyWithImpl<$Res>
    implements $BankDataModelCopyWith<$Res> {
  _$BankDataModelCopyWithImpl(this._value, this._then);

  final BankDataModel _value;
  // ignore: unused_field
  final $Res Function(BankDataModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BankDataModelCopyWith<$Res>
    implements $BankDataModelCopyWith<$Res> {
  factory _$BankDataModelCopyWith(
          _BankDataModel value, $Res Function(_BankDataModel) then) =
      __$BankDataModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, String code, String? accountNumber});
}

/// @nodoc
class __$BankDataModelCopyWithImpl<$Res>
    extends _$BankDataModelCopyWithImpl<$Res>
    implements _$BankDataModelCopyWith<$Res> {
  __$BankDataModelCopyWithImpl(
      _BankDataModel _value, $Res Function(_BankDataModel) _then)
      : super(_value, (v) => _then(v as _BankDataModel));

  @override
  _BankDataModel get _value => super._value as _BankDataModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_BankDataModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: accountNumber == freezed
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankDataModel implements _BankDataModel {
  const _$_BankDataModel(
      {required this.name, required this.code, this.accountNumber});

  factory _$_BankDataModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BankDataModelFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final String? accountNumber;

  @override
  String toString() {
    return 'BankDataModel(name: $name, code: $code, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankDataModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.accountNumber, accountNumber) ||
                const DeepCollectionEquality()
                    .equals(other.accountNumber, accountNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(accountNumber);

  @JsonKey(ignore: true)
  @override
  _$BankDataModelCopyWith<_BankDataModel> get copyWith =>
      __$BankDataModelCopyWithImpl<_BankDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BankDataModelToJson(this);
  }
}

abstract class _BankDataModel implements BankDataModel {
  const factory _BankDataModel(
      {required String name,
      required String code,
      String? accountNumber}) = _$_BankDataModel;

  factory _BankDataModel.fromJson(Map<String, dynamic> json) =
      _$_BankDataModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get code => throw _privateConstructorUsedError;
  @override
  String? get accountNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BankDataModelCopyWith<_BankDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
