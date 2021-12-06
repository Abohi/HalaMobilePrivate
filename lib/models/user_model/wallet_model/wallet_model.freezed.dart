// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
class _$WalletModelTearOff {
  const _$WalletModelTearOff();

  _WalletModel call(
      {required num? debitBalance,
      required num? creditBalance,
      required num? walletBalance}) {
    return _WalletModel(
      debitBalance: debitBalance,
      creditBalance: creditBalance,
      walletBalance: walletBalance,
    );
  }

  WalletModel fromJson(Map<String, Object> json) {
    return WalletModel.fromJson(json);
  }
}

/// @nodoc
const $WalletModel = _$WalletModelTearOff();

/// @nodoc
mixin _$WalletModel {
  num? get debitBalance => throw _privateConstructorUsedError;
  num? get creditBalance => throw _privateConstructorUsedError;
  num? get walletBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res>;
  $Res call({num? debitBalance, num? creditBalance, num? walletBalance});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res> implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  final WalletModel _value;
  // ignore: unused_field
  final $Res Function(WalletModel) _then;

  @override
  $Res call({
    Object? debitBalance = freezed,
    Object? creditBalance = freezed,
    Object? walletBalance = freezed,
  }) {
    return _then(_value.copyWith(
      debitBalance: debitBalance == freezed
          ? _value.debitBalance
          : debitBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      creditBalance: creditBalance == freezed
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      walletBalance: walletBalance == freezed
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
abstract class _$WalletModelCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$WalletModelCopyWith(
          _WalletModel value, $Res Function(_WalletModel) then) =
      __$WalletModelCopyWithImpl<$Res>;
  @override
  $Res call({num? debitBalance, num? creditBalance, num? walletBalance});
}

/// @nodoc
class __$WalletModelCopyWithImpl<$Res> extends _$WalletModelCopyWithImpl<$Res>
    implements _$WalletModelCopyWith<$Res> {
  __$WalletModelCopyWithImpl(
      _WalletModel _value, $Res Function(_WalletModel) _then)
      : super(_value, (v) => _then(v as _WalletModel));

  @override
  _WalletModel get _value => super._value as _WalletModel;

  @override
  $Res call({
    Object? debitBalance = freezed,
    Object? creditBalance = freezed,
    Object? walletBalance = freezed,
  }) {
    return _then(_WalletModel(
      debitBalance: debitBalance == freezed
          ? _value.debitBalance
          : debitBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      creditBalance: creditBalance == freezed
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as num?,
      walletBalance: walletBalance == freezed
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletModel implements _WalletModel {
  const _$_WalletModel(
      {required this.debitBalance,
      required this.creditBalance,
      required this.walletBalance});

  factory _$_WalletModel.fromJson(Map<String, dynamic> json) =>
      _$_$_WalletModelFromJson(json);

  @override
  final num? debitBalance;
  @override
  final num? creditBalance;
  @override
  final num? walletBalance;

  @override
  String toString() {
    return 'WalletModel(debitBalance: $debitBalance, creditBalance: $creditBalance, walletBalance: $walletBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WalletModel &&
            (identical(other.debitBalance, debitBalance) ||
                const DeepCollectionEquality()
                    .equals(other.debitBalance, debitBalance)) &&
            (identical(other.creditBalance, creditBalance) ||
                const DeepCollectionEquality()
                    .equals(other.creditBalance, creditBalance)) &&
            (identical(other.walletBalance, walletBalance) ||
                const DeepCollectionEquality()
                    .equals(other.walletBalance, walletBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(debitBalance) ^
      const DeepCollectionEquality().hash(creditBalance) ^
      const DeepCollectionEquality().hash(walletBalance);

  @JsonKey(ignore: true)
  @override
  _$WalletModelCopyWith<_WalletModel> get copyWith =>
      __$WalletModelCopyWithImpl<_WalletModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WalletModelToJson(this);
  }
}

abstract class _WalletModel implements WalletModel {
  const factory _WalletModel(
      {required num? debitBalance,
      required num? creditBalance,
      required num? walletBalance}) = _$_WalletModel;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$_WalletModel.fromJson;

  @override
  num? get debitBalance => throw _privateConstructorUsedError;
  @override
  num? get creditBalance => throw _privateConstructorUsedError;
  @override
  num? get walletBalance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WalletModelCopyWith<_WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}
