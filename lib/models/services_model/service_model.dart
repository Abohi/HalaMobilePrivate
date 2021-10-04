import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel{
  const factory ServiceModel({required String? name,required bool? isDafault,required String? icon,required List<String>?value,String? serviceId})=_ServiceModel;
  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

}