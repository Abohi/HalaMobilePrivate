// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$_$_UserModelFromJson(Map<String, dynamic> json) {
  return _$_UserModel(
    phoneNumber: json['phoneNumber'] as String?,
    isPhoneNumberVerified: json['isPhoneNumberVerified'] as bool,
    isBuyer: json['isBuyer'] as bool,
    isSeller: json['isSeller'] as bool,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    optionalNumber: json['optionalNumber'] as String?,
    dateOfBirth: json['dateOfBirth'] == null
        ? null
        : DateTime.parse(json['dateOfBirth'] as String),
    sellerType: json['sellerType'] as String?,
    skills:
        (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
    serviceId: json['serviceId'] as String?,
    service: json['service'] as String?,
    serviceIcon: json['serviceIcon'] as String?,
    isServiceDefault: json['isServiceDefault'] as bool?,
    subServices: (json['subServices'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    expertiseLevel: json['expertiseLevel'] as String?,
    profilePictureUrl: json['profilePictureUrl'] as String?,
    profileDescriptionTitle: json['profileDescriptionTitle'] as String?,
    profileDescription: json['profileDescription'] as String?,
    joined: json['joined'] == null
        ? null
        : DateTime.parse(json['joined'] as String),
    completedOrders: (json['completedOrders'] as num?)?.toDouble() ?? 0.0,
    uncompletedOrders: (json['uncompletedOrders'] as num?)?.toDouble() ?? 0.0,
    totalOrders: (json['totalOrders'] as num?)?.toDouble() ?? 0.0,
    available: json['available'] as String? ?? 'Available to work',
    ratings: json['ratings'] == null
        ? null
        : UserRatingModel.fromJson(json['ratings'] as Map<String, dynamic>),
    orgDetailModel: json['orgDetailModel'] as Map<String, dynamic>?,
    fcmtoken: json['fcmtoken'] as String?,
    email: json['email'] as String?,
    wallet: json['wallet'] == null
        ? null
        : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
    documentId: json['documentId'] as String?,
    isDismissCompleteProfile:
        json['isDismissCompleteProfile'] as bool? ?? false,
    states:
        (json['states'] as List<dynamic>?)?.map((e) => e as String).toList(),
    isActiveService: json['isActiveService'] as bool?,
    toggleNationWideVisibility: json['toggleNationWideVisibility'] as bool?,
  );
}

Map<String, dynamic> _$_$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'isPhoneNumberVerified': instance.isPhoneNumberVerified,
      'isBuyer': instance.isBuyer,
      'isSeller': instance.isSeller,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'optionalNumber': instance.optionalNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'sellerType': instance.sellerType,
      'skills': instance.skills,
      'serviceId': instance.serviceId,
      'service': instance.service,
      'serviceIcon': instance.serviceIcon,
      'isServiceDefault': instance.isServiceDefault,
      'subServices': instance.subServices,
      'expertiseLevel': instance.expertiseLevel,
      'profilePictureUrl': instance.profilePictureUrl,
      'profileDescriptionTitle': instance.profileDescriptionTitle,
      'profileDescription': instance.profileDescription,
      'joined': instance.joined?.toIso8601String(),
      'completedOrders': instance.completedOrders,
      'uncompletedOrders': instance.uncompletedOrders,
      'totalOrders': instance.totalOrders,
      'available': instance.available,
      'ratings': instance.ratings?.toJson(),
      'orgDetailModel': instance.orgDetailModel,
      'fcmtoken': instance.fcmtoken,
      'email': instance.email,
      'wallet': instance.wallet?.toJson(),
      'documentId': instance.documentId,
      'isDismissCompleteProfile': instance.isDismissCompleteProfile,
      'states': instance.states,
      'isActiveService': instance.isActiveService,
      'toggleNationWideVisibility': instance.toggleNationWideVisibility,
    };
