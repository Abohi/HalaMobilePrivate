// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferModel _$_$_TransferModelFromJson(Map<String, dynamic> json) {
  return _$_TransferModel(
    source: json['source'] as String,
    amount: json['amount'] as String,
    recipient: json['recipient'] as String,
    reason: json['reason'] as String,
  );
}

Map<String, dynamic> _$_$_TransferModelToJson(_$_TransferModel instance) =>
    <String, dynamic>{
      'source': instance.source,
      'amount': instance.amount,
      'recipient': instance.recipient,
      'reason': instance.reason,
    };
