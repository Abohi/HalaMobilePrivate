import 'package:freezed_annotation/freezed_annotation.dart';
part 'achievement_entry_model.freezed.dart';
part 'achievement_entry_model.g.dart';


@freezed
class AchievementEntryModel with _$AchievementEntryModel{
  const factory AchievementEntryModel({required String? achievementName,required String? achievementDescription,String?documentId})=_AchievementEntryModel;
  factory AchievementEntryModel.fromJson(Map<String, dynamic> json) => _$AchievementEntryModelFromJson(json);

}

