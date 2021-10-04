import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_description_entry_model.freezed.dart';
part 'profile_description_entry_model.g.dart';


@freezed
class ProfileDescEntryModel with _$ProfileDescEntryModel{
  const factory ProfileDescEntryModel({required String? title,required String? description,@Default(false)  bool isOrganization})=_ProfileDescEntryModel;
  factory ProfileDescEntryModel.fromJson(Map<String, dynamic> json) => _$ProfileDescEntryModelFromJson(json);

}


