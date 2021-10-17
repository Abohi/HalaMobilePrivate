import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_payment.freezed.dart';
part 'order_payment.g.dart';

@freezed
class OrderPaymentModel with _$OrderPaymentModel{
const factory OrderPaymentModel({required String requestId,required String sellerId,required String buyerId,
required String orderId,required String amountPaid,required String paymentReference,required DateTime dateOfPayment})=_OrderPaymentModel;
factory OrderPaymentModel.fromJson(Map<String, dynamic> json) => _$OrderPaymentModelFromJson(json);
}