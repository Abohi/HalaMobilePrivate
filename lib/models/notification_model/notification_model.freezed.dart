// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
class _$NotificationModelTearOff {
  const _$NotificationModelTearOff();

  _NotificationModel call(
      {required String buyerId,
      required String requestId,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      required String title,
      bool isOpen = false,
      String? notificationId}) {
    return _NotificationModel(
      buyerId: buyerId,
      requestId: requestId,
      createdAt: createdAt,
      title: title,
      isOpen: isOpen,
      notificationId: notificationId,
    );
  }

  NotificationModel fromJson(Map<String, Object> json) {
    return NotificationModel.fromJson(json);
  }
}

/// @nodoc
const $NotificationModel = _$NotificationModelTearOff();

/// @nodoc
mixin _$NotificationModel {
  String get buyerId => throw _privateConstructorUsedError;
  String get requestId => throw _privateConstructorUsedError;
  @JsonKey(
      name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  String? get notificationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res>;
  $Res call(
      {String buyerId,
      String requestId,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      String title,
      bool isOpen,
      String? notificationId});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  final NotificationModel _value;
  // ignore: unused_field
  final $Res Function(NotificationModel) _then;

  @override
  $Res call({
    Object? buyerId = freezed,
    Object? requestId = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? isOpen = freezed,
    Object? notificationId = freezed,
  }) {
    return _then(_value.copyWith(
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(
          _NotificationModel value, $Res Function(_NotificationModel) then) =
      __$NotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String buyerId,
      String requestId,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      String title,
      bool isOpen,
      String? notificationId});
}

/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(
      _NotificationModel _value, $Res Function(_NotificationModel) _then)
      : super(_value, (v) => _then(v as _NotificationModel));

  @override
  _NotificationModel get _value => super._value as _NotificationModel;

  @override
  $Res call({
    Object? buyerId = freezed,
    Object? requestId = freezed,
    Object? createdAt = freezed,
    Object? title = freezed,
    Object? isOpen = freezed,
    Object? notificationId = freezed,
  }) {
    return _then(_NotificationModel(
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationModel implements _NotificationModel {
  const _$_NotificationModel(
      {required this.buyerId,
      required this.requestId,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.createdAt,
      required this.title,
      this.isOpen = false,
      this.notificationId});

  factory _$_NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationModelFromJson(json);

  @override
  final String buyerId;
  @override
  final String requestId;
  @override
  @JsonKey(
      name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? createdAt;
  @override
  final String title;
  @JsonKey(defaultValue: false)
  @override
  final bool isOpen;
  @override
  final String? notificationId;

  @override
  String toString() {
    return 'NotificationModel(buyerId: $buyerId, requestId: $requestId, createdAt: $createdAt, title: $title, isOpen: $isOpen, notificationId: $notificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationModel &&
            (identical(other.buyerId, buyerId) ||
                const DeepCollectionEquality()
                    .equals(other.buyerId, buyerId)) &&
            (identical(other.requestId, requestId) ||
                const DeepCollectionEquality()
                    .equals(other.requestId, requestId)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.isOpen, isOpen) ||
                const DeepCollectionEquality().equals(other.isOpen, isOpen)) &&
            (identical(other.notificationId, notificationId) ||
                const DeepCollectionEquality()
                    .equals(other.notificationId, notificationId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(buyerId) ^
      const DeepCollectionEquality().hash(requestId) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(isOpen) ^
      const DeepCollectionEquality().hash(notificationId);

  @JsonKey(ignore: true)
  @override
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationModelToJson(this);
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
      {required String buyerId,
      required String requestId,
      @JsonKey(name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      required String title,
      bool isOpen,
      String? notificationId}) = _$_NotificationModel;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationModel.fromJson;

  @override
  String get buyerId => throw _privateConstructorUsedError;
  @override
  String get requestId => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "createdAt", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  bool get isOpen => throw _privateConstructorUsedError;
  @override
  String? get notificationId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
