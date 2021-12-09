// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankDataModel _$_$_BankDataModelFromJson(Map<String, dynamic> json) {
  return _$_BankDataModel(
    name: json['name'] as String,
    code: json['code'] as String,
    accountNumber: json['accountNumber'] as String?,
  );
}

Map<String, dynamic> _$_$_BankDataModelToJson(_$_BankDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'accountNumber': instance.accountNumber,
    };
