// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'modification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModificationModel _$ModificationModelFromJson(Map<String, dynamic> json) {
  return _ModificationModel.fromJson(json);
}

/// @nodoc
class _$ModificationModelTearOff {
  const _$ModificationModelTearOff();

  _ModificationModel call(
      {required String reason,
      num? amount,
      String? amountString,
      required String buyerId,
      required String sellerId,
      @JsonKey(name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdDate,
      required String requestTitle,
      @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? time,
      @JsonKey(name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? decisionTime,
      String? modificationId}) {
    return _ModificationModel(
      reason: reason,
      amount: amount,
      amountString: amountString,
      buyerId: buyerId,
      sellerId: sellerId,
      createdDate: createdDate,
      requestTitle: requestTitle,
      time: time,
      decisionTime: decisionTime,
      modificationId: modificationId,
    );
  }

  ModificationModel fromJson(Map<String, Object> json) {
    return ModificationModel.fromJson(json);
  }
}

/// @nodoc
const $ModificationModel = _$ModificationModelTearOff();

/// @nodoc
mixin _$ModificationModel {
  String get reason => throw _privateConstructorUsedError;
  num? get amount => throw _privateConstructorUsedError;
  String? get amountString => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  String get sellerId => throw _privateConstructorUsedError;
  @JsonKey(
      name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdDate => throw _privateConstructorUsedError;
  String get requestTitle => throw _privateConstructorUsedError;
  @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get time => throw _privateConstructorUsedError;
  @JsonKey(
      name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get decisionTime => throw _privateConstructorUsedError;
  String? get modificationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModificationModelCopyWith<ModificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModificationModelCopyWith<$Res> {
  factory $ModificationModelCopyWith(
          ModificationModel value, $Res Function(ModificationModel) then) =
      _$ModificationModelCopyWithImpl<$Res>;
  $Res call(
      {String reason,
      num? amount,
      String? amountString,
      String buyerId,
      String sellerId,
      @JsonKey(name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdDate,
      String requestTitle,
      @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? time,
      @JsonKey(name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? decisionTime,
      String? modificationId});
}

/// @nodoc
class _$ModificationModelCopyWithImpl<$Res>
    implements $ModificationModelCopyWith<$Res> {
  _$ModificationModelCopyWithImpl(this._value, this._then);

  final ModificationModel _value;
  // ignore: unused_field
  final $Res Function(ModificationModel) _then;

  @override
  $Res call({
    Object? reason = freezed,
    Object? amount = freezed,
    Object? amountString = freezed,
    Object? buyerId = freezed,
    Object? sellerId = freezed,
    Object? createdDate = freezed,
    Object? requestTitle = freezed,
    Object? time = freezed,
    Object? decisionTime = freezed,
    Object? modificationId = freezed,
  }) {
    return _then(_value.copyWith(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      amountString: amountString == freezed
          ? _value.amountString
          : amountString // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requestTitle: requestTitle == freezed
          ? _value.requestTitle
          : requestTitle // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decisionTime: decisionTime == freezed
          ? _value.decisionTime
          : decisionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modificationId: modificationId == freezed
          ? _value.modificationId
          : modificationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ModificationModelCopyWith<$Res>
    implements $ModificationModelCopyWith<$Res> {
  factory _$ModificationModelCopyWith(
          _ModificationModel value, $Res Function(_ModificationModel) then) =
      __$ModificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String reason,
      num? amount,
      String? amountString,
      String buyerId,
      String sellerId,
      @JsonKey(name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdDate,
      String requestTitle,
      @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? time,
      @JsonKey(name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? decisionTime,
      String? modificationId});
}

/// @nodoc
class __$ModificationModelCopyWithImpl<$Res>
    extends _$ModificationModelCopyWithImpl<$Res>
    implements _$ModificationModelCopyWith<$Res> {
  __$ModificationModelCopyWithImpl(
      _ModificationModel _value, $Res Function(_ModificationModel) _then)
      : super(_value, (v) => _then(v as _ModificationModel));

  @override
  _ModificationModel get _value => super._value as _ModificationModel;

  @override
  $Res call({
    Object? reason = freezed,
    Object? amount = freezed,
    Object? amountString = freezed,
    Object? buyerId = freezed,
    Object? sellerId = freezed,
    Object? createdDate = freezed,
    Object? requestTitle = freezed,
    Object? time = freezed,
    Object? decisionTime = freezed,
    Object? modificationId = freezed,
  }) {
    return _then(_ModificationModel(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      amountString: amountString == freezed
          ? _value.amountString
          : amountString // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerId: buyerId == freezed
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      requestTitle: requestTitle == freezed
          ? _value.requestTitle
          : requestTitle // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decisionTime: decisionTime == freezed
          ? _value.decisionTime
          : decisionTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modificationId: modificationId == freezed
          ? _value.modificationId
          : modificationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModificationModel implements _ModificationModel {
  const _$_ModificationModel(
      {required this.reason,
      this.amount,
      this.amountString,
      required this.buyerId,
      required this.sellerId,
      @JsonKey(name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.createdDate,
      required this.requestTitle,
      @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.time,
      @JsonKey(name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.decisionTime,
      this.modificationId});

  factory _$_ModificationModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ModificationModelFromJson(json);

  @override
  final String reason;
  @override
  final num? amount;
  @override
  final String? amountString;
  @override
  final String buyerId;
  @override
  final String sellerId;
  @override
  @JsonKey(
      name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? createdDate;
  @override
  final String requestTitle;
  @override
  @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? time;
  @override
  @JsonKey(
      name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? decisionTime;
  @override
  final String? modificationId;

  @override
  String toString() {
    return 'ModificationModel(reason: $reason, amount: $amount, amountString: $amountString, buyerId: $buyerId, sellerId: $sellerId, createdDate: $createdDate, requestTitle: $requestTitle, time: $time, decisionTime: $decisionTime, modificationId: $modificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ModificationModel &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.amountString, amountString) ||
                const DeepCollectionEquality()
                    .equals(other.amountString, amountString)) &&
            (identical(other.buyerId, buyerId) ||
                const DeepCollectionEquality()
                    .equals(other.buyerId, buyerId)) &&
            (identical(other.sellerId, sellerId) ||
                const DeepCollectionEquality()
                    .equals(other.sellerId, sellerId)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.requestTitle, requestTitle) ||
                const DeepCollectionEquality()
                    .equals(other.requestTitle, requestTitle)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.decisionTime, decisionTime) ||
                const DeepCollectionEquality()
                    .equals(other.decisionTime, decisionTime)) &&
            (identical(other.modificationId, modificationId) ||
                const DeepCollectionEquality()
                    .equals(other.modificationId, modificationId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(amountString) ^
      const DeepCollectionEquality().hash(buyerId) ^
      const DeepCollectionEquality().hash(sellerId) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(requestTitle) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(decisionTime) ^
      const DeepCollectionEquality().hash(modificationId);

  @JsonKey(ignore: true)
  @override
  _$ModificationModelCopyWith<_ModificationModel> get copyWith =>
      __$ModificationModelCopyWithImpl<_ModificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ModificationModelToJson(this);
  }
}

abstract class _ModificationModel implements ModificationModel {
  const factory _ModificationModel(
      {required String reason,
      num? amount,
      String? amountString,
      required String buyerId,
      required String sellerId,
      @JsonKey(name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdDate,
      required String requestTitle,
      @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? time,
      @JsonKey(name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? decisionTime,
      String? modificationId}) = _$_ModificationModel;

  factory _ModificationModel.fromJson(Map<String, dynamic> json) =
      _$_ModificationModel.fromJson;

  @override
  String get reason => throw _privateConstructorUsedError;
  @override
  num? get amount => throw _privateConstructorUsedError;
  @override
  String? get amountString => throw _privateConstructorUsedError;
  @override
  String get buyerId => throw _privateConstructorUsedError;
  @override
  String get sellerId => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "createdDate", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @override
  String get requestTitle => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "time", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "decisionTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get decisionTime => throw _privateConstructorUsedError;
  @override
  String? get modificationId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ModificationModelCopyWith<_ModificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
