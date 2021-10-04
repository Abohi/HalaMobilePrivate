import 'package:flutter/material.dart';
import 'package:halawork/models/seller_setup_models/achievement_entry_model/achievement_entry_model.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/models/seller_setup_models/work_entry_model/work_entry_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final achievementEntryChangeNotifierProvider = ChangeNotifierProvider.autoDispose<AchievementEntryListNotifier>((ref) {
  return AchievementEntryListNotifier();
});

class AchievementEntryListNotifier extends ChangeNotifier {
  final List<AchievementEntryModel> achievementEntryModelList = [];

  void addAchievementEntryModel(AchievementEntryModel achievementEntryModel) {
    achievementEntryModelList.add(achievementEntryModel);
    notifyListeners();
  }
  void removeAchievementEntryModel(int index){
    achievementEntryModelList.removeAt(index);
    notifyListeners();
  }
}