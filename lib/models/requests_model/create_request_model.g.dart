// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateRequestModel _$_$_CreateRequestModelFromJson(
    Map<String, dynamic> json) {
  return _$_CreateRequestModel(
    service: json['service'] as String,
    subServices:
        (json['subServices'] as List<dynamic>).map((e) => e as String).toList(),
    skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    serviceId: json['serviceId'] as String,
    state: json['state'] as String,
    localGovt: json['localGovt'] as String,
    userId: json['userId'] as String,
    requestId: json['requestId'] as String?,
    requestStatus: json['requestStatus'] as bool,
    title: json['title'] as String,
    description: json['description'] as String,
    budget: json['budget'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$_$_CreateRequestModelToJson(
        _$_CreateRequestModel instance) =>
    <String, dynamic>{
      'service': instance.service,
      'subServices': instance.subServices,
      'skills': instance.skills,
      'serviceId': instance.serviceId,
      'state': instance.state,
      'localGovt': instance.localGovt,
      'userId': instance.userId,
      'requestId': instance.requestId,
      'requestStatus': instance.requestStatus,
      'title': instance.title,
      'description': instance.description,
      'budget': instance.budget,
      'date': instance.date,
    };
