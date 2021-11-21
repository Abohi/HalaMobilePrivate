// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recently_visited_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentlyVisitedModel _$RecentlyVisitedModelFromJson(Map<String, dynamic> json) {
  return _RecentlyVisitedModel.fromJson(json);
}

/// @nodoc
class _$RecentlyVisitedModelTearOff {
  const _$RecentlyVisitedModelTearOff();

  _RecentlyVisitedModel call({required String sellerId}) {
    return _RecentlyVisitedModel(
      sellerId: sellerId,
    );
  }

  RecentlyVisitedModel fromJson(Map<String, Object> json) {
    return RecentlyVisitedModel.fromJson(json);
  }
}

/// @nodoc
const $RecentlyVisitedModel = _$RecentlyVisitedModelTearOff();

/// @nodoc
mixin _$RecentlyVisitedModel {
  String get sellerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentlyVisitedModelCopyWith<RecentlyVisitedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyVisitedModelCopyWith<$Res> {
  factory $RecentlyVisitedModelCopyWith(RecentlyVisitedModel value,
          $Res Function(RecentlyVisitedModel) then) =
      _$RecentlyVisitedModelCopyWithImpl<$Res>;
  $Res call({String sellerId});
}

/// @nodoc
class _$RecentlyVisitedModelCopyWithImpl<$Res>
    implements $RecentlyVisitedModelCopyWith<$Res> {
  _$RecentlyVisitedModelCopyWithImpl(this._value, this._then);

  final RecentlyVisitedModel _value;
  // ignore: unused_field
  final $Res Function(RecentlyVisitedModel) _then;

  @override
  $Res call({
    Object? sellerId = freezed,
  }) {
    return _then(_value.copyWith(
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RecentlyVisitedModelCopyWith<$Res>
    implements $RecentlyVisitedModelCopyWith<$Res> {
  factory _$RecentlyVisitedModelCopyWith(_RecentlyVisitedModel value,
          $Res Function(_RecentlyVisitedModel) then) =
      __$RecentlyVisitedModelCopyWithImpl<$Res>;
  @override
  $Res call({String sellerId});
}

/// @nodoc
class __$RecentlyVisitedModelCopyWithImpl<$Res>
    extends _$RecentlyVisitedModelCopyWithImpl<$Res>
    implements _$RecentlyVisitedModelCopyWith<$Res> {
  __$RecentlyVisitedModelCopyWithImpl(
      _RecentlyVisitedModel _value, $Res Function(_RecentlyVisitedModel) _then)
      : super(_value, (v) => _then(v as _RecentlyVisitedModel));

  @override
  _RecentlyVisitedModel get _value => super._value as _RecentlyVisitedModel;

  @override
  $Res call({
    Object? sellerId = freezed,
  }) {
    return _then(_RecentlyVisitedModel(
      sellerId: sellerId == freezed
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentlyVisitedModel implements _RecentlyVisitedModel {
  const _$_RecentlyVisitedModel({required this.sellerId});

  factory _$_RecentlyVisitedModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RecentlyVisitedModelFromJson(json);

  @override
  final String sellerId;

  @override
  String toString() {
    return 'RecentlyVisitedModel(sellerId: $sellerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecentlyVisitedModel &&
            (identical(other.sellerId, sellerId) ||
                const DeepCollectionEquality()
                    .equals(other.sellerId, sellerId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sellerId);

  @JsonKey(ignore: true)
  @override
  _$RecentlyVisitedModelCopyWith<_RecentlyVisitedModel> get copyWith =>
      __$RecentlyVisitedModelCopyWithImpl<_RecentlyVisitedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RecentlyVisitedModelToJson(this);
  }
}

abstract class _RecentlyVisitedModel implements RecentlyVisitedModel {
  const factory _RecentlyVisitedModel({required String sellerId}) =
      _$_RecentlyVisitedModel;

  factory _RecentlyVisitedModel.fromJson(Map<String, dynamic> json) =
      _$_RecentlyVisitedModel.fromJson;

  @override
  String get sellerId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecentlyVisitedModelCopyWith<_RecentlyVisitedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
