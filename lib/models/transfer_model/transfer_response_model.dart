import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/transfer_model/transfer_response_data_model.dart';

part 'transfer_response_model.freezed.dart';
part 'transfer_response_model.g.dart';

@freezed
class TransferResponseModel with _$TransferResponseModel{
  const factory TransferResponseModel({required bool status,required String message,required TransferResponseDataModel data})=_TransferResponseModel;
  factory TransferResponseModel.fromJson(Map<String, dynamic> json) => _$TransferResponseModelFromJson(json);
}