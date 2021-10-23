// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DisputeModel _$_$_DisputeModelFromJson(Map<String, dynamic> json) {
  return _$_DisputeModel(
    ticketType: json['ticketType'] as String,
    reason: json['reason'] as String,
    disputeCreatedTime: DateTime.parse(json['disputeCreatedTime'] as String),
    buyerId: json['buyerId'] as String,
    sellerId: json['sellerId'] as String,
    disputeStatus: json['disputeStatus'] as bool,
    disputeId: json['disputeId'] as String?,
  );
}

Map<String, dynamic> _$_$_DisputeModelToJson(_$_DisputeModel instance) =>
    <String, dynamic>{
      'ticketType': instance.ticketType,
      'reason': instance.reason,
      'disputeCreatedTime': instance.disputeCreatedTime.toIso8601String(),
      'buyerId': instance.buyerId,
      'sellerId': instance.sellerId,
      'disputeStatus': instance.disputeStatus,
      'disputeId': instance.disputeId,
    };
