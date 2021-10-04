import 'package:freezed_annotation/freezed_annotation.dart';
part 'active_service_model.freezed.dart';
part 'active_service_model.g.dart';

@freezed
class ActiveServiceModel with _$ActiveServiceModel{
  const factory ActiveServiceModel({required String? service,required bool? isDefault,required String? icon,required List<String>?subservices,String? serviceId})=_ActiveServiceModel;
  factory ActiveServiceModel.fromJson(Map<String, dynamic> json) => _$ActiveServiceModelFromJson(json);

}