import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:halawork/controllers/auth_controller.dart';
import 'package:halawork/controllers/user_controller.dart';
import 'package:halawork/exception_handlers/custom_exception.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/models/conversation_model/conversation_model.dart';
import 'package:halawork/models/inbox_model/inbox_model.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/profile_models/portfolio_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/seller_setup_model/seller_setup_model.dart';
import 'package:halawork/models/seller_setup_models/achievement_entry_model/achievement_entry_model.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/models/seller_setup_models/work_entry_model/work_entry_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/subservice_model/subservice_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/providers/general_providers/general_providers.dart';
import 'package:halawork/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:halawork/firebase_reference_extension/firebase_firestore_extension.dart';
import 'package:rxdart/rxdart.dart';
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
}
final userRepositoryProvider =
Provider<UserRepository>((ref) => UserRepository(ref.read));

class UserRepository implements BaseUserRepository {
  final Reader _read;

  const UserRepository(this._read);
  @override
  Stream<UserModel> getUserModel(String userId) {
    try {
      return  _read(firebaseFirestoreProvider).userDocumentRef(userId).snapshots().map((event) => event.data()!);
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
  Future<void> completeSellerProfileSetup(SellerSetupModel sellerSetupModel) async{
   try{
     final String  userId = _read(authControllerProvider)!.uid;
     final firestoreReference =   await _read(firebaseFirestoreProvider);
     UploadTask storageUploadTask;
     storageUploadTask =  _read(firebaseStorageProvider)
         .ref()
         .child(usersCollection)
         .child(userId)
         .child("profile_photo")
         .child(userId)
         .putFile(File(sellerSetupModel.saveProfilePhoto!));
     String photoUrl = await (await storageUploadTask).ref.getDownloadURL();
     UserModel userModel = _read(userControllerProvider)!.userModel.copyWith(
       profilePictureUrl: photoUrl,sellerType: sellerSetupModel.sellerType,service: sellerSetupModel.saveService,
         isServiceDefault:sellerSetupModel.saveServiceType,skills: sellerSetupModel.saveSkills,
       serviceIcon: sellerSetupModel.saveIcon,subServices: sellerSetupModel.saveSubService,
       expertiseLevel: sellerSetupModel.saveExpertiseType,profileDescription: sellerSetupModel.saveProfileDescModel?.description,
       profileDescriptionTitle: sellerSetupModel.saveProfileDescModel?.title,
       serviceId: sellerSetupModel.serviceId,joined: DateTime.now(),isBuyer: false,
       isSeller:true,orgDetailModel: sellerSetupModel.orgDetailModel!.toJson()
     );
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
               },SetOptions(merge: true));
         });
       }
       await genericBatch.commit();
     });
   }on FirebaseAuthException catch (e) {
     throw CustomException(message: e.message);
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

  @override
  Stream<List<CreateRequestModel>> getRequests() {
    try{
      return _read(firebaseFirestoreProvider).createRequestCollectionRef().snapshots().map((event) => event.docs.map((e) => e.data()).toList());
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
     return _read(firebaseFirestoreProvider).offerCollectionRef(buyerId, requestId).snapshots().map((event) => event.docs.map((e) => e.data().copyWith(sellerId: e.id)).toList());
   }on FirebaseAuthException catch (e) {
     throw CustomException(message: e.message);
   }
  }

  @override
  Stream<List<NotificationModel>> getNotifications(String userId) {
    try{
      return _read(firebaseFirestoreProvider).notificationCollectionRef(userId).snapshots().map((event) => event.docs.map((e) => e.data().copyWith(notificationId: e.id)).toList());
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
  Stream<List<ConversationModel>> getConversationModel(){
    try{
      return _read(firebaseFirestoreProvider).conversationCollectionRef(_read(authControllerProvider)!.uid).snapshots().map((event) => event.docs.map((e) => ConversationModel.fromJson(e.data(),e.id,e.data()["${_read(authControllerProvider)!.uid}messageCount"]??0)).toList());
    }on FirebaseAuthException catch (e) {
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
    UserModel usermodel= await getUserModel(receiverId!).single;
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

  Future<void>updateMessage(String sellerId,String buyerId,String documentId,int documentLength)async{
    await _read(firebaseFirestoreProvider).inboxSendCollectionRef(buyerId, sellerId).doc(documentId).update({
      "${_read(authControllerProvider)!.uid}messageCount":documentLength
    });
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
}