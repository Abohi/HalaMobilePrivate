// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_recipient_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferRecipientResonseModel _$_$_TransferRecipientResonseModelFromJson(
    Map<String, dynamic> json) {
  return _$_TransferRecipientResonseModel(
    type: json['type'] as String,
    name: json['name'] as String,
    account_number: json['account_number'] as String,
    bank_code: json['bank_code'] as String,
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$_$_TransferRecipientResonseModelToJson(
        _$_TransferRecipientResonseModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'account_number': instance.account_number,
      'bank_code': instance.bank_code,
      'currency': instance.currency,
    };
