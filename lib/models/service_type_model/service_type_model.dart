import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/skills_model/skill_model.dart';
part 'service_type_model.freezed.dart';
part 'service_type_model.g.dart';

@freezed
class ServiceTypeModel with _$ServiceTypeModel{
  const factory ServiceTypeModel({required List<ServiceModel>? serviceModel,required SkillModel? skillModel})=_ServiceTypeModel;
  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) => _$ServiceTypeModelFromJson(json);

}