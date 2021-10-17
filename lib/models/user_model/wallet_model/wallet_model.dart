
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel{
const factory WalletModel({@Default(0.0)num debitBalance,@Default(0.0)num creditBalance,@Default(0.0)num walletBalance})=_WalletModel;
factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
}