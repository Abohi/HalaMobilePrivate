// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_setup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SellerSetupModel _$_$_SellerSetupModelFromJson(Map<String, dynamic> json) {
  return _$_SellerSetupModel(
    sellerType: json['sellerType'] as String?,
    saveService: json['saveService'] as String?,
    saveSubService: (json['saveSubService'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    saveSkills: (json['saveSkills'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    saveServiceType: json['saveServiceType'] as bool?,
    saveIcon: json['saveIcon'] as String?,
    saveExpertiseType: json['saveExpertiseType'] as String?,
    saveEducationEntryModel: (json['saveEducationEntryModel'] as List<dynamic>?)
        ?.map((e) => EducationEntryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    saveWorkEntryModel: (json['saveWorkEntryModel'] as List<dynamic>?)
        ?.map((e) => WorkEntryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    saveAchievementList: (json['saveAchievementList'] as List<dynamic>?)
        ?.map((e) => AchievementEntryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    saveProfileDescModel: json['saveProfileDescModel'] == null
        ? null
        : ProfileDescEntryModel.fromJson(
            json['saveProfileDescModel'] as Map<String, dynamic>),
    saveProfilePhoto: json['saveProfilePhoto'] as String?,
    serviceId: json['serviceId'] as String?,
    orgDetailModel: json['orgDetailModel'] == null
        ? null
        : OrgDetailModel.fromJson(
            json['orgDetailModel'] as Map<String, dynamic>),
    locationModel: (json['locationModel'] as List<dynamic>?)
        ?.map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SellerSetupModelToJson(
        _$_SellerSetupModel instance) =>
    <String, dynamic>{
      'sellerType': instance.sellerType,
      'saveService': instance.saveService,
      'saveSubService': instance.saveSubService,
      'saveSkills': instance.saveSkills,
      'saveServiceType': instance.saveServiceType,
      'saveIcon': instance.saveIcon,
      'saveExpertiseType': instance.saveExpertiseType,
      'saveEducationEntryModel':
          instance.saveEducationEntryModel?.map((e) => e.toJson()).toList(),
      'saveWorkEntryModel':
          instance.saveWorkEntryModel?.map((e) => e.toJson()).toList(),
      'saveAchievementList':
          instance.saveAchievementList?.map((e) => e.toJson()).toList(),
      'saveProfileDescModel': instance.saveProfileDescModel?.toJson(),
      'saveProfilePhoto': instance.saveProfilePhoto,
      'serviceId': instance.serviceId,
      'orgDetailModel': instance.orgDetailModel?.toJson(),
      'locationModel': instance.locationModel?.map((e) => e.toJson()).toList(),
    };
