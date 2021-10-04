import 'package:flutter/material.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationEntryChangeNotifierProvider = ChangeNotifierProvider.autoDispose<LocationEntryListNotifier>((ref) {
  return LocationEntryListNotifier();
});

class LocationEntryListNotifier extends ChangeNotifier {
  final List<LocationModel> locationEntryModelList = [];

  void addLocationEntryModel(LocationModel locationModel) {
    locationEntryModelList.add(locationModel);
    notifyListeners();
  }
  void removeLocationEntryModel(int index){
    locationEntryModelList.removeAt(index);
    notifyListeners();
  }
}