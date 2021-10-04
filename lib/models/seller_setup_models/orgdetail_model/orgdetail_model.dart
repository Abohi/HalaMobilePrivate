import 'package:freezed_annotation/freezed_annotation.dart';

part 'orgdetail_model.freezed.dart';
part 'orgdetail_model.g.dart';

@freezed
class OrgDetailModel with _$OrgDetailModel{
  const factory OrgDetailModel({required String companiesName,required String companiesDescription
  ,required String companiesNumber,required String firstName,required String lastName,required DateTime dateFounded})=_OrgDetailModel;
  factory OrgDetailModel.fromJson(Map<String, dynamic> json) => _$OrgDetailModelFromJson(json);
}
