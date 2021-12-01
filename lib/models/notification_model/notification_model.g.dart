// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$_$_NotificationModelFromJson(Map<String, dynamic> json) {
  return _$_NotificationModel(
    buyerId: json['buyerId'] as String,
    requestId: json['requestId'] as String,
    createdAt: dateTimeFromJson(json['createdAt'] as Timestamp),
    title: json['title'] as String,
    isOpen: json['isOpen'] as bool? ?? false,
    notificationId: json['notificationId'] as String?,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$_$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'buyerId': instance.buyerId,
      'requestId': instance.requestId,
      'createdAt': dateTimeToJson(instance.createdAt),
      'title': instance.title,
      'isOpen': instance.isOpen,
      'notificationId': instance.notificationId,
      'body': instance.body,
    };
