// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferUserDetailsModel _$_$_TransferUserDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _$_TransferUserDetailsModel(
    account_number: json['account_number'] as String,
    account_name: json['account_name'] as String,
    bank_code: json['bank_code'] as String,
    bank_name: json['bank_name'] as String,
  );
}

Map<String, dynamic> _$_$_TransferUserDetailsModelToJson(
        _$_TransferUserDetailsModel instance) =>
    <String, dynamic>{
      'account_number': instance.account_number,
      'account_name': instance.account_name,
      'bank_code': instance.bank_code,
      'bank_name': instance.bank_name,
    };
