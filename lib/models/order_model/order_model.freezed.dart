// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
class _$OrderModelTearOff {
  const _$OrderModelTearOff();

  _OrderModel call(
      {required String requestId,
      required String buyerId,
      required String orderStatus,
      required String orderId,
      required String orderState,
      required String sellerId,
      required bool isPaid,
      required bool isDispute,
      required bool isSubmitted,
      bool? isReviewed,
      required bool requireExtension,
      @JsonKey(name: "orderPaymentTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderPaymentTime,
      required bool? orderPaymentExpired,
      @JsonKey(name: "orderDeliveryTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderDeliveryTime,
      @JsonKey(name: "releaseFundTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? releaseFundTime,
      required num? amount,
      required bool? orderDeliveryTimeExpires,
      FileTypeModel? fileTypeModel,
      String? orderNote,
      String? actionType}) {
    return _OrderModel(
      requestId: requestId,
      buyerId: buyerId,
      orderStatus: orderStatus,
      orderId: orderId,
      orderState: orderState,
      sellerId: sellerId,
      isPaid: isPaid,
      isDispute: isDispute,
      isSubmitted: isSubmitted,
      isReviewed: isReviewed,
      requireExtension: requireExtension,
      orderPaymentTime: orderPaymentTime,
      orderPaymentExpired: orderPaymentExpired,
      orderDeliveryTime: orderDeliveryTime,
      releaseFundTime: releaseFundTime,
      amount: amount,
      orderDeliveryTimeExpires: orderDeliveryTimeExpires,
      fileTypeModel: fileTypeModel,
      orderNote: orderNote,
      actionType: actionType,
    );
  }

  OrderModel fromJson(Map<String, Object> json) {
    return OrderModel.fromJson(json);
  }
}

/// @nodoc
const $OrderModel = _$OrderModelTearOff();

/// @nodoc
mixin _$OrderModel {
  String get requestId => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get orderState => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;
  bool get isDispute => throw _privateConstructorUsedError;
  bool get isSubmitted => throw _privateConstructorUsedError;
  bool? get isReviewed => throw _privateConstructorUsedError;
  bool get requireExtension => throw _privateConstructorUsedError;
  @JsonKey(
      name: "orderPaymentTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  DateTime? get orderPaymentTime => throw _privateConstructorUsedError;
  bool? get orderPaymentExpired => throw _privateConstructorUsedError;
  @JsonKey(
      name: "orderDeliveryTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  DateTime? get orderDeliveryTime => throw _privateConstructorUsedError;
  @JsonKey(
      name: "releaseFundTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  DateTime? get releaseFundTime => throw _privateConstructorUsedError;
  num? get amount => throw _privateConstructorUsedError;
  bool? get orderDeliveryTimeExpires => throw _privateConstructorUsedError;
  FileTypeModel? get fileTypeModel => throw _privateConstructorUsedError;
  String? get orderNote => throw _privateConstructorUsedError;
  String? get actionType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res>;
  $Res call(
      {String requestId,
      String buyerId,
      String orderStatus,
      String orderId,
      String orderState,
      String sellerId,
      bool isPaid,
      bool isDispute,
      bool isSubmitted,
      bool? isReviewed,
      bool requireExtension,
      @JsonKey(name: "orderPaymentTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderPaymentTime,
      bool? orderPaymentExpired,
      @JsonKey(name: "orderDeliveryTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderDeliveryTime,
      @JsonKey(name: "releaseFundTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? releaseFundTime,
      num? amount,
      bool? orderDeliveryTimeExpires,
      FileTypeModel? fileTypeModel,
      String? orderNote,
      String? actionType});

  $FileTypeModelCopyWith<$Res>? get fileTypeModel;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  final OrderModel _value;
  // ignore: unused_field
  final $Res Function(OrderModel) _then;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? buyerId = freezed,
    Object? orderStatus = freezed,
    Object? orderId = freezed,
    Object? orderState = freezed,
    Object? sellerId = freezed,
    Object? isPaid = freezed,
    Object? isDispute = freezed,
    Object? isSubmitted = freezed,
    Object? isReviewed = freezed,
    Object? requireExtension = freezed,
    Object? orderPaymentTime = freezed,
    Object? orderPaymentExpired = freezed,
    Object? orderDeliveryTime = freezed,
    Object? releaseFundTime = freezed,
    Object? amount = freezed,
    Object? orderDeliveryTimeExpires = freezed,
    Object? fileTypeModel = freezed,
    Object? orderNote = freezed,
    Object? actionType = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderState: orderState == freezed
          ? _value.orderState
          : orderState // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      isDispute: isDispute == freezed
          ? _value.isDispute
          : isDispute // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitted: isSubmitted == freezed
          ? _value.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isReviewed: isReviewed == freezed
          ? _value.isReviewed
          : isReviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      requireExtension: requireExtension == freezed
          ? _value.requireExtension
          : requireExtension // ignore: cast_nullable_to_non_nullable
              as bool,
      orderPaymentTime: orderPaymentTime == freezed
          ? _value.orderPaymentTime
          : orderPaymentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderPaymentExpired: orderPaymentExpired == freezed
          ? _value.orderPaymentExpired
          : orderPaymentExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderDeliveryTime: orderDeliveryTime == freezed
          ? _value.orderDeliveryTime
          : orderDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseFundTime: releaseFundTime == freezed
          ? _value.releaseFundTime
          : releaseFundTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      orderDeliveryTimeExpires: orderDeliveryTimeExpires == freezed
          ? _value.orderDeliveryTimeExpires
          : orderDeliveryTimeExpires // ignore: cast_nullable_to_non_nullable
              as bool?,
      fileTypeModel: fileTypeModel == freezed
          ? _value.fileTypeModel
          : fileTypeModel // ignore: cast_nullable_to_non_nullable
              as FileTypeModel?,
      orderNote: orderNote == freezed
          ? _value.orderNote
          : orderNote // ignore: cast_nullable_to_non_nullable
              as String?,
      actionType: actionType == freezed
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $FileTypeModelCopyWith<$Res>? get fileTypeModel {
    if (_value.fileTypeModel == null) {
      return null;
    }

    return $FileTypeModelCopyWith<$Res>(_value.fileTypeModel!, (value) {
      return _then(_value.copyWith(fileTypeModel: value));
    });
  }
}

/// @nodoc
abstract class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) then) =
      __$OrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String requestId,
      String buyerId,
      String orderStatus,
      String orderId,
      String orderState,
      String sellerId,
      bool isPaid,
      bool isDispute,
      bool isSubmitted,
      bool? isReviewed,
      bool requireExtension,
      @JsonKey(name: "orderPaymentTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderPaymentTime,
      bool? orderPaymentExpired,
      @JsonKey(name: "orderDeliveryTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderDeliveryTime,
      @JsonKey(name: "releaseFundTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? releaseFundTime,
      num? amount,
      bool? orderDeliveryTimeExpires,
      FileTypeModel? fileTypeModel,
      String? orderNote,
      String? actionType});

  @override
  $FileTypeModelCopyWith<$Res>? get fileTypeModel;
}

/// @nodoc
class __$OrderModelCopyWithImpl<$Res> extends _$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(
      _OrderModel _value, $Res Function(_OrderModel) _then)
      : super(_value, (v) => _then(v as _OrderModel));

  @override
  _OrderModel get _value => super._value as _OrderModel;

  @override
  $Res call({
    Object? requestId = freezed,
    Object? buyerId = freezed,
    Object? orderStatus = freezed,
    Object? orderId = freezed,
    Object? orderState = freezed,
    Object? sellerId = freezed,
    Object? isPaid = freezed,
    Object? isDispute = freezed,
    Object? isSubmitted = freezed,
    Object? isReviewed = freezed,
    Object? requireExtension = freezed,
    Object? orderPaymentTime = freezed,
    Object? orderPaymentExpired = freezed,
    Object? orderDeliveryTime = freezed,
    Object? releaseFundTime = freezed,
    Object? amount = freezed,
    Object? orderDeliveryTimeExpires = freezed,
    Object? fileTypeModel = freezed,
    Object? orderNote = freezed,
    Object? actionType = freezed,
  }) {
    return _then(_OrderModel(
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderState: orderState == freezed
          ? _value.orderState
          : orderState // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: isPaid == freezed
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      isDispute: isDispute == freezed
          ? _value.isDispute
          : isDispute // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitted: isSubmitted == freezed
          ? _value.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isReviewed: isReviewed == freezed
          ? _value.isReviewed
          : isReviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      requireExtension: requireExtension == freezed
          ? _value.requireExtension
          : requireExtension // ignore: cast_nullable_to_non_nullable
              as bool,
      orderPaymentTime: orderPaymentTime == freezed
          ? _value.orderPaymentTime
          : orderPaymentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderPaymentExpired: orderPaymentExpired == freezed
          ? _value.orderPaymentExpired
          : orderPaymentExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderDeliveryTime: orderDeliveryTime == freezed
          ? _value.orderDeliveryTime
          : orderDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseFundTime: releaseFundTime == freezed
          ? _value.releaseFundTime
          : releaseFundTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      orderDeliveryTimeExpires: orderDeliveryTimeExpires == freezed
          ? _value.orderDeliveryTimeExpires
          : orderDeliveryTimeExpires // ignore: cast_nullable_to_non_nullable
              as bool?,
      fileTypeModel: fileTypeModel == freezed
          ? _value.fileTypeModel
          : fileTypeModel // ignore: cast_nullable_to_non_nullable
              as FileTypeModel?,
      orderNote: orderNote == freezed
          ? _value.orderNote
          : orderNote // ignore: cast_nullable_to_non_nullable
              as String?,
      actionType: actionType == freezed
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {required this.requestId,
      required this.buyerId,
      required this.orderStatus,
      required this.orderId,
      required this.orderState,
      required this.sellerId,
      required this.isPaid,
      required this.isDispute,
      required this.isSubmitted,
      this.isReviewed,
      required this.requireExtension,
      @JsonKey(name: "orderPaymentTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.orderPaymentTime,
      required this.orderPaymentExpired,
      @JsonKey(name: "orderDeliveryTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.orderDeliveryTime,
      @JsonKey(name: "releaseFundTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.releaseFundTime,
      required this.amount,
      required this.orderDeliveryTimeExpires,
      this.fileTypeModel,
      this.orderNote,
      this.actionType});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderModelFromJson(json);

  @override
  final String requestId;
  @override
  final String buyerId;
  @override
  final String orderStatus;
  @override
  final String orderId;
  @override
  final String orderState;
  @override
  final String sellerId;
  @override
  final bool isPaid;
  @override
  final bool isDispute;
  @override
  final bool isSubmitted;
  @override
  final bool? isReviewed;
  @override
  final bool requireExtension;
  @override
  @JsonKey(
      name: "orderPaymentTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  final DateTime? orderPaymentTime;
  @override
  final bool? orderPaymentExpired;
  @override
  @JsonKey(
      name: "orderDeliveryTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  final DateTime? orderDeliveryTime;
  @override
  @JsonKey(
      name: "releaseFundTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  final DateTime? releaseFundTime;
  @override
  final num? amount;
  @override
  final bool? orderDeliveryTimeExpires;
  @override
  final FileTypeModel? fileTypeModel;
  @override
  final String? orderNote;
  @override
  final String? actionType;

  @override
  String toString() {
    return 'OrderModel(requestId: $requestId, buyerId: $buyerId, orderStatus: $orderStatus, orderId: $orderId, orderState: $orderState, sellerId: $sellerId, isPaid: $isPaid, isDispute: $isDispute, isSubmitted: $isSubmitted, isReviewed: $isReviewed, requireExtension: $requireExtension, orderPaymentTime: $orderPaymentTime, orderPaymentExpired: $orderPaymentExpired, orderDeliveryTime: $orderDeliveryTime, releaseFundTime: $releaseFundTime, amount: $amount, orderDeliveryTimeExpires: $orderDeliveryTimeExpires, fileTypeModel: $fileTypeModel, orderNote: $orderNote, actionType: $actionType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderModel &&
            (identical(other.requestId, requestId) ||
                const DeepCollectionEquality()
                    .equals(other.requestId, requestId)) &&
            (identical(other.buyerId, buyerId) ||
                const DeepCollectionEquality()
                    .equals(other.buyerId, buyerId)) &&
            (identical(other.orderStatus, orderStatus) ||
                const DeepCollectionEquality()
                    .equals(other.orderStatus, orderStatus)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.orderState, orderState) ||
                const DeepCollectionEquality()
                    .equals(other.orderState, orderState)) &&
            (identical(other.sellerId, sellerId) ||
                const DeepCollectionEquality()
                    .equals(other.sellerId, sellerId)) &&
            (identical(other.isPaid, isPaid) ||
                const DeepCollectionEquality().equals(other.isPaid, isPaid)) &&
            (identical(other.isDispute, isDispute) ||
                const DeepCollectionEquality()
                    .equals(other.isDispute, isDispute)) &&
            (identical(other.isSubmitted, isSubmitted) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitted, isSubmitted)) &&
            (identical(other.isReviewed, isReviewed) ||
                const DeepCollectionEquality()
                    .equals(other.isReviewed, isReviewed)) &&
            (identical(other.requireExtension, requireExtension) ||
                const DeepCollectionEquality()
                    .equals(other.requireExtension, requireExtension)) &&
            (identical(other.orderPaymentTime, orderPaymentTime) ||
                const DeepCollectionEquality()
                    .equals(other.orderPaymentTime, orderPaymentTime)) &&
            (identical(other.orderPaymentExpired, orderPaymentExpired) ||
                const DeepCollectionEquality()
                    .equals(other.orderPaymentExpired, orderPaymentExpired)) &&
            (identical(other.orderDeliveryTime, orderDeliveryTime) ||
                const DeepCollectionEquality()
                    .equals(other.orderDeliveryTime, orderDeliveryTime)) &&
            (identical(other.releaseFundTime, releaseFundTime) ||
                const DeepCollectionEquality()
                    .equals(other.releaseFundTime, releaseFundTime)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(
                    other.orderDeliveryTimeExpires, orderDeliveryTimeExpires) ||
                const DeepCollectionEquality().equals(
                    other.orderDeliveryTimeExpires,
                    orderDeliveryTimeExpires)) &&
            (identical(other.fileTypeModel, fileTypeModel) ||
                const DeepCollectionEquality()
                    .equals(other.fileTypeModel, fileTypeModel)) &&
            (identical(other.orderNote, orderNote) ||
                const DeepCollectionEquality()
                    .equals(other.orderNote, orderNote)) &&
            (identical(other.actionType, actionType) ||
                const DeepCollectionEquality()
                    .equals(other.actionType, actionType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(requestId) ^
      const DeepCollectionEquality().hash(buyerId) ^
      const DeepCollectionEquality().hash(orderStatus) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(orderState) ^
      const DeepCollectionEquality().hash(sellerId) ^
      const DeepCollectionEquality().hash(isPaid) ^
      const DeepCollectionEquality().hash(isDispute) ^
      const DeepCollectionEquality().hash(isSubmitted) ^
      const DeepCollectionEquality().hash(isReviewed) ^
      const DeepCollectionEquality().hash(requireExtension) ^
      const DeepCollectionEquality().hash(orderPaymentTime) ^
      const DeepCollectionEquality().hash(orderPaymentExpired) ^
      const DeepCollectionEquality().hash(orderDeliveryTime) ^
      const DeepCollectionEquality().hash(releaseFundTime) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(orderDeliveryTimeExpires) ^
      const DeepCollectionEquality().hash(fileTypeModel) ^
      const DeepCollectionEquality().hash(orderNote) ^
      const DeepCollectionEquality().hash(actionType);

  @JsonKey(ignore: true)
  @override
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderModelToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required String requestId,
      required String buyerId,
      required String orderStatus,
      required String orderId,
      required String orderState,
      required String sellerId,
      required bool isPaid,
      required bool isDispute,
      required bool isSubmitted,
      bool? isReviewed,
      required bool requireExtension,
      @JsonKey(name: "orderPaymentTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderPaymentTime,
      required bool? orderPaymentExpired,
      @JsonKey(name: "orderDeliveryTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? orderDeliveryTime,
      @JsonKey(name: "releaseFundTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? releaseFundTime,
      required num? amount,
      required bool? orderDeliveryTimeExpires,
      FileTypeModel? fileTypeModel,
      String? orderNote,
      String? actionType}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  String get requestId => throw _privateConstructorUsedError;
  @override
  String get buyerId => throw _privateConstructorUsedError;
  @override
  String get orderStatus => throw _privateConstructorUsedError;
  @override
  String get orderId => throw _privateConstructorUsedError;
  @override
  String get orderState => throw _privateConstructorUsedError;
  @override
  String get sellerId => throw _privateConstructorUsedError;
  @override
  bool get isPaid => throw _privateConstructorUsedError;
  @override
  bool get isDispute => throw _privateConstructorUsedError;
  @override
  bool get isSubmitted => throw _privateConstructorUsedError;
  @override
  bool? get isReviewed => throw _privateConstructorUsedError;
  @override
  bool get requireExtension => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "orderPaymentTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  DateTime? get orderPaymentTime => throw _privateConstructorUsedError;
  @override
  bool? get orderPaymentExpired => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "orderDeliveryTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  DateTime? get orderDeliveryTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "releaseFundTime",
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson)
  DateTime? get releaseFundTime => throw _privateConstructorUsedError;
  @override
  num? get amount => throw _privateConstructorUsedError;
  @override
  bool? get orderDeliveryTimeExpires => throw _privateConstructorUsedError;
  @override
  FileTypeModel? get fileTypeModel => throw _privateConstructorUsedError;
  @override
  String? get orderNote => throw _privateConstructorUsedError;
  @override
  String? get actionType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
