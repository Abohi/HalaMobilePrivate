import 'package:freezed_annotation/freezed_annotation.dart';

part 'subservice_model.freezed.dart';
part 'subservice_model.g.dart';

@freezed
class SubServiceModel with _$SubServiceModel{
  const factory SubServiceModel({required bool isActiveSubservice,required String userid, String? subserviceId})=_SubServiceModel;
  factory SubServiceModel.fromJson(Map<String, dynamic> json) => _$SubServiceModelFromJson(json);
}