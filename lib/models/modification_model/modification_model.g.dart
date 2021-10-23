// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModificationModel _$_$_ModificationModelFromJson(Map<String, dynamic> json) {
  return _$_ModificationModel(
    reason: json['reason'] as String,
    amount: json['amount'] as num?,
    amountString: json['amountString'] as String?,
    buyerId: json['buyerId'] as String,
    sellerId: json['sellerId'] as String,
    createdDate: DateTime.parse(json['createdDate'] as String),
    requestTitle: json['requestTitle'] as String,
    time: dateTimeFromJson(json['time'] as Timestamp),
    decisionTime: DateTime.parse(json['decisionTime'] as String),
  );
}

Map<String, dynamic> _$_$_ModificationModelToJson(
        _$_ModificationModel instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'amount': instance.amount,
      'amountString': instance.amountString,
      'buyerId': instance.buyerId,
      'sellerId': instance.sellerId,
      'createdDate': instance.createdDate.toIso8601String(),
      'requestTitle': instance.requestTitle,
      'time': dateTimeToJson(instance.time),
      'decisionTime': instance.decisionTime.toIso8601String(),
    };
