import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
class SkillModel with _$SkillModel{
  const factory SkillModel({required List<String?>skills})=_SkillModel;
  factory SkillModel.fromJson(Map<String, dynamic> json) => _$SkillModelFromJson(json);
}