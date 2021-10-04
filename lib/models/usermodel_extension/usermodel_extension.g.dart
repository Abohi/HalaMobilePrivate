// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel_extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModelExtension _$_$_UserModelExtensionFromJson(
    Map<String, dynamic> json) {
  return _$_UserModelExtension(
    userModel: UserModel.fromJson(json['userModel'] as Map<String, dynamic>),
    portfolios: (json['portfolios'] as List<dynamic>?)
        ?.map((e) => PortfolioModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    achievementModels: (json['achievementModels'] as List<dynamic>?)
        ?.map((e) => AchievementEntryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    educationModels: (json['educationModels'] as List<dynamic>?)
        ?.map((e) => EducationEntryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    workEntrieModels: (json['workEntrieModels'] as List<dynamic>?)
        ?.map((e) => WorkEntryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    locationModel: (json['locationModel'] as List<dynamic>?)
        ?.map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    serviceList: (json['serviceList'] as List<dynamic>?)
        ?.map((e) => ActiveServiceModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    notificationModels: (json['notificationModels'] as List<dynamic>?)
        ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_UserModelExtensionToJson(
        _$_UserModelExtension instance) =>
    <String, dynamic>{
      'userModel': instance.userModel,
      'portfolios': instance.portfolios,
      'achievementModels': instance.achievementModels,
      'educationModels': instance.educationModels,
      'workEntrieModels': instance.workEntrieModels,
      'locationModel': instance.locationModel,
      'serviceList': instance.serviceList,
      'notificationModels': instance.notificationModels,
    };
