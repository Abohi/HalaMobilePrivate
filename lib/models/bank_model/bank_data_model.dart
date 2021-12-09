import 'package:freezed_annotation/freezed_annotation.dart';
part 'bank_data_model.freezed.dart';
part 'bank_data_model.g.dart';

@freezed
class BankDataModel with _$BankDataModel{
  const factory BankDataModel({required String name,required String code,String? accountNumber})=_BankDataModel;
  factory BankDataModel.fromJson(Map<String, dynamic> json) => _$BankDataModelFromJson(json);

}