import 'package:freezed_annotation/freezed_annotation.dart';
part 'work_entry_model.freezed.dart';
part 'work_entry_model.g.dart';


@freezed
class WorkEntryModel with _$WorkEntryModel{
  const factory WorkEntryModel({required String? companyName,required String? country,
    required String? positionHeld,required DateTime? dateWorkedFrom,required DateTime? dateResigned,String?documentId})=_WorkEntryModel;
  factory WorkEntryModel.fromJson(Map<String, dynamic> json) => _$WorkEntryModelFromJson(json);

}
