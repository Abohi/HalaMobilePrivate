import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/bank_model/bank_data_model.dart';
part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel{
  const factory BankModel({required bool status,required String message,required List<BankDataModel>data})=_ActiveServiceModel;
  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);

}