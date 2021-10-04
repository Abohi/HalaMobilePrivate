import 'package:freezed_annotation/freezed_annotation.dart';
part 'education_entry_model.freezed.dart';
part 'education_entry_model.g.dart';


@freezed
class EducationEntryModel with _$EducationEntryModel{
  const factory EducationEntryModel({required String? schoolName,required String? areaOfStudy,
    required String? degree,required DateTime? dateAttended,required DateTime? dateEnded,String?documentId})=_EducationEntryModel;
  factory EducationEntryModel.fromJson(Map<String, dynamic> json) => _$EducationEntryModelFromJson(json);

}
