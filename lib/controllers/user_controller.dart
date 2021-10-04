import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/inbox_model/inbox_model.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/seller_setup_model/seller_setup_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/providers/exception_provider/exception_provider.dart';
import 'package:halawork/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userControllerProvider = StateNotifierProvider<UserController, UserModelExtension?>(
      (ref) => UserController(ref.read),
);

class UserController extends StateNotifier<UserModelExtension?> {
  final Reader _read;

  StreamSubscription<UserModelExtension>? userModelChangesSubscription;

  UserController(this._read) : super(null) {
    userModelChangesSubscription?.cancel();
    userModelChangesSubscription = _read(userRepositoryProvider)
        .getUserModelExtension(_read(authControllerProvider)!.uid)
        .listen((user) => state = user);
  }
  Future<void> saveBasicSellerInfo(UserModel userModel) async{
    try {
     await _read(userRepositoryProvider).saveBasicSellerInfo(userModel);
    } on CustomException catch (e) {
      _read(exceptionMessageProvider).state = e;
    }
  }
  Future<void> completeSellerProfileSetup(SellerSetupModel sellerSetupModel)async{
    try{
      await _read(userRepositoryProvider).completeSellerProfileSetup(sellerSetupModel);
    }on CustomException catch (e){
      _read(exceptionMessageProvider).state = e;
    }
  }

  Future<void>createRequest(CreateRequestModel createRequestModel)async{
    try{
      await _read(userRepositoryProvider).createRequest(createRequestModel);
    }on CustomException catch (e){
      _read(exceptionMessageProvider).state = e;
    }
  }

  Stream<List<CreateRequestModel>> getRequests(){
    return  _read(userRepositoryProvider).getRequests();
  }
  Stream<List<OfferModel>>getOffers(String buyerId,String requestId){
    return _read(userRepositoryProvider).getOffers(buyerId, requestId);
  }
  Future<void> sendOffer(String sellerId, String requestId, String buyerId, OfferModel offerModel)async{
    return  await _read(userRepositoryProvider).sendOffer(sellerId, requestId, buyerId, offerModel);
  }
  Stream<List<NotificationModel>> getNotifications(String userId){
    return _read(userRepositoryProvider).getNotifications(userId);
  }

  Future<CreateRequestModel?> getRequest(String requestId)async{
    try{
     return  await _read(userRepositoryProvider).getRequest(requestId);
    }on CustomException catch (e){
      _read(exceptionMessageProvider).state = e;
    }
  }

  Future<void> updateNotification(String userId, NotificationModel notificationModel)async{
    try{
      await _read(userRepositoryProvider).updateNotification(userId, notificationModel);
    }on CustomException catch (e){
      _read(exceptionMessageProvider).state = e;
    }
  }

  Stream<List<InboxModel>> getMessages(String buyerId,String sellerId){
    return _read(userRepositoryProvider).getMessages(buyerId, sellerId);
  }
  Future<void> uploadMessage(String message,{String? sellerId,String? buyerId,String? receiverId})async{
    await _read(userRepositoryProvider).uploadMessage(message,sellerId: sellerId,buyerId: buyerId,receiverId: receiverId);
  }

  @override
  void dispose() {
    userModelChangesSubscription?.cancel();
    super.dispose();
  }

}