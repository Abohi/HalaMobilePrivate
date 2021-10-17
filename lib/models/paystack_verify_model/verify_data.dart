
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_data.freezed.dart';
part 'verify_data.g.dart';

@freezed
class VerifyDataModel with _$VerifyDataModel{
  const factory VerifyDataModel({required String status,required String reference,required num amount
  ,required String paid_at,required String channel})=_VerifyDataModel;
  factory VerifyDataModel.fromJson(Map<String, dynamic> json) => _$VerifyDataModelFromJson(json);
}