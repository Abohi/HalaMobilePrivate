import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_request_model.freezed.dart';
part 'create_request_model.g.dart';
@freezed
class CreateRequestModel with _$CreateRequestModel{
  const factory CreateRequestModel({required String service,required List<String>subServices,
    required List<String>skills,required String serviceId,required String state,
    required String localGovt,
    required String userId,String? requestId,required bool requestStatus,
    required String title,required String description,required String budget,required String date
  })=_CreateRequestModel;
  factory CreateRequestModel.fromJson(Map<String, dynamic> json) => _$CreateRequestModelFromJson(json);
}