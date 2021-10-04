import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel{
  const factory NotificationModel({required String buyerId,required String requestId, @JsonKey(
  name: "createdAt",
  fromJson: dateTimeFromJson,
  toJson: dateTimeToJson,
  )  DateTime? createdAt,required String title,@Default(false) bool isOpen,String? notificationId})=_NotificationModel;
  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}
DateTime dateTimeFromJson(Timestamp timestamp) {
  return timestamp.toDate();
}

Timestamp dateTimeToJson(DateTime? date) => Timestamp.fromDate(date!);
