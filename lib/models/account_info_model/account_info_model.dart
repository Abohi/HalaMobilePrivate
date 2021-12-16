import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/account_info_model/account_info_data_model.dart';
part 'account_info_model.freezed.dart';
part 'account_info_model.g.dart';

@freezed
class AccountInfoModel with _$AccountInfoModel{
  const factory AccountInfoModel({required bool status,required String message,AccountInfoDataModel? data})=_AccountInfoModel;
  factory AccountInfoModel.fromJson(Map<String, dynamic> json) => _$AccountInfoModelFromJson(json);

}