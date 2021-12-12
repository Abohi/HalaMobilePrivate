import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/transfer_recipient_model/transfer_data_model.dart';

part 'transfer_recipient_model.freezed.dart';
part 'transfer_recipient_model.g.dart';

@freezed
class TransferRecipientModel with _$TransferRecipientModel{
  const factory TransferRecipientModel({required bool status, required String message,required TransferDataModel data})=_TransferRecipientModel;
  factory TransferRecipientModel.fromJson(Map<String, dynamic> json) => _$TransferRecipientModelFromJson(json);
}