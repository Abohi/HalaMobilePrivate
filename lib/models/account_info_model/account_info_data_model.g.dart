// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountInfoDataModel _$_$_AccountInfoDataModelFromJson(
    Map<String, dynamic> json) {
  return _$_AccountInfoDataModel(
    account_number: json['account_number'] as String,
    account_name: json['account_name'] as String,
    bankName: json['bankName'] as String?,
    bankCode: json['bankCode'] as String?,
    documentId: json['documentId'] as String?,
  );
}

Map<String, dynamic> _$_$_AccountInfoDataModelToJson(
        _$_AccountInfoDataModel instance) =>
    <String, dynamic>{
      'account_number': instance.account_number,
      'account_name': instance.account_name,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'documentId': instance.documentId,
    };
