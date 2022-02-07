import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_response_data_model.freezed.dart';
part 'transfer_response_data_model.g.dart';

@freezed
class TransferResponseDataModel with _$TransferResponseDataModel{
  const factory TransferResponseDataModel({required String reference,required num amount,required String reason,required String transfer_code,
  required String createdAt,String? documentId})=_TransferResponseDataModel;
  factory TransferResponseDataModel.fromJson(Map<String, dynamic> json) => _$TransferResponseDataModelFromJson(json);
}