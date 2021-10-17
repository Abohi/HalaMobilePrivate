// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletModel _$_$_WalletModelFromJson(Map<String, dynamic> json) {
  return _$_WalletModel(
    debitBalance: json['debitBalance'] as num? ?? 0.0,
    creditBalance: json['creditBalance'] as num? ?? 0.0,
    walletBalance: json['walletBalance'] as num? ?? 0.0,
  );
}

Map<String, dynamic> _$_$_WalletModelToJson(_$_WalletModel instance) =>
    <String, dynamic>{
      'debitBalance': instance.debitBalance,
      'creditBalance': instance.creditBalance,
      'walletBalance': instance.walletBalance,
    };
