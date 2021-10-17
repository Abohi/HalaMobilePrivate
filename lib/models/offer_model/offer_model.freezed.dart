// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
class _$OfferModelTearOff {
  const _$OfferModelTearOff();

  _OfferModel call(
      {required String description,
      required String amount,
      required String selectedDuration,
      required String selectedDurationInWords,
      String? sellerId,
      String? requestId,
      required DateTime dateOfDelivery}) {
    return _OfferModel(
      description: description,
      amount: amount,
      selectedDuration: selectedDuration,
      selectedDurationInWords: selectedDurationInWords,
      sellerId: sellerId,
      requestId: requestId,
      dateOfDelivery: dateOfDelivery,
    );
  }

  OfferModel fromJson(Map<String, Object> json) {
    return OfferModel.fromJson(json);
  }
}

/// @nodoc
const $OfferModel = _$OfferModelTearOff();

/// @nodoc
mixin _$OfferModel {
  String get description => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get selectedDuration => throw _privateConstructorUsedError;
  String get selectedDurationInWords => throw _privateConstructorUsedError;
  String? get sellerId => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  DateTime get dateOfDelivery => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res>;
  $Res call(
      {String description,
      String amount,
      String selectedDuration,
      String selectedDurationInWords,
      String? sellerId,
      String? requestId,
      DateTime dateOfDelivery});
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res> implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  final OfferModel _value;
  // ignore: unused_field
  final $Res Function(OfferModel) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? amount = freezed,
    Object? selectedDuration = freezed,
    Object? selectedDurationInWords = freezed,
    Object? sellerId = freezed,
    Object? requestId = freezed,
    Object? dateOfDelivery = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDuration: selectedDuration == freezed
          ? _value.selectedDuration
          : selectedDuration // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDurationInWords: selectedDurationInWords == freezed
          ? _value.selectedDurationInWords
          : selectedDurationInWords // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfDelivery: dateOfDelivery == freezed
          ? _value.dateOfDelivery
          : dateOfDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$OfferModelCopyWith<$Res> implements $OfferModelCopyWith<$Res> {
  factory _$OfferModelCopyWith(
          _OfferModel value, $Res Function(_OfferModel) then) =
      __$OfferModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      String amount,
      String selectedDuration,
      String selectedDurationInWords,
      String? sellerId,
      String? requestId,
      DateTime dateOfDelivery});
}

/// @nodoc
class __$OfferModelCopyWithImpl<$Res> extends _$OfferModelCopyWithImpl<$Res>
    implements _$OfferModelCopyWith<$Res> {
  __$OfferModelCopyWithImpl(
      _OfferModel _value, $Res Function(_OfferModel) _then)
      : super(_value, (v) => _then(v as _OfferModel));

  @override
  _OfferModel get _value => super._value as _OfferModel;

  @override
  $Res call({
    Object? description = freezed,
    Object? amount = freezed,
    Object? selectedDuration = freezed,
    Object? selectedDurationInWords = freezed,
    Object? sellerId = freezed,
    Object? requestId = freezed,
    Object? dateOfDelivery = freezed,
  }) {
    return _then(_OfferModel(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDuration: selectedDuration == freezed
          ? _value.selectedDuration
          : selectedDuration // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDurationInWords: selectedDurationInWords == freezed
          ? _value.selectedDurationInWords
          : selectedDurationInWords // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: requestId == freezed
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfDelivery: dateOfDelivery == freezed
          ? _value.dateOfDelivery
          : dateOfDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfferModel implements _OfferModel {
  const _$_OfferModel(
      {required this.description,
      required this.amount,
      required this.selectedDuration,
      required this.selectedDurationInWords,
      this.sellerId,
      this.requestId,
      required this.dateOfDelivery});

  factory _$_OfferModel.fromJson(Map<String, dynamic> json) =>
      _$_$_OfferModelFromJson(json);

  @override
  final String description;
  @override
  final String amount;
  @override
  final String selectedDuration;
  @override
  final String selectedDurationInWords;
  @override
  final String? sellerId;
  @override
  final String? requestId;
  @override
  final DateTime dateOfDelivery;

  @override
  String toString() {
    return 'OfferModel(description: $description, amount: $amount, selectedDuration: $selectedDuration, selectedDurationInWords: $selectedDurationInWords, sellerId: $sellerId, requestId: $requestId, dateOfDelivery: $dateOfDelivery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OfferModel &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.selectedDuration, selectedDuration) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDuration, selectedDuration)) &&
            (identical(
                    other.selectedDurationInWords, selectedDurationInWords) ||
                const DeepCollectionEquality().equals(
                    other.selectedDurationInWords, selectedDurationInWords)) &&
            (identical(other.sellerId, sellerId) ||
                const DeepCollectionEquality()
                    .equals(other.sellerId, sellerId)) &&
            (identical(other.requestId, requestId) ||
                const DeepCollectionEquality()
                    .equals(other.requestId, requestId)) &&
            (identical(other.dateOfDelivery, dateOfDelivery) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfDelivery, dateOfDelivery)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(selectedDuration) ^
      const DeepCollectionEquality().hash(selectedDurationInWords) ^
      const DeepCollectionEquality().hash(sellerId) ^
      const DeepCollectionEquality().hash(requestId) ^
      const DeepCollectionEquality().hash(dateOfDelivery);

  @JsonKey(ignore: true)
  @override
  _$OfferModelCopyWith<_OfferModel> get copyWith =>
      __$OfferModelCopyWithImpl<_OfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OfferModelToJson(this);
  }
}

abstract class _OfferModel implements OfferModel {
  const factory _OfferModel(
      {required String description,
      required String amount,
      required String selectedDuration,
      required String selectedDurationInWords,
      String? sellerId,
      String? requestId,
      required DateTime dateOfDelivery}) = _$_OfferModel;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$_OfferModel.fromJson;

  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get amount => throw _privateConstructorUsedError;
  @override
  String get selectedDuration => throw _privateConstructorUsedError;
  @override
  String get selectedDurationInWords => throw _privateConstructorUsedError;
  @override
  String? get sellerId => throw _privateConstructorUsedError;
  @override
  String? get requestId => throw _privateConstructorUsedError;
  @override
  DateTime get dateOfDelivery => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OfferModelCopyWith<_OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}
