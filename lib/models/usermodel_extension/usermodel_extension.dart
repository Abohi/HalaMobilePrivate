import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:halawork/models/profile_models/portfolio_model.dart';
import 'package:halawork/models/seller_setup_models/achievement_entry_model/achievement_entry_model.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/models/seller_setup_models/orgdetail_model/orgdetail_model.dart';
import 'package:halawork/models/seller_setup_models/work_entry_model/work_entry_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/user_model/user_model.dart';

part 'usermodel_extension.freezed.dart';
part 'usermodel_extension.g.dart';

@freezed
class UserModelExtension with _$UserModelExtension{
  const factory UserModelExtension({required UserModel userModel,
    List<PortfolioModel>? portfolios,List<AchievementEntryModel>? achievementModels,
  List<EducationEntryModel>? educationModels,List<WorkEntryModel>? workEntrieModels,List<LocationModel>?locationModel,List<ActiveServiceModel>?serviceList,List<NotificationModel>? notificationModels})=_UserModelExtension;
  factory UserModelExtension.fromJson(Map<String, dynamic> json) => _$UserModelExtensionFromJson(json);
}