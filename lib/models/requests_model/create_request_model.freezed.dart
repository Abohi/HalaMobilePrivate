// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'create_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateRequestModel _$CreateRequestModelFromJson(Map<String, dynamic> json) {
  return _CreateRequestModel.fromJson(json);
}

/// @nodoc
class _$CreateRequestModelTearOff {
  const _$CreateRequestModelTearOff();

  _CreateRequestModel call(
      {required String service,
      required List<String> subServices,
      required List<String> skills,
      required String serviceId,
      required String state,
      required String localGovt,
      required String userId,
      String? requestId,
      required bool requestStatus,
      required String title,
      required String description,
      required String budget,
      required String date}) {
    return _CreateRequestModel(
      service: service,
      subServices: subServices,
      skills: skills,
      serviceId: serviceId,
      state: state,
      localGovt: localGovt,
      userId: userId,
      requestId: requestId,
      requestStatus: requestStatus,
      title: title,
      description: description,
      budget: budget,
      date: date,
    );
  }

  CreateRequestModel fromJson(Map<String, Object> json) {
    return CreateRequestModel.fromJson(json);
  }
}

/// @nodoc
const $CreateRequestModel = _$CreateRequestModelTearOff();

/// @nodoc
mixin _$CreateRequestModel {
  String get service => throw _privateConstructorUsedError;
  List<String> get subServices => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  String get serviceId => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get localGovt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  bool get requestStatus => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get budget => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRequestModelCopyWith<CreateRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRequestModelCopyWith<$Res> {
  factory $CreateRequestModelCopyWith(
          CreateRequestModel value, $Res Function(CreateRequestModel) then) =
      _$CreateRequestModelCopyWithImpl<$Res>;
  $Res call(
      {String service,
      List<String> subServices,
      List<String> skills,
      String serviceId,
      String state,
      String localGovt,
      String userId,
      String? requestId,
      bool requestStatus,
      String title,
      String description,
      String budget,
      String date});
}

/// @nodoc
class _$CreateRequestModelCopyWithImpl<$Res>
    implements $CreateRequestModelCopyWith<$Res> {
  _$CreateRequestModelCopyWithImpl(this._value, this._then);

  final CreateRequestModel _value;
  // ignore: unused_field
  final $Res Function(CreateRequestModel) _then;

  @override
  $Res call({
    Object? service = freezed,
    Object? subServices = freezed,
    Object? skills = freezed,
    Object? serviceId = freezed,
    Object? state = freezed,
    Object? localGovt = freezed,
    Object? userId = freezed,
    Object? requestId = freezed,
    Object? requestStatus = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? budget = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      subServices: subServices == freezed
          ? _value.subServices
          : subServices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      localGovt: localGovt == freezed
          ? _value.localGovt
          : localGovt // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: budget == freezed
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateRequestModelCopyWith<$Res>
    implements $CreateRequestModelCopyWith<$Res> {
  factory _$CreateRequestModelCopyWith(
          _CreateRequestModel value, $Res Function(_CreateRequestModel) then) =
      __$CreateRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String service,
      List<String> subServices,
      List<String> skills,
      String serviceId,
      String state,
      String localGovt,
      String userId,
      String? requestId,
      bool requestStatus,
      String title,
      String description,
      String budget,
      String date});
}

/// @nodoc
class __$CreateRequestModelCopyWithImpl<$Res>
    extends _$CreateRequestModelCopyWithImpl<$Res>
    implements _$CreateRequestModelCopyWith<$Res> {
  __$CreateRequestModelCopyWithImpl(
      _CreateRequestModel _value, $Res Function(_CreateRequestModel) _then)
      : super(_value, (v) => _then(v as _CreateRequestModel));

  @override
  _CreateRequestModel get _value => super._value as _CreateRequestModel;

  @override
  $Res call({
    Object? service = freezed,
    Object? subServices = freezed,
    Object? skills = freezed,
    Object? serviceId = freezed,
    Object? state = freezed,
    Object? localGovt = freezed,
    Object? userId = freezed,
    Object? requestId = freezed,
    Object? requestStatus = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? budget = freezed,
    Object? date = freezed,
  }) {
    return _then(_CreateRequestModel(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      subServices: subServices == freezed
          ? _value.subServices
          : subServices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      skills: skills == freezed
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      localGovt: localGovt == freezed
          ? _value.localGovt
          : localGovt // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: budget == freezed
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateRequestModel implements _CreateRequestModel {
  const _$_CreateRequestModel(
      {required this.service,
      required this.subServices,
      required this.skills,
      required this.serviceId,
      required this.state,
      required this.localGovt,
      required this.userId,
      this.requestId,
      required this.requestStatus,
      required this.title,
      required this.description,
      required this.budget,
      required this.date});

  factory _$_CreateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CreateRequestModelFromJson(json);

  @override
  final String service;
  @override
  final List<String> subServices;
  @override
  final List<String> skills;
  @override
  final String serviceId;
  @override
  final String state;
  @override
  final String localGovt;
  @override
  final String userId;
  @override
  final String? requestId;
  @override
  final bool requestStatus;
  @override
  final String title;
  @override
  final String description;
  @override
  final String budget;
  @override
  final String date;

  @override
  String toString() {
    return 'CreateRequestModel(service: $service, subServices: $subServices, skills: $skills, serviceId: $serviceId, state: $state, localGovt: $localGovt, userId: $userId, requestId: $requestId, requestStatus: $requestStatus, title: $title, description: $description, budget: $budget, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreateRequestModel &&
            (identical(other.service, service) ||
                const DeepCollectionEquality()
                    .equals(other.service, service)) &&
            (identical(other.subServices, subServices) ||
                const DeepCollectionEquality()
                    .equals(other.subServices, subServices)) &&
            (identical(other.skills, skills) ||
                const DeepCollectionEquality().equals(other.skills, skills)) &&
            (identical(other.serviceId, serviceId) ||
                const DeepCollectionEquality()
                    .equals(other.serviceId, serviceId)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.localGovt, localGovt) ||
                const DeepCollectionEquality()
                    .equals(other.localGovt, localGovt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.requestId, requestId) ||
                const DeepCollectionEquality()
                    .equals(other.requestId, requestId)) &&
            (identical(other.requestStatus, requestStatus) ||
                const DeepCollectionEquality()
                    .equals(other.requestStatus, requestStatus)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(service) ^
      const DeepCollectionEquality().hash(subServices) ^
      const DeepCollectionEquality().hash(skills) ^
      const DeepCollectionEquality().hash(serviceId) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(localGovt) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(requestId) ^
      const DeepCollectionEquality().hash(requestStatus) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$CreateRequestModelCopyWith<_CreateRequestModel> get copyWith =>
      __$CreateRequestModelCopyWithImpl<_CreateRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreateRequestModelToJson(this);
  }
}

abstract class _CreateRequestModel implements CreateRequestModel {
  const factory _CreateRequestModel(
      {required String service,
      required List<String> subServices,
      required List<String> skills,
      required String serviceId,
      required String state,
      required String localGovt,
      required String userId,
      String? requestId,
      required bool requestStatus,
      required String title,
      required String description,
      required String budget,
      required String date}) = _$_CreateRequestModel;

  factory _CreateRequestModel.fromJson(Map<String, dynamic> json) =
      _$_CreateRequestModel.fromJson;

  @override
  String get service => throw _privateConstructorUsedError;
  @override
  List<String> get subServices => throw _privateConstructorUsedError;
  @override
  List<String> get skills => throw _privateConstructorUsedError;
  @override
  String get serviceId => throw _privateConstructorUsedError;
  @override
  String get state => throw _privateConstructorUsedError;
  @override
  String get localGovt => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String? get requestId => throw _privateConstructorUsedError;
  @override
  bool get requestStatus => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get budget => throw _privateConstructorUsedError;
  @override
  String get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CreateRequestModelCopyWith<_CreateRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
