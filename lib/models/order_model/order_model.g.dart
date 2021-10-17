// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$_$_OrderModelFromJson(Map<String, dynamic> json) {
  return _$_OrderModel(
    requestId: json['requestId'] as String,
    buyerId: json['buyerId'] as String,
    orderStatus: json['orderStatus'] as String,
    orderId: json['orderId'] as String,
    orderState: json['orderState'] as String,
    sellerId: json['sellerId'] as String,
    isPaid: json['isPaid'] as bool,
    isDispute: json['isDispute'] as bool,
    isSubmitted: json['isSubmitted'] as bool,
    requireExtension: json['requireExtension'] as bool,
    orderPaymentTime: json['orderPaymentTime'] == null
        ? null
        : DateTime.parse(json['orderPaymentTime'] as String),
    orderPaymentExpired: json['orderPaymentExpired'] as bool?,
    orderDeliveryTime: DateTime.parse(json['orderDeliveryTime'] as String),
    amount: json['amount'] as num,
    orderDeliveryTimeExpires: json['orderDeliveryTimeExpires'] as bool,
    fileTypeModel: json['fileTypeModel'] == null
        ? null
        : FileTypeModel.fromJson(json['fileTypeModel'] as Map<String, dynamic>),
    orderNote: json['orderNote'] as String?,
    actionType: json['actionType'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'buyerId': instance.buyerId,
      'orderStatus': instance.orderStatus,
      'orderId': instance.orderId,
      'orderState': instance.orderState,
      'sellerId': instance.sellerId,
      'isPaid': instance.isPaid,
      'isDispute': instance.isDispute,
      'isSubmitted': instance.isSubmitted,
      'requireExtension': instance.requireExtension,
      'orderPaymentTime': instance.orderPaymentTime?.toIso8601String(),
      'orderPaymentExpired': instance.orderPaymentExpired,
      'orderDeliveryTime': instance.orderDeliveryTime.toIso8601String(),
      'amount': instance.amount,
      'orderDeliveryTimeExpires': instance.orderDeliveryTimeExpires,
      'fileTypeModel': instance.fileTypeModel,
      'orderNote': instance.orderNote,
      'actionType': instance.actionType,
    };
