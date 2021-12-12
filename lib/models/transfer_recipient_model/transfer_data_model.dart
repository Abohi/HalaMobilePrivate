import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/transfer_recipient_model/transfer_user_details.dart';

part 'transfer_data_model.freezed.dart';
part 'transfer_data_model.g.dart';

@freezed
class TransferDataModel with _$TransferDataModel{
  const factory TransferDataModel({required String createdAt,required String recipient_code,required TransferUserDetailsModel details})=_TransferDataModel;
  factory TransferDataModel.fromJson(Map<String, dynamic> json) => _$TransferDataModelFromJson(json);
}