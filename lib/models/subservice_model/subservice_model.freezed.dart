// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subservice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubServiceModel _$SubServiceModelFromJson(Map<String, dynamic> json) {
  return _SubServiceModel.fromJson(json);
}

/// @nodoc
class _$SubServiceModelTearOff {
  const _$SubServiceModelTearOff();

  _SubServiceModel call(
      {required bool isActiveSubservice,
      required String userid,
      String? subserviceId}) {
    return _SubServiceModel(
      isActiveSubservice: isActiveSubservice,
      userid: userid,
      subserviceId: subserviceId,
    );
  }

  SubServiceModel fromJson(Map<String, Object> json) {
    return SubServiceModel.fromJson(json);
  }
}

/// @nodoc
const $SubServiceModel = _$SubServiceModelTearOff();

/// @nodoc
mixin _$SubServiceModel {
  bool get isActiveSubservice => throw _privateConstructorUsedError;
  String get userid => throw _privateConstructorUsedError;
  String? get subserviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubServiceModelCopyWith<SubServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubServiceModelCopyWith<$Res> {
  factory $SubServiceModelCopyWith(
          SubServiceModel value, $Res Function(SubServiceModel) then) =
      _$SubServiceModelCopyWithImpl<$Res>;
  $Res call({bool isActiveSubservice, String userid, String? subserviceId});
}

/// @nodoc
class _$SubServiceModelCopyWithImpl<$Res>
    implements $SubServiceModelCopyWith<$Res> {
  _$SubServiceModelCopyWithImpl(this._value, this._then);

  final SubServiceModel _value;
  // ignore: unused_field
  final $Res Function(SubServiceModel) _then;

  @override
  $Res call({
    Object? isActiveSubservice = freezed,
    Object? userid = freezed,
    Object? subserviceId = freezed,
  }) {
    return _then(_value.copyWith(
      isActiveSubservice: isActiveSubservice == freezed
          ? _value.isActiveSubservice
          : isActiveSubservice // ignore: cast_nullable_to_non_nullable
              as bool,
      userid: userid == freezed
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
      subserviceId: subserviceId == freezed
          ? _value.subserviceId
          : subserviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SubServiceModelCopyWith<$Res>
    implements $SubServiceModelCopyWith<$Res> {
  factory _$SubServiceModelCopyWith(
          _SubServiceModel value, $Res Function(_SubServiceModel) then) =
      __$SubServiceModelCopyWithImpl<$Res>;
  @override
  $Res call({bool isActiveSubservice, String userid, String? subserviceId});
}

/// @nodoc
class __$SubServiceModelCopyWithImpl<$Res>
    extends _$SubServiceModelCopyWithImpl<$Res>
    implements _$SubServiceModelCopyWith<$Res> {
  __$SubServiceModelCopyWithImpl(
      _SubServiceModel _value, $Res Function(_SubServiceModel) _then)
      : super(_value, (v) => _then(v as _SubServiceModel));

  @override
  _SubServiceModel get _value => super._value as _SubServiceModel;

  @override
  $Res call({
    Object? isActiveSubservice = freezed,
    Object? userid = freezed,
    Object? subserviceId = freezed,
  }) {
    return _then(_SubServiceModel(
      isActiveSubservice: isActiveSubservice == freezed
          ? _value.isActiveSubservice
          : isActiveSubservice // ignore: cast_nullable_to_non_nullable
              as bool,
      userid: userid == freezed
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
      subserviceId: subserviceId == freezed
          ? _value.subserviceId
          : subserviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubServiceModel implements _SubServiceModel {
  const _$_SubServiceModel(
      {required this.isActiveSubservice,
      required this.userid,
      this.subserviceId});

  factory _$_SubServiceModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SubServiceModelFromJson(json);

  @override
  final bool isActiveSubservice;
  @override
  final String userid;
  @override
  final String? subserviceId;

  @override
  String toString() {
    return 'SubServiceModel(isActiveSubservice: $isActiveSubservice, userid: $userid, subserviceId: $subserviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubServiceModel &&
            (identical(other.isActiveSubservice, isActiveSubservice) ||
                const DeepCollectionEquality()
                    .equals(other.isActiveSubservice, isActiveSubservice)) &&
            (identical(other.userid, userid) ||
                const DeepCollectionEquality().equals(other.userid, userid)) &&
            (identical(other.subserviceId, subserviceId) ||
                const DeepCollectionEquality()
                    .equals(other.subserviceId, subserviceId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isActiveSubservice) ^
      const DeepCollectionEquality().hash(userid) ^
      const DeepCollectionEquality().hash(subserviceId);

  @JsonKey(ignore: true)
  @override
  _$SubServiceModelCopyWith<_SubServiceModel> get copyWith =>
      __$SubServiceModelCopyWithImpl<_SubServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubServiceModelToJson(this);
  }
}

abstract class _SubServiceModel implements SubServiceModel {
  const factory _SubServiceModel(
      {required bool isActiveSubservice,
      required String userid,
      String? subserviceId}) = _$_SubServiceModel;

  factory _SubServiceModel.fromJson(Map<String, dynamic> json) =
      _$_SubServiceModel.fromJson;

  @override
  bool get isActiveSubservice => throw _privateConstructorUsedError;
  @override
  String get userid => throw _privateConstructorUsedError;
  @override
  String? get subserviceId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubServiceModelCopyWith<_SubServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
