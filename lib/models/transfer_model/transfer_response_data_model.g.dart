// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_response_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferResponseDataModel _$_$_TransferResponseDataModelFromJson(
    Map<String, dynamic> json) {
  return _$_TransferResponseDataModel(
    reference: json['reference'] as String,
    amount: json['amount'] as num,
    reason: json['reason'] as String,
    transfer_code: json['transfer_code'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$_$_TransferResponseDataModelToJson(
        _$_TransferResponseDataModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'amount': instance.amount,
      'reason': instance.reason,
      'transfer_code': instance.transfer_code,
      'createdAt': instance.createdAt,
    };
