import 'package:flutter/material.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/models/seller_setup_models/work_entry_model/work_entry_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workEntryChangeNotifierProvider = ChangeNotifierProvider.autoDispose<WorkEntryListNotifier>((ref) {
  return WorkEntryListNotifier();
});

class WorkEntryListNotifier extends ChangeNotifier {
  final List<WorkEntryModel> workEntryModelList = [];

  void addEducationEntryModel(WorkEntryModel workEntryModel) {
    workEntryModelList.add(workEntryModel);
    notifyListeners();
  }
  void removeEducationEntryModel(int index){
    workEntryModelList.removeAt(index);
    notifyListeners();
  }
}