import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/paystack_verify_model/verify_data.dart';
part 'verify_model.freezed.dart';
part 'verify_model.g.dart';

@freezed
class VerifyModel with _$VerifyModel{
const factory VerifyModel({required bool status,required String message,required VerifyDataModel data})=_VerifyModel;
factory VerifyModel.fromJson(Map<String, dynamic> json) => _$VerifyModelFromJson(json);
}