// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderPaymentModel _$_$_OrderPaymentModelFromJson(Map<String, dynamic> json) {
  return _$_OrderPaymentModel(
    requestId: json['requestId'] as String,
    sellerId: json['sellerId'] as String,
    buyerId: json['buyerId'] as String,
    orderId: json['orderId'] as String,
    amountPaid: json['amountPaid'] as String,
    paymentReference: json['paymentReference'] as String,
    dateOfPayment: DateTime.parse(json['dateOfPayment'] as String),
  );
}

Map<String, dynamic> _$_$_OrderPaymentModelToJson(
        _$_OrderPaymentModel instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'sellerId': instance.sellerId,
      'buyerId': instance.buyerId,
      'orderId': instance.orderId,
      'amountPaid': instance.amountPaid,
      'paymentReference': instance.paymentReference,
      'dateOfPayment': instance.dateOfPayment.toIso8601String(),
    };
