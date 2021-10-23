// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dispute_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DisputeModel _$DisputeModelFromJson(Map<String, dynamic> json) {
  return _DisputeModel.fromJson(json);
}

/// @nodoc
class _$DisputeModelTearOff {
  const _$DisputeModelTearOff();

  _DisputeModel call(
      {required String ticketType,
      required String reason,
      required DateTime disputeCreatedTime,
      required String buyerId,
      required String sellerId,
      required bool disputeStatus,
      String? disputeId}) {
    return _DisputeModel(
      ticketType: ticketType,
      reason: reason,
      disputeCreatedTime: disputeCreatedTime,
      buyerId: buyerId,
      sellerId: sellerId,
      disputeStatus: disputeStatus,
      disputeId: disputeId,
    );
  }

  DisputeModel fromJson(Map<String, Object> json) {
    return DisputeModel.fromJson(json);
  }
}

/// @nodoc
const $DisputeModel = _$DisputeModelTearOff();

/// @nodoc
mixin _$DisputeModel {
  String get ticketType => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  DateTime get disputeCreatedTime => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  bool get disputeStatus => throw _privateConstructorUsedError;
  String? get disputeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisputeModelCopyWith<DisputeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisputeModelCopyWith<$Res> {
  factory $DisputeModelCopyWith(
          DisputeModel value, $Res Function(DisputeModel) then) =
      _$DisputeModelCopyWithImpl<$Res>;
  $Res call(
      {String ticketType,
      String reason,
      DateTime disputeCreatedTime,
      String buyerId,
      String sellerId,
      bool disputeStatus,
      String? disputeId});
}

/// @nodoc
class _$DisputeModelCopyWithImpl<$Res> implements $DisputeModelCopyWith<$Res> {
  _$DisputeModelCopyWithImpl(this._value, this._then);

  final DisputeModel _value;
  // ignore: unused_field
  final $Res Function(DisputeModel) _then;

  @override
  $Res call({
    Object? ticketType = freezed,
    Object? reason = freezed,
    Object? disputeCreatedTime = freezed,
    Object? buyerId = freezed,
    Object? sellerId = freezed,
    Object? disputeStatus = freezed,
    Object? disputeId = freezed,
  }) {
    return _then(_value.copyWith(
      ticketType: ticketType == freezed
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      disputeCreatedTime: disputeCreatedTime == freezed
          ? _value.disputeCreatedTime
          : disputeCreatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      disputeStatus: disputeStatus == freezed
          ? _value.disputeStatus
          : disputeStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      disputeId: disputeId == freezed
          ? _value.disputeId
          : disputeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DisputeModelCopyWith<$Res>
    implements $DisputeModelCopyWith<$Res> {
  factory _$DisputeModelCopyWith(
          _DisputeModel value, $Res Function(_DisputeModel) then) =
      __$DisputeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String ticketType,
      String reason,
      DateTime disputeCreatedTime,
      String buyerId,
      String sellerId,
      bool disputeStatus,
      String? disputeId});
}

/// @nodoc
class __$DisputeModelCopyWithImpl<$Res> extends _$DisputeModelCopyWithImpl<$Res>
    implements _$DisputeModelCopyWith<$Res> {
  __$DisputeModelCopyWithImpl(
      _DisputeModel _value, $Res Function(_DisputeModel) _then)
      : super(_value, (v) => _then(v as _DisputeModel));

  @override
  _DisputeModel get _value => super._value as _DisputeModel;

  @override
  $Res call({
    Object? ticketType = freezed,
    Object? reason = freezed,
    Object? disputeCreatedTime = freezed,
    Object? buyerId = freezed,
    Object? sellerId = freezed,
    Object? disputeStatus = freezed,
    Object? disputeId = freezed,
  }) {
    return _then(_DisputeModel(
      ticketType: ticketType == freezed
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      disputeCreatedTime: disputeCreatedTime == freezed
          ? _value.disputeCreatedTime
          : disputeCreatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      disputeStatus: disputeStatus == freezed
          ? _value.disputeStatus
          : disputeStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      disputeId: disputeId == freezed
          ? _value.disputeId
          : disputeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DisputeModel implements _DisputeModel {
  const _$_DisputeModel(
      {required this.ticketType,
      required this.reason,
      required this.disputeCreatedTime,
      required this.buyerId,
      required this.sellerId,
      required this.disputeStatus,
      this.disputeId});

  factory _$_DisputeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_DisputeModelFromJson(json);

  @override
  final String ticketType;
  @override
  final String reason;
  @override
  final DateTime disputeCreatedTime;
  @override
  final String buyerId;
  @override
  final String sellerId;
  @override
  final bool disputeStatus;
  @override
  final String? disputeId;

  @override
  String toString() {
    return 'DisputeModel(ticketType: $ticketType, reason: $reason, disputeCreatedTime: $disputeCreatedTime, buyerId: $buyerId, sellerId: $sellerId, disputeStatus: $disputeStatus, disputeId: $disputeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DisputeModel &&
            (identical(other.ticketType, ticketType) ||
                const DeepCollectionEquality()
                    .equals(other.ticketType, ticketType)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.disputeCreatedTime, disputeCreatedTime) ||
                const DeepCollectionEquality()
                    .equals(other.disputeCreatedTime, disputeCreatedTime)) &&
            (identical(other.buyerId, buyerId) ||
                const DeepCollectionEquality()
                    .equals(other.buyerId, buyerId)) &&
            (identical(other.sellerId, sellerId) ||
                const DeepCollectionEquality()
                    .equals(other.sellerId, sellerId)) &&
            (identical(other.disputeStatus, disputeStatus) ||
                const DeepCollectionEquality()
                    .equals(other.disputeStatus, disputeStatus)) &&
            (identical(other.disputeId, disputeId) ||
                const DeepCollectionEquality()
                    .equals(other.disputeId, disputeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ticketType) ^
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(disputeCreatedTime) ^
      const DeepCollectionEquality().hash(buyerId) ^
      const DeepCollectionEquality().hash(sellerId) ^
      const DeepCollectionEquality().hash(disputeStatus) ^
      const DeepCollectionEquality().hash(disputeId);

  @JsonKey(ignore: true)
  @override
  _$DisputeModelCopyWith<_DisputeModel> get copyWith =>
      __$DisputeModelCopyWithImpl<_DisputeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DisputeModelToJson(this);
  }
}

abstract class _DisputeModel implements DisputeModel {
  const factory _DisputeModel(
      {required String ticketType,
      required String reason,
      required DateTime disputeCreatedTime,
      required String buyerId,
      required String sellerId,
      required bool disputeStatus,
      String? disputeId}) = _$_DisputeModel;

  factory _DisputeModel.fromJson(Map<String, dynamic> json) =
      _$_DisputeModel.fromJson;

  @override
  String get ticketType => throw _privateConstructorUsedError;
  @override
  String get reason => throw _privateConstructorUsedError;
  @override
  DateTime get disputeCreatedTime => throw _privateConstructorUsedError;
  @override
  String get buyerId => throw _privateConstructorUsedError;
  @override
  String get sellerId => throw _privateConstructorUsedError;
  @override
  bool get disputeStatus => throw _privateConstructorUsedError;
  @override
  String? get disputeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DisputeModelCopyWith<_DisputeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
