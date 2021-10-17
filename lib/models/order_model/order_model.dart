import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/order_model/file_type_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel{
  const factory OrderModel({required String requestId,required String buyerId,required String orderStatus,required String orderId,
  required String orderState,required String sellerId,required bool isPaid,required bool isDispute,required bool isSubmitted,
  required bool requireExtension,required DateTime? orderPaymentTime,required bool? orderPaymentExpired,required DateTime orderDeliveryTime,required num amount,
  required bool orderDeliveryTimeExpires,FileTypeModel? fileTypeModel,String? orderNote,String? actionType})=_OrderModel;
  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}


