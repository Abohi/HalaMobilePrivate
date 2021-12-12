import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_recipient_request_model.freezed.dart';
part 'transfer_recipient_request_model.g.dart';

@freezed
class TransferRecipientRequestModel with _$TransferRecipientRequestModel{
  const factory TransferRecipientRequestModel({required String type,required String name,
  required String account_number,required String bank_code,required String currency})=_TransferRecipientResonseModel;
  factory TransferRecipientRequestModel.fromJson(Map<String, dynamic> json) => _$TransferRecipientRequestModelFromJson(json);
}