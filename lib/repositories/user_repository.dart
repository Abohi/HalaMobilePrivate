import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_model_extension_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/exception_handlers/network_failure_exception.dart';
import 'package:halawork/models/account_info_model/account_info_data_model.dart';
import 'package:halawork/models/account_info_model/account_info_model.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/models/bank_model/bank_model.dart';
import 'package:halawork/models/conversation_model/conversation_model.dart';
import 'package:halawork/models/inbox_model/inbox_model.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/orderpayment/order_payment.dart';
import 'package:halawork/models/paystack_verify_model/verify_model.dart';
import 'package:halawork/models/phonenumber_model/phonenumber_model.dart';
import 'package:halawork/models/profile_models/portfolio_model.dart';
import 'package:halawork/models/rating_model/rating_model.dart';
import 'package:halawork/models/recently_visited_model/recently_visited_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/seller_setup_model/seller_setup_model.dart';
import 'package:halawork/models/seller_setup_models/achievement_entry_model/achievement_entry_model.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/models/seller_setup_models/orgdetail_model/orgdetail_model.dart';
import 'package:halawork/models/seller_setup_models/profile_description_entry_model/profile_description_entry_model.dart';
import 'package:halawork/models/seller_setup_models/work_entry_model/work_entry_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/subservice_model/subservice_model.dart';
import 'package:halawork/models/transfer_model/transfer_model.dart';
import 'package:halawork/models/transfer_model/transfer_response_data_model.dart';
import 'package:halawork/models/transfer_model/transfer_response_model.dart';
import 'package:halawork/models/transfer_recipient_model/transfer_recipient_model.dart';
import 'package:halawork/models/transfer_recipient_model/transfer_recipient_request_model.dart';
import 'package:halawork/models/user_model/rating_model/user_ratings.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/user_model/wallet_model/wallet_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/profile_picture_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/portfolio_page/components/add_portfolio_photo.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/providers/state_providers/bankDataModelProvider.dart';
import 'package:halawork/repositories/auth_repository.dart';
import 'package:halawork/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:halawork/firebase_reference_extension/firebase_firestore_extension.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
abstract class BaseUserRepository {
  Stream<UserModel> getUserModel(String userId);
  Stream<List<AchievementEntryModel>> getAchievementModels(String userId);
  Stream<List<WorkEntryModel>> getWorkEntryModels(String userId);
  Stream<List<EducationEntryModel>> getEducationEntryModels(String userId);
  Stream<List<ActiveServiceModel>> getActiveService();
  Stream<List<PortfolioModel>> getPortfolioModels(String userId);
  Stream<UserModelExtension> getUserModelExtension(String userId);
  Stream<List<LocationModel>> getLocationModels(String userId);
  Stream<List<SubServiceModel>>getSellersUnderSubService(String subServiceName,String sellerId);
  Stream<List<CreateRequestModel>>getRequests();
  Stream<List<OfferModel>>getOffers(String buyerId,String requestId);
  Stream<List<NotificationModel>>getNotifications(String userId);
  Stream<List<InboxModel>> getMessages(String buyerId,String sellerId);
  Stream<CreateRequestModel?>getRequestStream(String requestId);

  Future<void>saveBasicSellerInfo(UserModel userModel);
  Future<void>completeSellerProfileSetup(SellerSetupModel sellerSetupModel);
  Future<void>saveDeviceToken(String token);
  Future<void>createRequest(CreateRequestModel createRequestModel);
  Future<void>sendOffer(String sellerId, String requestId, String buyerId,
      OfferModel sendOfferModel);
  Future<CreateRequestModel?> getRequest(String requestId);
  Future<void> updateNotification(String userId,NotificationModel notificationModel);
  Future<void> updateUserModel(String userId,UserModel userModel);
  Future<void> uploadMessage(String message,{String? sellerId,String? buyerId,String? receiverId});
  Future<void> sendOrderModel(Map<String,dynamic> orderModel);
  Future<Either<NetworkFailure,VerifyModel>> verifyTransactionReference(String transactionReference);
  Future<void> addOrderPayment(OrderPaymentModel orderPaymentModel,String requestId);
  Future<void> addUserMap(Map<String,dynamic>userMap);
  Future<void>uploadPortfolio(PortfolioModel portfolioModel,String userId);
  Future<void>recentlyVisitedProfiles(String sellerId);
  Future<void>updateNationalAvailability(UserModelExtension userModelExtension,bool visibility);
  Future<void>updateWorkHistory(List<WorkEntryModel> workEntryModelList);
  Future<void>updateAchievement(List<AchievementEntryModel> achievementEntryModelList);
  Future<void>updateEducation(List<EducationEntryModel> educationEntryModelList);
  Future<void>updatingUserType(UserModelExtension userModelExtension,bool isSeller);
  Future<void>addBankAccount(AccountInfoDataModel accountInfoDataModel);
}
final userRepositoryProvider =
Provider<UserRepository>((ref) => UserRepository(ref.read));

class UserRepository implements BaseUserRepository {
  final Reader _read;

  const UserRepository(this._read);
  @override
  Stream<UserModel> getUserModel(String userId) {
    try {
      return  _read(firebaseFirestoreProvider).userDocumentRef(userId).snapshots().map((event) =>
      event.data()!);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Stream<PhoneNumberModel> getPhoneNumberStream(String userId) {
    try {
      return  _read(firebaseFirestoreProvider).userMapDocumentRef(userId).snapshots().map((event) =>
      PhoneNumberModel.fromJson(event.data()!));
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Future<UserModel>getUserModelFuture(String userId)async{
    try {
      return  (await _read(firebaseFirestoreProvider).userDocumentRef(userId).get()).data()!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  @override
  Future<void> updateUserModel(String userId,UserModel userModel) async{
    try {
     await _read(firebaseFirestoreProvider).userDocumentRef(userId).set(userModel,SetOptions(merge: true));
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  @override
  Stream<UserModelExtension> getUserModelExtension(String userId) {
    try{
      return Rx.combineLatest8(
          getUserModel(userId),
          getAchievementModels(userId),
          getPortfolioModels(userId),
          getWorkEntryModels(userId),
          getEducationEntryModels(userId),
              getLocationModels(userId),
          getActiveService(),
          getNotifications(userId),
          (UserModel userModel,List<AchievementEntryModel> achievementEntryModel,List<PortfolioModel> portfolioModel,
              List<WorkEntryModel> workEntryModel,List<EducationEntryModel> educationEntryModel,List<LocationModel>locationList,List<ActiveServiceModel>serviceList,List<NotificationModel> notificationList) =>
              UserModelExtension(userModel: userModel,achievementModels: achievementEntryModel,
              portfolios: portfolioModel,workEntrieModels: workEntryModel,educationModels: educationEntryModel,locationModel:locationList,serviceList: serviceList,notificationModels: notificationList));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<AchievementEntryModel>> getAchievementModels(String userId) {
    try{
      return  _read(firebaseFirestoreProvider).achievementEntryCollectionRef(userId).snapshots().map((event) => event.docs.map((e) =>e.data().copyWith(documentId: e.id) ).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<EducationEntryModel>> getEducationEntryModels(String userId) {
    try{
      return  _read(firebaseFirestoreProvider).educationEntryCollectionRef(userId).snapshots().map((event) => event.docs.map((e) =>e.data().copyWith(documentId: e.id) ).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<PortfolioModel>> getPortfolioModels(String userId) {
    try{
      return  _read(firebaseFirestoreProvider).portfolioEntryCollectionRef(userId).snapshots().map((event) => event.docs.map((e) =>e.data().copyWith(documentId: e.id) ).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<WorkEntryModel>> getWorkEntryModels(String userId) {
    try{
      return  _read(firebaseFirestoreProvider).workEntryCollectionRef(userId).snapshots().map((event) => event.docs.map((e) =>e.data().copyWith(documentId: e.id) ).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  @override
  Stream<List<ActiveServiceModel>> getActiveService() {
    try{
      return _read(firebaseFirestoreProvider).activeServiceCollectionRef().snapshots().map((event) =>
          event.docs.map((e) => e.data().copyWith(serviceId: e.id)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<UserModel>> getSearchedSellers(List<String>subservices) {
    List<String>subservice =[...{...subservices}];
    try{
      return _read(firebaseFirestoreProvider).userCollectionRef().where("subServices",arrayContainsAny: subservice).snapshots().map((event) => event.docs.map((e) => e.data().copyWith(documentId: e.id)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<LocationModel>> getLocationModels(String userId) {
    try{
      return  _read(firebaseFirestoreProvider).locationCollectionRef(userId).snapshots().map((event) => event.docs.map((e) =>e.data().copyWith(documentId: e.id) ).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> saveBasicSellerInfo(UserModel userModel) async{
    try{
      await _read(firebaseFirestoreProvider).userDocumentRef(_read(authControllerProvider)!.uid).set(userModel,SetOptions(
          merge: true
      ));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  @override
  Future<void>uploadPortfolio(PortfolioModel portfolioModel,String userId)async{
    try{
      var docId = _read(firebaseFirestoreProvider).portfolioEntryCollectionRef(userId).doc().id;
      UploadTask storageUploadTask;
      storageUploadTask =  _read(firebaseStorageProvider)
          .ref()
          .child(usersCollection)
          .child(userId)
          .child("portfolio_photos")
          .child(docId)
          .putFile(File(_read(portfolioStateProvider).state!.path));
      String photoUrl = await (await storageUploadTask).ref.getDownloadURL();
      await _read(firebaseFirestoreProvider).portfolioEntryCollectionRef(userId).doc(docId).set(portfolioModel.copyWith(photoUrl:photoUrl),SetOptions(merge: true));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }



  Future<void>updateNationalAvailability(UserModelExtension userModelExtension,bool visibility)async{
    final firestoreReference =   await _read(firebaseFirestoreProvider);
    UserModel userModel = _read(userModelExtensionController)!.userModel.copyWith(toggleNationWideVisibility:visibility);
    await firestoreReference.userDocumentRef(_read(authControllerProvider)!.uid).set(userModel,SetOptions(merge: true));
    DocumentReference documentReference =firestoreReference.collection(activeServiceCollection).doc(userModelExtension.userModel.serviceId);
    for(int i=0;i<userModelExtension.userModel.subServices!.length;i++){
      await documentReference.collection(userModelExtension.userModel.subServices![i]).doc(_read(authControllerProvider)!.uid).set({
        "toggleNationWideVisibility":visibility
      },SetOptions(merge: true));
    }
  }

  Future<void>updatingUserType(UserModelExtension userModelExtension,bool isSeller)async{
    final firestoreReference =    _read(firebaseFirestoreProvider);
    UserModel userModel = _read(userModelExtensionController)!.userModel.copyWith(isSeller:isSeller);
    await firestoreReference.userDocumentRef(_read(authControllerProvider)!.uid).set(userModel,SetOptions(merge: true));
  }
  Future<void>updateWorkHistory(List<WorkEntryModel> workEntryModelList)async{
    for(int i =0;i<workEntryModelList.length;i++){
      await _read(firebaseFirestoreProvider).workEntryCollectionRef(_read(authControllerProvider)!.uid).doc().set(workEntryModelList[i],SetOptions(merge: true));
    }
  }
  Future<void>updateEducation(List<EducationEntryModel> educationEntryModelList)async{
    for(int i =0;i<educationEntryModelList.length;i++){
      await _read(firebaseFirestoreProvider).educationEntryCollectionRef(_read(authControllerProvider)!.uid).doc().set(educationEntryModelList[i],SetOptions(merge: true));
    }
  }
  Future<void>updateAchievement(List<AchievementEntryModel> achievementEntryModelList)async{
    for(int i =0;i<achievementEntryModelList.length;i++){
      await _read(firebaseFirestoreProvider).achievementEntryCollectionRef(_read(authControllerProvider)!.uid).doc().set(achievementEntryModelList[i],SetOptions(merge: true));
    }
  }
  Future<void>updateUserDescription(OrgDetailModel? orgDetailModel,ProfileDescEntryModel? profileDescription,bool isOrganization)async{
    final firestoreReference =   await _read(firebaseFirestoreProvider);
    if(isOrganization){
      await firestoreReference.userDocumentRef(_read(authControllerProvider)!.uid).set(_read(userModelExtensionController)!.userModel.copyWith(orgDetailModel: orgDetailModel?.toJson()),SetOptions(merge: true));
    }else{
      await firestoreReference.userDocumentRef(_read(authControllerProvider)!.uid).set(_read(userModelExtensionController)!.userModel.copyWith(profileDescriptionTitle: profileDescription?.title,profileDescription: profileDescription?.description),SetOptions(merge: true));
    }
  }
  Future<void>updateSellerProfilePicture(String path)async{
    final String  userId = _read(authControllerProvider)!.uid;
    final firestoreReference =   await _read(firebaseFirestoreProvider);
    UploadTask storageUploadTask;
    storageUploadTask =  _read(firebaseStorageProvider)
        .ref()
        .child(usersCollection)
        .child(userId)
        .child("profile_photo")
        .child(userId)
        .putFile(File(path));

    String photoUrl = await (await storageUploadTask).ref.getDownloadURL();
    UserModel userModel = _read(userModelExtensionController)!.userModel.copyWith(profilePictureUrl: photoUrl);
    await firestoreReference.userDocumentRef(_read(authControllerProvider)!.uid).set(userModel,SetOptions(merge: true));
  }
  @override
  Future<void> completeSellerProfileSetup(SellerSetupModel sellerSetupModel) async{
   try{
     final String  userId = _read(authControllerProvider)!.uid;
     final firestoreReference =   await _read(firebaseFirestoreProvider);
     UploadTask storageUploadTask;
     String? photoUrl =null;
     if(sellerSetupModel.saveProfilePhoto!=null){
       storageUploadTask =  _read(firebaseStorageProvider)
           .ref()
           .child(usersCollection)
           .child(userId)
           .child("profile_photo")
           .child(userId)
           .putFile(File(sellerSetupModel.saveProfilePhoto!));
      photoUrl = await (await storageUploadTask).ref.getDownloadURL();
     }
     UserModel? userModel = null;
    if(_read(userModelExtensionController)?.userModel.profilePictureUrl==null){
      userModel = _read(userModelExtensionController)!.userModel.copyWith(
          profilePictureUrl: photoUrl,sellerType: sellerSetupModel.sellerType,service: sellerSetupModel.saveService,
          isServiceDefault:sellerSetupModel.saveServiceType,skills: sellerSetupModel.saveSkills,
          serviceIcon: sellerSetupModel.saveIcon,subServices: sellerSetupModel.saveSubService,
          expertiseLevel: sellerSetupModel.saveExpertiseType,profileDescription: sellerSetupModel.saveProfileDescModel?.description,
          profileDescriptionTitle: sellerSetupModel.saveProfileDescModel?.title,
          serviceId: sellerSetupModel.serviceId,joined: DateTime.now(),isBuyer: false,
          isSeller:true,orgDetailModel:sellerSetupModel.orgDetailModel==null?null: sellerSetupModel.orgDetailModel?.toJson(),states:sellerSetupModel.locationModel?.map((e) => e.state).toList(),isActiveService:true,isDismissCompleteProfile:true,toggleNationWideVisibility:true,
          ratings:UserRatingModel(serviceOfWorkRatinig: 0,communicationRating: 0,likelyRecommendRating: 0),buyerNotification: true,inboxNotification: true,orderNotification: true );
    }else{
      userModel = _read(userModelExtensionController)!.userModel.copyWith(
          sellerType: sellerSetupModel.sellerType,service: sellerSetupModel.saveService,
          isServiceDefault:sellerSetupModel.saveServiceType,skills: sellerSetupModel.saveSkills,
          serviceIcon: sellerSetupModel.saveIcon,subServices: sellerSetupModel.saveSubService,
          expertiseLevel: sellerSetupModel.saveExpertiseType,profileDescription: sellerSetupModel.saveProfileDescModel?.description,
          profileDescriptionTitle: sellerSetupModel.saveProfileDescModel?.title,
          serviceId: sellerSetupModel.serviceId,joined: DateTime.now(),isBuyer: false,
          isSeller:true,orgDetailModel:sellerSetupModel.orgDetailModel==null?null: sellerSetupModel.orgDetailModel?.toJson(),states:sellerSetupModel.locationModel?.map((e) => e.state).toList(),isActiveService:true,isDismissCompleteProfile:true,toggleNationWideVisibility:true);
    }

     print(userModel);
     await firestoreReference.userDocumentRef(_read(authControllerProvider)!.uid).set(userModel,SetOptions(merge: true));
     var collectionBatchRef = firestoreReference.batch();

     sellerSetupModel.locationModel?.forEach((element) {
       collectionBatchRef.set<LocationModel>( firestoreReference.locationCollectionRef(userId).doc(), element);
     });

     sellerSetupModel.saveEducationEntryModel?.forEach((element) {
       collectionBatchRef.set<EducationEntryModel>( firestoreReference.educationEntryCollectionRef(userId).doc(), element);
     });

     sellerSetupModel.saveWorkEntryModel?.forEach((element) {
       collectionBatchRef.set<WorkEntryModel>( firestoreReference.workEntryCollectionRef(userId).doc(), element);
     });

     sellerSetupModel.saveAchievementList?.forEach((element) {
       collectionBatchRef.set<AchievementEntryModel>( firestoreReference.achievementEntryCollectionRef(userId).doc(), element);
     });
     await collectionBatchRef.commit();
     DocumentReference activeServiceRef = firestoreReference.collection(activeServiceCollection).doc(sellerSetupModel.serviceId);
     var genericBatch = firestoreReference.batch();
     activeServiceRef.get().then((value) async{
       if(value.exists){
         await activeServiceRef.update({
           "subservices": FieldValue.arrayUnion(sellerSetupModel.saveSubService!)
         });

         sellerSetupModel.saveSubService?.forEach((element) {
           genericBatch.set(
               activeServiceRef.collection(element).doc(userId),
               {
                 "userid": userId,
                 "isActiveSubservice":true,
                 "toggleNationWideVisibility":true
               },SetOptions(merge: true));
         });
       }else{
         await activeServiceRef.set({
           "service": sellerSetupModel.saveService,
           "isDefault": sellerSetupModel.saveServiceType,
           "icon":sellerSetupModel.saveIcon,
           "subservices":
           FieldValue.arrayUnion(sellerSetupModel.saveSubService!)
         }, SetOptions(merge: true));

         sellerSetupModel.saveSubService?.forEach((element) {
           genericBatch.set(
               activeServiceRef.collection(element).doc(userId),
               {
                 "userid": userId,
                 "isActiveSubservice":true,
                 "toggleNationWideVisibility":true
               },SetOptions(merge: true));
         });
       }
       await genericBatch.commit();
     });
   }on Exception catch (e) {
     print(e);
   }
  }


  @override
  Stream<List<SubServiceModel>>getSellersUnderSubService(String subServiceName,String sellerId){
    try{
      return  _read(firebaseFirestoreProvider).subserviceCollectionRef(subServiceName, sellerId).snapshots()
      .map((event) =>
          event.docs.map((e) =>
              e.data().
              copyWith(subserviceId: e.id)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void>saveDeviceToken(String token)async{
    try{
      await _read(firebaseFirestoreProvider).collection(usersCollection).doc(_read(authControllerProvider)!.uid).set({
        "fcmtoken":token
      },SetOptions(merge: true));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> createRequest(CreateRequestModel createRequestModel) async{
    try{
      String docId=_read(firebaseFirestoreProvider).createRequestCollectionRef().doc().id;
      await _read(firebaseFirestoreProvider).createRequestCollectionRef().doc(docId).set(createRequestModel.copyWith(requestId: docId));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Future<void> updateRequestStatus(CreateRequestModel createRequestModel,String requestId) async{
    try{
      await _read(firebaseFirestoreProvider).createRequestCollectionRef().doc(requestId).set(createRequestModel.copyWith(requestStatus: false));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  @override
  Future<void>recentlyVisitedProfiles(String sellerId)async{
   try{
     await _read(firebaseFirestoreProvider).recentlyVisitedCollectionRef(_read(authControllerProvider)!.uid).doc(sellerId).set(RecentlyVisitedModel(sellerId: sellerId),SetOptions(merge: true));
   }on FirebaseAuthException catch (e) {
     throw CustomException(message: e.message);
   }
  }
  Stream<List<RecentlyVisitedModel>>getRecentlyVisited(){
    return _read(firebaseFirestoreProvider).recentlyVisitedCollectionRef(_read(authControllerProvider)!.uid).snapshots().map((event) => event.docs.map((e) => e.data()).toList());
  }

  @override
  Stream<List<CreateRequestModel>> getRequests() {
    try{
      return _read(firebaseFirestoreProvider).createRequestCollectionRef().snapshots().map((event) =>
          event.docs.map((e) =>
              e.data()).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> sendOffer(String sellerId, String requestId, String buyerId, OfferModel offerModel)async {
    try{
      return await _read(firebaseFirestoreProvider).offerDocumentRef(sellerId, buyerId, requestId).set(offerModel);
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<OfferModel>> getOffers(String buyerId,String requestId) {
   try{
     return _read(firebaseFirestoreProvider).offerCollectionRef(buyerId, requestId).snapshots().map((event) => event.docs.map((e) => e.data().copyWith(sellerId: e.id,requestId: requestId)).toList());
   }on FirebaseAuthException catch (e) {
     throw CustomException(message: e.message);
   }
  }


 Future<void>deleteOffer(String buyerId,String sellerId,String requestId)async{
   try{
     return await _read(firebaseFirestoreProvider).offerCollectionRef(buyerId, requestId).doc(sellerId).delete();
   }on FirebaseAuthException catch (e) {
     throw CustomException(message: e.message);
   }
 }

  Future<OfferModel?> getOffer(String buyerId,String sellerId,String requestId)async{
    try{
      return (await _read(firebaseFirestoreProvider).offerDocumentRef(sellerId, buyerId, requestId).get()).data();
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<List<NotificationModel>> getNotifications(String userId) {
    try{
      return _read(firebaseFirestoreProvider).notificationCollectionRef(userId).orderBy("createdAt", descending: true).snapshots().map((event) => event.docs.map((e) =>
          e.data().copyWith(notificationId: e.id)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }


  @override
  Future<CreateRequestModel?> getRequest(String requestId) async{
    try{
      return (await _read(firebaseFirestoreProvider).requestDocumentRef(requestId).get()).data();
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
 Stream<CreateRequestModel?>getRequestStream(String requestId){
    try{
      return _read(firebaseFirestoreProvider).requestDocumentRef(requestId).snapshots().map((event) => event.data());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
 }
  @override
  Future<void> updateNotification(String userId, NotificationModel notificationModel) async{
    try{
      return (await _read(firebaseFirestoreProvider).notificationDocumentRef(userId, notificationModel.notificationId!).set(notificationModel.copyWith(isOpen:true),SetOptions(merge: true)));
    }on FirebaseAuthException catch (e) {
    throw CustomException(message: e.message);
    }
  }
  @override
  Stream<List<InboxModel>> getMessages(String buyerId,String sellerId){
    try{
      return _read(firebaseFirestoreProvider).inboxCollectionRef(buyerId, sellerId).orderBy("createdAt", descending: true).snapshots().map((event) => event.docs.map((e) => InboxModel.fromJson(e.data(),
          e.id, e.data()["${_read(authControllerProvider)!.uid}messageCount"]??0)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  @override
  Stream<List<InboxModel>> getOrderMessages(String buyerId,String sellerId){
    try{
      return _read(firebaseFirestoreProvider).orderSendCollectionRef(buyerId, sellerId).orderBy("createdAt", descending: true).snapshots().map((event) => event.docs.map((e) => InboxModel.fromJson(e.data(),
          e.id, e.data()["${_read(authControllerProvider)!.uid}messageCount"]??0)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Stream<List<ConversationModel>> getConversationModel(){
    try{
      return _read(firebaseFirestoreProvider).conversationCollectionRef(_read(authControllerProvider)!.uid).snapshots().map((event) => event.docs.map((e) => ConversationModel.fromJson(e.data(),e.id,e.data()["${_read(authControllerProvider)!.uid}messageCount"]??0)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Stream<List<AccountInfoDataModel>> getBankAccounts(){
    try{
      return _read(firebaseFirestoreProvider).bankAccountCollectionRef(_read(authControllerProvider)!.uid).snapshots().map((event) => event.docs.map((e) => e.data().copyWith(documentId: e.id)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<void>addBankAccount(AccountInfoDataModel accountInfoDataModel)async{
    try{
      await _read(firebaseFirestoreProvider).bankAccountCollectionRef(_read(authControllerProvider)!.uid).doc(accountInfoDataModel.account_number).set(accountInfoDataModel,SetOptions(
          merge: true
      ));
    }on FirebaseAuthException catch(e){
      throw CustomException(message: e.message);
    }
  }
  Stream<List<TransferResponseDataModel>> getTransfers(){
    try{
      return _read(firebaseFirestoreProvider).transferHistoryCollectionRef(_read(authControllerProvider)!.uid).snapshots().map((event) => event.docs.map((e) => e.data().copyWith(documentId: e.id)).toList());
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Future<void>addTransfer(TransferResponseDataModel transferResponseDataModel)async{
    try{
      await _read(firebaseFirestoreProvider).transferHistoryCollectionRef(_read(authControllerProvider)!.uid).doc().set(transferResponseDataModel,SetOptions(
          merge: true
      ));
    }on FirebaseAuthException catch(e){
      throw CustomException(message: e.message);
    }
  }
  @override
  Future<void> uploadMessage(String message,{String? sellerId,String? buyerId,String? receiverId}) async {
    final user = _read(authControllerProvider);
    DateTime time = DateTime.now();
    await _read(firebaseFirestoreProvider).inboxSendCollectionRef(buyerId!, sellerId!).add({
     "messageRecepientId":user!.uid,
      "message":message,
      "receiverID":receiverId,
      "buyerId":buyerId,
      "sellerId":sellerId,
      "createdAt":time,
    });
    UserModel usermodel= await getUserModelFuture(receiverId!);
    print(usermodel.email);
    await _read(firebaseFirestoreProvider).conversationForBuyerDocumentRef(sellerId, buyerId).set({"buyerId":buyerId,
    "sellerId":sellerId,
      "messageCount":FieldValue.increment(1),
      "${_read(authControllerProvider)!.uid}messageCount":FieldValue.increment(1),
      "messageRecepientEmail":user.email,
      "recieverEmail":usermodel.email,
      "createdAt":time,
    },SetOptions(merge: true));
    await _read(firebaseFirestoreProvider).conversationForSellerDocumentRef(sellerId, buyerId).set({
      "buyerId":buyerId,
      "sellerId":sellerId,
      "messageCount":FieldValue.increment(1),
      "${_read(authControllerProvider)!.uid}messageCount":FieldValue.increment(1),
      "messageRecepientEmail":user.email,
      "recieverEmail":usermodel.email,
      "createdAt":time,
    },SetOptions(merge: true));
  }

  @override
  Future<void> uploadOrderMessage(String message,{String? sellerId,String? buyerId,String? receiverId}) async {
    final user = _read(authControllerProvider);
    DateTime time = DateTime.now();
    await _read(firebaseFirestoreProvider).orderSendCollectionRef(buyerId!, sellerId!).add({
      "messageRecepientId":user!.uid,
      "message":message,
      "receiverID":receiverId,
      "buyerId":buyerId,
      "sellerId":sellerId,
      "createdAt":time,
    });
    UserModel usermodel= await getUserModelFuture(receiverId!);
    print(usermodel.email);
    await _read(firebaseFirestoreProvider).conversationForBuyerDocumentRef(sellerId, buyerId).set({"buyerId":buyerId,
      "sellerId":sellerId,
      "messageCount":FieldValue.increment(1),
      "${_read(authControllerProvider)!.uid}messageCount":FieldValue.increment(1),
      "messageRecepientEmail":user.email,
      "recieverEmail":usermodel.email,
      "createdAt":time,
    },SetOptions(merge: true));
    await _read(firebaseFirestoreProvider).conversationForSellerDocumentRef(sellerId, buyerId).set({
      "buyerId":buyerId,
      "sellerId":sellerId,
      "messageCount":FieldValue.increment(1),
      "${_read(authControllerProvider)!.uid}messageCount":FieldValue.increment(1),
      "messageRecepientEmail":user.email,
      "recieverEmail":usermodel.email,
      "createdAt":time,
    },SetOptions(merge: true));
  }
  Future<void>updateMessage(String sellerId,String buyerId,String documentId,int documentLength,int tabIndex)async{
    if(tabIndex==0){
      await _read(firebaseFirestoreProvider).inboxSendCollectionRef(buyerId, sellerId).doc(documentId).update({
        "${_read(authControllerProvider)!.uid}messageCount":documentLength
      });
    }else{
      await _read(firebaseFirestoreProvider).orderSendCollectionRef(buyerId, sellerId).doc(documentId).update({
        "${_read(authControllerProvider)!.uid}messageCount":documentLength
      });
    }
    await _read(firebaseFirestoreProvider).conversationForBuyerDocumentRef(sellerId, buyerId).set({"buyerId":buyerId,
      "sellerId":sellerId,
      "${_read(authControllerProvider)!.uid}messageCount":documentLength,
    },SetOptions(merge: true));
    await _read(firebaseFirestoreProvider).conversationForSellerDocumentRef(sellerId, buyerId).set({
      "buyerId":buyerId,
      "sellerId":sellerId,
      "${_read(authControllerProvider)!.uid}messageCount":documentLength,
    },SetOptions(merge: true));
  }

  @override
  Future<void> sendOrderModel(Map<String,dynamic> orderModel) async{
    try{
      await _read(firebaseFirestoreProvider).orderDocumentMapRef(orderModel["requestId"]).set(orderModel,SetOptions(merge: true));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }


  @override
  Future<Either<NetworkFailure,VerifyModel>> verifyTransactionReference(String transactionReference)async{
    try{
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer sk_live_a57388b0459ed32471ec4dbbbb3ec5a43c5b7c2b'
      };

      var url ="https://api.paystack.co/transaction/verify/${transactionReference}";

      return http.get(Uri.parse(url), headers: headers).then((data) {
        var jsonDecode = json.decode(data.body);
        if (data.statusCode == 200) {
          return right(VerifyModel.fromJson(jsonDecode));
        }
        return right(jsonDecode);
      });
    }on NetworkFailure catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(GeneralException(e.toString()));
    }
  }


  @override
  Future<Either<NetworkFailure,AccountInfoModel?>> resolveAccountInfo()async{
    try{
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer sk_live_a57388b0459ed32471ec4dbbbb3ec5a43c5b7c2b'
      };
      String accountNumber = _read(bankDataModelProvider).state?.accountNumber??"";
      String bankCode= _read(bankDataModelProvider).state?.code??"";
      const baseUrl = "https://api.paystack.co/";
      String url =
          baseUrl+'bank/resolve?account_number=$accountNumber&bank_code=$bankCode';
      if(_read(bankDataModelProvider).state==null){
        return right(null);
      }
      return http.get(Uri.parse(url), headers: headers).then((data) {
        var jsonDecode = json.decode(data.body);
        if (data.statusCode == 200) {
          return right(AccountInfoModel.fromJson(jsonDecode));
        }
        return right(AccountInfoModel.fromJson(jsonDecode));
      });
    }on NetworkFailure catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(GeneralException(e.toString()));
    }
  }
  @override
  Future<Either<NetworkFailure,BankModel>> getBanks()async{
    try{
      var headers = {
        'Content-Type': 'application/json'
      };
      const baseUrl = "https://api.paystack.co/";
      String url =
          baseUrl+'bank?country=nigeria';

      return http.get(Uri.parse(url), headers: headers).then((data) {
        var jsonDecode = json.decode(data.body);
        if (data.statusCode == 200) {
          return right(BankModel.fromJson(jsonDecode));
        }
        return right(jsonDecode);
      });
    }on NetworkFailure catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(GeneralException(e.toString()));
    }
  }
  @override
  Future<Either<NetworkFailure,TransferRecipientModel>> createTransferRecipient(TransferRecipientRequestModel transferRecipientRequestModel)async{
    try{
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer sk_live_a57388b0459ed32471ec4dbbbb3ec5a43c5b7c2b'
      };

      var url ="https://api.paystack.co/transferrecipient";
      var payLoad = json.encode(transferRecipientRequestModel.toJson());
      return http.post(Uri.parse(url), headers: headers,body: payLoad).then((data) {
        var jsonDecode = json.decode(data.body);
        if (data.statusCode == 201) {
          return right(TransferRecipientModel.fromJson(jsonDecode));
        }
        return right(TransferRecipientModel.fromJson(jsonDecode));
      });
    }on NetworkFailure catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(GeneralException(e.toString()));
    }
  }

  Future<Either<NetworkFailure,TransferResponseModel>> makeTransfer(TransferModel transferModel)async{
    try{
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':'Bearer sk_live_a57388b0459ed32471ec4dbbbb3ec5a43c5b7c2b'
      };

      var url ="https://api.paystack.co/transfer";
      var payLoad = json.encode(transferModel.toJson());
      return http.post(Uri.parse(url), headers: headers,body: payLoad).then((data) {
        var jsonDecode = json.decode(data.body);
        if (data.statusCode == 200) {
          return right(TransferResponseModel.fromJson(jsonDecode));
        }
        return right(TransferResponseModel.fromJson(jsonDecode));
      });
    }on NetworkFailure catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(GeneralException(e.toString()));
    }
  }
  @override
  Future<void> addOrderPayment(OrderPaymentModel orderPaymentModel,String requestId) async{
    try{
      await _read(firebaseFirestoreProvider).orderPaymentDocumentRef(requestId).set(orderPaymentModel,SetOptions(merge: true));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> addUserMap(Map<String, dynamic> userMap) async{
    try{
      await _read(firebaseFirestoreProvider).userMapDocumentRef(_read(authControllerProvider)!.uid).set(userMap,
      SetOptions(merge: true));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  //Submitting buyers rating
  Future<void>submitBuyersRating({required String requestId,required String sellerId,required RatingModel ratingModel,required OrderModel orderModel})async{
    try{
      await _read(firebaseFirestoreProvider).ratingDocumentRef(sellerId, requestId).set(ratingModel,SetOptions(merge: true));
      await _read(firebaseFirestoreProvider).orderDocumentMapRef(requestId).set({
        "isReviewed":true
      },SetOptions(merge: true));
    }on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  Stream<RatingModel>getRating(String sellerId,String requestId){
    return _read(firebaseFirestoreProvider).ratingDocumentRef(sellerId, requestId).snapshots().map((event) => event.data()!.copyWith(ratingId:event.id));
  }
}