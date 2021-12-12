import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_info_data_model.freezed.dart';
part 'account_info_data_model.g.dart';

@freezed
class AccountInfoDataModel with _$AccountInfoDataModel{
  const factory AccountInfoDataModel({
    required String account_number,required String account_name,String? bankCode,String? documentId
})=_AccountInfoDataModel;
  factory AccountInfoDataModel.fromJson(Map<String, dynamic> json) => _$AccountInfoDataModelFromJson(json);

}