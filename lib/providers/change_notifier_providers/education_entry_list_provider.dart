import 'package:flutter/material.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final educationEntryChangeNotifierProvider = ChangeNotifierProvider.autoDispose<EducationEntryListNotifier>((ref) {
  return EducationEntryListNotifier();
});

class EducationEntryListNotifier extends ChangeNotifier {
  final List<EducationEntryModel> educationEntryModelList = [];

  void addEducationEntryModel(EducationEntryModel educationEntryModel) {
    educationEntryModelList.add(educationEntryModel);
    notifyListeners();
  }
  void removeEducationEntryModel(int index){
    educationEntryModelList.removeAt(index);
    notifyListeners();
  }
}