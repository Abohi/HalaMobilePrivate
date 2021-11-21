import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/order_model/file_type_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel{

  const factory OrderModel({required String requestId,required String buyerId,required String orderStatus,required String orderId,
  required String orderState,required String sellerId,required bool isPaid,required bool isDispute,required bool isSubmitted,bool?isReviewed,
  required bool requireExtension,@JsonKey(
      name: "orderPaymentTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson,
    )  DateTime? orderPaymentTime,required bool? orderPaymentExpired,@JsonKey(
      name: "orderDeliveryTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson,
    )  DateTime? orderDeliveryTime,@JsonKey(
      name: "releaseFundTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson,
    )  DateTime? releaseFundTime,required num? amount,
  required bool? orderDeliveryTimeExpires,FileTypeModel? fileTypeModel,String? orderNote,String? actionType})=_OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}


DateTime? dateTimeFromJson(Timestamp? timestamp) {
  if(timestamp==null)
    return null;
  return timestamp.toDate();
}

Timestamp dateTimeToJson(DateTime? date) => Timestamp.fromDate(date!);