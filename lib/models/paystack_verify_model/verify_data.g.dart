// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerifyDataModel _$_$_VerifyDataModelFromJson(Map<String, dynamic> json) {
  return _$_VerifyDataModel(
    status: json['status'] as String,
    reference: json['reference'] as String,
    amount: json['amount'] as num,
    paid_at: json['paid_at'] as String,
    channel: json['channel'] as String,
  );
}

Map<String, dynamic> _$_$_VerifyDataModelToJson(_$_VerifyDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reference': instance.reference,
      'amount': instance.amount,
      'paid_at': instance.paid_at,
      'channel': instance.channel,
    };
