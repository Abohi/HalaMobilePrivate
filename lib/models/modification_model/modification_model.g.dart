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
    createdDate: dateTimeFromJson(json['createdDate'] as Timestamp?),
    requestTitle: json['requestTitle'] as String,
    time: dateTimeFromJson(json['time'] as Timestamp?),
    decisionTime: dateTimeFromJson(json['decisionTime'] as Timestamp?),
    modificationId: json['modificationId'] as String?,
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
      'createdDate': dateTimeToJson(instance.createdDate),
      'requestTitle': instance.requestTitle,
      'time': dateTimeToJson(instance.time),
      'decisionTime': dateTimeToJson(instance.decisionTime),
      'modificationId': instance.modificationId,
    };
