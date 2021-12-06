// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletModel _$_$_WalletModelFromJson(Map<String, dynamic> json) {
  return _$_WalletModel(
    debitBalance: json['debitBalance'] as num?,
    creditBalance: json['creditBalance'] as num?,
    walletBalance: json['walletBalance'] as num?,
  );
}

Map<String, dynamic> _$_$_WalletModelToJson(_$_WalletModel instance) =>
    <String, dynamic>{
      'debitBalance': instance.debitBalance,
      'creditBalance': instance.creditBalance,
      'walletBalance': instance.walletBalance,
    };
