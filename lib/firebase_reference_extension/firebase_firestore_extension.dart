import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halawork/models/account_info_model/account_info_data_model.dart';
import 'package:halawork/models/active_servicemodel/active_service_model.dart';
import 'package:halawork/models/conversation_model/conversation_model.dart';
import 'package:halawork/models/dispute_model/dispute_model.dart';
import 'package:halawork/models/inbox_model/inbox_model.dart';
import 'package:halawork/models/location_model/location_model.dart';
import 'package:halawork/models/modification_model/modification_model.dart';
import 'package:halawork/models/notification_model/notification_model.dart';
import 'package:halawork/models/offer_model/offer_model.dart';
import 'package:halawork/models/order_model/order_model.dart';
import 'package:halawork/models/orderpayment/order_payment.dart';
import 'package:halawork/models/profile_models/portfolio_model.dart';
import 'package:halawork/models/rating_model/rating_model.dart';
import 'package:halawork/models/recently_visited_model/recently_visited_model.dart';
import 'package:halawork/models/requests_model/create_request_model.dart';
import 'package:halawork/models/seller_setup_models/achievement_entry_model/achievement_entry_model.dart';
import 'package:halawork/models/seller_setup_models/education_entry_model/education_entry_model.dart';
import 'package:halawork/models/seller_setup_models/work_entry_model/work_entry_model.dart';
import 'package:halawork/models/services_model/service_model.dart';
import 'package:halawork/models/skills_model/skill_model.dart';
import 'package:halawork/models/subservice_model/subservice_model.dart';
import 'package:halawork/models/transfer_model/transfer_response_data_model.dart';
import 'package:halawork/models/user_model/user_model.dart';
import 'package:halawork/models/usermodel_extension/usermodel_extension.dart';
import 'package:halawork/utils/constants.dart';

extension AuthFirebaseFirestoreExtentsion on FirebaseFirestore {
  DocumentReference<RatingModel> ratingDocumentRef(String sellerId,String requestId)=>
      collection(usersCollection).doc(sellerId).collection(ratingsCollection).doc(requestId).withConverter<RatingModel>(fromFirestore: (snapshots,_)=>RatingModel.fromJson(snapshots.data()!), toFirestore: (ratingmodel,_)=>ratingmodel.toJson());
  //User Profile Document Ref
  DocumentReference<UserModel> userDocumentRef(String userId)=>
      collection(usersCollection).doc(userId).withConverter<UserModel>(fromFirestore: (snapshots,_)=>UserModel.fromJson(snapshots.data()!), toFirestore: (usermodel,_)=>usermodel.toJson());

  DocumentReference<Map<String,dynamic>> userMapDocumentRef(String userId)=>
      collection(usersCollection).doc(userId).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (usermodel,_)=>usermodel);
//End Of User Profile Document Ref
  DocumentReference<SkillModel> skillsDocumentRef()=>
      collection(skillsCollection).doc(skillsCollection).withConverter<SkillModel>(fromFirestore: (snapshots,_)=>SkillModel.fromJson(snapshots.data()!), toFirestore: (usermodel,_)=>usermodel.toJson());

  //Start of Sellers Offer document
  DocumentReference<OfferModel> offerDocumentRef(String sellerId,String buyerId,String requestId)=>
      collection(offerCollection).doc(buyerId).collection(requestId).doc(sellerId).withConverter<OfferModel>(fromFirestore: (snapshots,_)=>OfferModel.fromJson(snapshots.data()!), toFirestore: (offerModel,_)=>offerModel.toJson());
  //End of sellers offer document

  //Request document ref
  DocumentReference<CreateRequestModel> requestDocumentRef(String requestId)=>
      collection(requestCollection).doc(requestId).withConverter<CreateRequestModel>(fromFirestore: (snapshots,_)=>CreateRequestModel.fromJson(snapshots.data()!), toFirestore: (createRequestModel,_)=>createRequestModel.toJson());
  //End of Request document ref
  DocumentReference<NotificationModel> notificationDocumentRef(String userId,String notificationId)=>
      collection(usersCollection).doc(userId).collection(notificationCollection).doc(notificationId).withConverter<NotificationModel>(fromFirestore: (snapshots,_)=>NotificationModel.fromJson(snapshots.data()!), toFirestore: (notificationModel,_)=>notificationModel.toJson());
 //Start of conversation document ref
  DocumentReference<Map<String,dynamic>> conversationForSellerDocumentRef(String sellerId,String buyerId)=>
      collection(usersCollection).doc(sellerId).collection(conversationCollection).doc(buyerId).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (conversationModel,_)=>conversationModel);

  DocumentReference<Map<String,dynamic>> conversationForBuyerDocumentRef(String sellerId,String buyerId)=>
      collection(usersCollection).doc(buyerId).collection(conversationCollection).doc(sellerId).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (conversationModel,_)=>conversationModel);
  //End of conversation document ref

  DocumentReference<Map<String,dynamic>> orderDocumentMapRef(String requestId)=>
      collection(orderCollection).doc(requestId).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (orderModel,_)=>orderModel);

  DocumentReference<Map<String,dynamic>> modificationMapDocumentRef(String requestId)=>
      collection(modificationCollection).doc(requestId).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (modificationModel,_)=>modificationModel);

  DocumentReference<OrderPaymentModel> orderPaymentDocumentRef(String requestId)=>
      collection(orderPaymentCollection).doc(requestId).withConverter<OrderPaymentModel>(fromFirestore: (snapshots,_)=>OrderPaymentModel.fromJson(snapshots.data()!), toFirestore: (orderPaymentModel,_)=>orderPaymentModel.toJson());

  CollectionReference<ServiceModel> serviceCollectionRef()=>
      collection(serviceCollection).withConverter<ServiceModel>(fromFirestore: (snapshots,_)=>ServiceModel.fromJson(snapshots.data()!), toFirestore: (serviceModel,_)=>serviceModel.toJson());

  CollectionReference<RecentlyVisitedModel> recentlyVisitedCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(recentlyVisitedCollection).withConverter<RecentlyVisitedModel>(fromFirestore: (snapshots,_)=>RecentlyVisitedModel.fromJson(snapshots.data()!), toFirestore: (recentlyVisitedModel,_)=>recentlyVisitedModel.toJson());
  //Services Type Collection Ref
  CollectionReference<CreateRequestModel> createRequestCollectionRef()=>
      collection(requestCollection).withConverter<CreateRequestModel>(fromFirestore: (snapshots,_)=>CreateRequestModel.fromJson(snapshots.data()!), toFirestore: (createRequestModel,_)=>createRequestModel.toJson());

  CollectionReference<ActiveServiceModel> activeServiceCollectionRef()=>
      collection(activeServiceCollection).withConverter<ActiveServiceModel>(fromFirestore: (snapshots,_)=>ActiveServiceModel.fromJson(snapshots.data()!), toFirestore: (serviceModel,_)=>serviceModel.toJson());
  CollectionReference<UserModel> userCollectionRef()=>
      collection(usersCollection).withConverter<UserModel>(fromFirestore: (snapshots,_)=>UserModel.fromJson(snapshots.data()!), toFirestore: (userModel,_)=>userModel.toJson());
  CollectionReference<SubServiceModel> subserviceCollectionRef(String subserviceName,String serviceId)=>
      collection(activeServiceCollection).doc(serviceId).collection(subserviceName).withConverter<SubServiceModel>(fromFirestore: (snapshots,_)=>SubServiceModel.fromJson(snapshots.data()!), toFirestore:  (subserviceModel,_)=>subserviceModel.toJson());
  //End Of Service Type Collection Ref

  //Beginning of SellerSetup CollectionRef
  CollectionReference<EducationEntryModel> educationEntryCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(educationEntryCollection).withConverter<EducationEntryModel>(fromFirestore: (snapshots,_)=>EducationEntryModel.fromJson(snapshots.data()!), toFirestore: (educationEntryModel,_)=>educationEntryModel.toJson());

  CollectionReference<WorkEntryModel> workEntryCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(workEntryCollection).withConverter<WorkEntryModel>(fromFirestore: (snapshots,_)=>WorkEntryModel.fromJson(snapshots.data()!), toFirestore: (workEntryModel,_)=>workEntryModel.toJson());

  CollectionReference<AchievementEntryModel> achievementEntryCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(achievementEntryCollection).withConverter<AchievementEntryModel>(fromFirestore: (snapshots,_)=>AchievementEntryModel.fromJson(snapshots.data()!), toFirestore: (achievementEntryModel,_)=>achievementEntryModel.toJson());

  CollectionReference<PortfolioModel> portfolioEntryCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(portfolioEntryCollection).withConverter<PortfolioModel>(fromFirestore: (snapshots,_)=>PortfolioModel.fromJson(snapshots.data()!), toFirestore: (portfolioEntryModel,_)=>portfolioEntryModel.toJson());

  CollectionReference<LocationModel> locationCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(locationCollection).withConverter<LocationModel>(fromFirestore: (snapshots,_)=>LocationModel.fromJson(snapshots.data()!), toFirestore: (locationModel,_)=>locationModel.toJson());
  //End Of SellerSetup CollectionsRef

  //Start of Sellers Offer collection
  CollectionReference<OfferModel> offerCollectionRef(String buyerId,String requestId)=>
      collection(offerCollection).doc(buyerId).collection(requestId).withConverter<OfferModel>(fromFirestore: (snapshots,_)=>OfferModel.fromJson(snapshots.data()!), toFirestore: (offerModel,_)=>offerModel.toJson());
  //End of Sellers offer collection
  CollectionReference<NotificationModel> notificationCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(notificationCollection).withConverter<NotificationModel>(fromFirestore: (snapshots,_)=>NotificationModel.fromJson(snapshots.data()!), toFirestore: (notificationModel,_)=>notificationModel.toJson());
  //Start of message collection
  CollectionReference<Map<String,dynamic>> inboxCollectionRef(String buyerId,String sellerId)=>
      collection(inboxCollection).doc(buyerId+sellerId).collection(messageCollection).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (inboxModel,_)=>inboxModel);

  CollectionReference<Map<String,dynamic>> inboxSendCollectionRef(String buyerId,String sellerId)=>
      collection(inboxCollection).doc(buyerId+sellerId).collection(messageCollection).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (inboxModel,_)=>inboxModel);

  CollectionReference<Map<String,dynamic>> orderSendCollectionRef(String buyerId,String sellerId)=>
      collection(orderInboxCollection).doc(buyerId+sellerId).collection(messageCollection).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (inboxModel,_)=>inboxModel);
  //End Of message collection
  CollectionReference<Map<String,dynamic>> conversationCollectionRef(String userId)=>
      collection(usersCollection).doc(userId).collection(conversationCollection).withConverter<Map<String,dynamic>>(fromFirestore: (snapshots,_)=>snapshots.data()!, toFirestore: (conversationModel,_)=>conversationModel);

  CollectionReference<OrderModel> orderCollectionRef()=>
      collection(orderCollection).withConverter<OrderModel>(fromFirestore: (snapshots,_)=>OrderModel.fromJson(snapshots.data()!),
          toFirestore: (orderModel,_)=>orderModel.toJson());

  CollectionReference<AccountInfoDataModel> bankAccountCollectionRef(String userId)=>
      collection(bankAccountMainCollection).doc(userId).collection(banksCollection).withConverter<AccountInfoDataModel>(fromFirestore: (snapshots,_)=>AccountInfoDataModel.fromJson(snapshots.data()!),
          toFirestore: (bankAccountModel,_)=>bankAccountModel.toJson());
  CollectionReference<ModificationModel> modificationCollectionRef()=>
      collection(modificationCollection).withConverter<ModificationModel>(fromFirestore: (snapshots,_)=>ModificationModel.fromJson(snapshots.data()!), toFirestore: (modificationModel,_)=>modificationModel.toJson());

  CollectionReference<DisputeModel> disputeCollectionRef(String userId)=>
      collection(disputeCollection).doc(userId).collection(userDisputeCollection).withConverter<DisputeModel>(fromFirestore: (snapshots,_)=>DisputeModel.fromJson(snapshots.data()!), toFirestore: (disputeModel,_)=>disputeModel.toJson());

  CollectionReference<TransferResponseDataModel> transferHistoryCollectionRef(String userId)=>
      collection(transferMainCollection).doc(userId).collection(transferCollection).withConverter<TransferResponseDataModel>(fromFirestore: (snapshots,_)=>TransferResponseDataModel.fromJson(snapshots.data()!),
          toFirestore: (transferModel,_)=>transferModel.toJson());
}