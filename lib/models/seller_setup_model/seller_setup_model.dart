import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/seller_setup_models/achievement_entry_model/achievement_entry_model.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/models/seller_setup_models/orgdetail_model/orgdetail_model.dart';
import 'package:halawork/models/seller_setup_models/profile_description_entry_model/profile_description_entry_model.dart';
import 'package:halawork/models/seller_setup_models/work_entry_model/work_entry_model.dart';
part 'seller_setup_model.freezed.dart';
part 'seller_setup_model.g.dart';


@freezed
class SellerSetupModel with _$SellerSetupModel{
  const factory SellerSetupModel({required String? sellerType,String?saveService,List<String>? saveSubService,
  List<String>?saveSkills,bool?saveServiceType,String? saveIcon,String? saveExpertiseType,List<EducationEntryModel>? saveEducationEntryModel,List<WorkEntryModel>? saveWorkEntryModel,List<AchievementEntryModel>? saveAchievementList,
    ProfileDescEntryModel? saveProfileDescModel,String? saveProfilePhoto,String?serviceId,OrgDetailModel? orgDetailModel,List<LocationModel>?locationModel})=_SellerSetupModel;
  factory SellerSetupModel.fromJson(Map<String, dynamic> json) => _$SellerSetupModelFromJson(json);

}