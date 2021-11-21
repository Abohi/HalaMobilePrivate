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
    isReviewed: json['isReviewed'] as bool?,
    requireExtension: json['requireExtension'] as bool,
    orderPaymentTime: dateTimeFromJson(json['orderPaymentTime'] as Timestamp?),
    orderPaymentExpired: json['orderPaymentExpired'] as bool?,
    orderDeliveryTime:
        dateTimeFromJson(json['orderDeliveryTime'] as Timestamp?),
    releaseFundTime: dateTimeFromJson(json['releaseFundTime'] as Timestamp?),
    amount: json['amount'] as num?,
    orderDeliveryTimeExpires: json['orderDeliveryTimeExpires'] as bool?,
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
      'isReviewed': instance.isReviewed,
      'requireExtension': instance.requireExtension,
      'orderPaymentTime': dateTimeToJson(instance.orderPaymentTime),
      'orderPaymentExpired': instance.orderPaymentExpired,
      'orderDeliveryTime': dateTimeToJson(instance.orderDeliveryTime),
      'releaseFundTime': dateTimeToJson(instance.releaseFundTime),
      'amount': instance.amount,
      'orderDeliveryTimeExpires': instance.orderDeliveryTimeExpires,
      'fileTypeModel': instance.fileTypeModel,
      'orderNote': instance.orderNote,
      'actionType': instance.actionType,
    };
