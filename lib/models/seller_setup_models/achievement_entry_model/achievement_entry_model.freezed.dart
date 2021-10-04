// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'achievement_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AchievementEntryModel _$AchievementEntryModelFromJson(
    Map<String, dynamic> json) {
  return _AchievementEntryModel.fromJson(json);
}

/// @nodoc
class _$AchievementEntryModelTearOff {
  const _$AchievementEntryModelTearOff();

  _AchievementEntryModel call(
      {required String? achievementName,
      required String? achievementDescription,
      String? documentId}) {
    return _AchievementEntryModel(
      achievementName: achievementName,
      achievementDescription: achievementDescription,
      documentId: documentId,
    );
  }

  AchievementEntryModel fromJson(Map<String, Object> json) {
    return AchievementEntryModel.fromJson(json);
  }
}

/// @nodoc
const $AchievementEntryModel = _$AchievementEntryModelTearOff();

/// @nodoc
mixin _$AchievementEntryModel {
  String? get achievementName => throw _privateConstructorUsedError;
  String? get achievementDescription => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AchievementEntryModelCopyWith<AchievementEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementEntryModelCopyWith<$Res> {
  factory $AchievementEntryModelCopyWith(AchievementEntryModel value,
          $Res Function(AchievementEntryModel) then) =
      _$AchievementEntryModelCopyWithImpl<$Res>;
  $Res call(
      {String? achievementName,
      String? achievementDescription,
      String? documentId});
}

/// @nodoc
class _$AchievementEntryModelCopyWithImpl<$Res>
    implements $AchievementEntryModelCopyWith<$Res> {
  _$AchievementEntryModelCopyWithImpl(this._value, this._then);

  final AchievementEntryModel _value;
  // ignore: unused_field
  final $Res Function(AchievementEntryModel) _then;

  @override
  $Res call({
    Object? achievementName = freezed,
    Object? achievementDescription = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_value.copyWith(
      achievementName: achievementName == freezed
          ? _value.achievementName
          : achievementName // ignore: cast_nullable_to_non_nullable
              as String?,
      achievementDescription: achievementDescription == freezed
          ? _value.achievementDescription
          : achievementDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AchievementEntryModelCopyWith<$Res>
    implements $AchievementEntryModelCopyWith<$Res> {
  factory _$AchievementEntryModelCopyWith(_AchievementEntryModel value,
          $Res Function(_AchievementEntryModel) then) =
      __$AchievementEntryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? achievementName,
      String? achievementDescription,
      String? documentId});
}

/// @nodoc
class __$AchievementEntryModelCopyWithImpl<$Res>
    extends _$AchievementEntryModelCopyWithImpl<$Res>
    implements _$AchievementEntryModelCopyWith<$Res> {
  __$AchievementEntryModelCopyWithImpl(_AchievementEntryModel _value,
      $Res Function(_AchievementEntryModel) _then)
      : super(_value, (v) => _then(v as _AchievementEntryModel));

  @override
  _AchievementEntryModel get _value => super._value as _AchievementEntryModel;

  @override
  $Res call({
    Object? achievementName = freezed,
    Object? achievementDescription = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_AchievementEntryModel(
      achievementName: achievementName == freezed
          ? _value.achievementName
          : achievementName // ignore: cast_nullable_to_non_nullable
              as String?,
      achievementDescription: achievementDescription == freezed
          ? _value.achievementDescription
          : achievementDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AchievementEntryModel implements _AchievementEntryModel {
  const _$_AchievementEntryModel(
      {required this.achievementName,
      required this.achievementDescription,
      this.documentId});

  factory _$_AchievementEntryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AchievementEntryModelFromJson(json);

  @override
  final String? achievementName;
  @override
  final String? achievementDescription;
  @override
  final String? documentId;

  @override
  String toString() {
    return 'AchievementEntryModel(achievementName: $achievementName, achievementDescription: $achievementDescription, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AchievementEntryModel &&
            (identical(other.achievementName, achievementName) ||
                const DeepCollectionEquality()
                    .equals(other.achievementName, achievementName)) &&
            (identical(other.achievementDescription, achievementDescription) ||
                const DeepCollectionEquality().equals(
                    other.achievementDescription, achievementDescription)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(achievementName) ^
      const DeepCollectionEquality().hash(achievementDescription) ^
      const DeepCollectionEquality().hash(documentId);

  @JsonKey(ignore: true)
  @override
  _$AchievementEntryModelCopyWith<_AchievementEntryModel> get copyWith =>
      __$AchievementEntryModelCopyWithImpl<_AchievementEntryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AchievementEntryModelToJson(this);
  }
}

abstract class _AchievementEntryModel implements AchievementEntryModel {
  const factory _AchievementEntryModel(
      {required String? achievementName,
      required String? achievementDescription,
      String? documentId}) = _$_AchievementEntryModel;

  factory _AchievementEntryModel.fromJson(Map<String, dynamic> json) =
      _$_AchievementEntryModel.fromJson;

  @override
  String? get achievementName => throw _privateConstructorUsedError;
  @override
  String? get achievementDescription => throw _privateConstructorUsedError;
  @override
  String? get documentId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AchievementEntryModelCopyWith<_AchievementEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
