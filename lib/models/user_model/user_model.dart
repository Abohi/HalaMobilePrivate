import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/profile_models/portfolio_model.dart';
import 'package:halawork/models/seller_setup_models/orgdetail_model/orgdetail_model.dart';
import 'package:halawork/models/user_model/rating_model/user_ratings.dart';
import 'package:halawork/models/user_model/wallet_model/wallet_model.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({ required String phoneNumber,@Default(false)  bool isPhoneNumberVerified,@Default(false)  bool isBuyer,@Default(false)  bool isSeller,
  String? firstName,String? lastName,String? optionalNumber,DateTime? dateOfBirth,
    String? sellerType,List<String>?skills,String? serviceId,
    String?service,String? serviceIcon,bool? isServiceDefault,List<String>?subServices,
  String?expertiseLevel,String? profilePictureUrl,
    String?profileDescriptionTitle,String?profileDescription,DateTime? joined,@Default(0.0) double completedOrders,@Default(0.0) double uncompletedOrders,@Default(0.0) double totalOrders,
  @Default("Available to work")String?available,UserRatingModel?ratings,Map<String,dynamic>? orgDetailModel,String? fcmtoken,String? email, WalletModel? wallet,String?documentId})=_UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

}


