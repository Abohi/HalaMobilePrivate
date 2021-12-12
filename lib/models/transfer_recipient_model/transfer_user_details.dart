import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_user_details.freezed.dart';
part 'transfer_user_details.g.dart';
@freezed
class TransferUserDetailsModel with _$TransferUserDetailsModel{
  const factory TransferUserDetailsModel({required String account_number,required String account_name,
  required String bank_code,required String bank_name})=_TransferUserDetailsModel;
  factory TransferUserDetailsModel.fromJson(Map<String, dynamic> json) => _$TransferUserDetailsModelFromJson(json);
}