// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_description_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileDescEntryModel _$ProfileDescEntryModelFromJson(
    Map<String, dynamic> json) {
  return _ProfileDescEntryModel.fromJson(json);
}

/// @nodoc
class _$ProfileDescEntryModelTearOff {
  const _$ProfileDescEntryModelTearOff();

  _ProfileDescEntryModel call(
      {required String? title,
      required String? description,
      bool isOrganization = false}) {
    return _ProfileDescEntryModel(
      title: title,
      description: description,
      isOrganization: isOrganization,
    );
  }

  ProfileDescEntryModel fromJson(Map<String, Object> json) {
    return ProfileDescEntryModel.fromJson(json);
  }
}

/// @nodoc
const $ProfileDescEntryModel = _$ProfileDescEntryModelTearOff();

/// @nodoc
mixin _$ProfileDescEntryModel {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isOrganization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDescEntryModelCopyWith<ProfileDescEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDescEntryModelCopyWith<$Res> {
  factory $ProfileDescEntryModelCopyWith(ProfileDescEntryModel value,
          $Res Function(ProfileDescEntryModel) then) =
      _$ProfileDescEntryModelCopyWithImpl<$Res>;
  $Res call({String? title, String? description, bool isOrganization});
}

/// @nodoc
class _$ProfileDescEntryModelCopyWithImpl<$Res>
    implements $ProfileDescEntryModelCopyWith<$Res> {
  _$ProfileDescEntryModelCopyWithImpl(this._value, this._then);

  final ProfileDescEntryModel _value;
  // ignore: unused_field
  final $Res Function(ProfileDescEntryModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isOrganization = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isOrganization: isOrganization == freezed
          ? _value.isOrganization
          : isOrganization // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProfileDescEntryModelCopyWith<$Res>
    implements $ProfileDescEntryModelCopyWith<$Res> {
  factory _$ProfileDescEntryModelCopyWith(_ProfileDescEntryModel value,
          $Res Function(_ProfileDescEntryModel) then) =
      __$ProfileDescEntryModelCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? description, bool isOrganization});
}

/// @nodoc
class __$ProfileDescEntryModelCopyWithImpl<$Res>
    extends _$ProfileDescEntryModelCopyWithImpl<$Res>
    implements _$ProfileDescEntryModelCopyWith<$Res> {
  __$ProfileDescEntryModelCopyWithImpl(_ProfileDescEntryModel _value,
      $Res Function(_ProfileDescEntryModel) _then)
      : super(_value, (v) => _then(v as _ProfileDescEntryModel));

  @override
  _ProfileDescEntryModel get _value => super._value as _ProfileDescEntryModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isOrganization = freezed,
  }) {
    return _then(_ProfileDescEntryModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isOrganization: isOrganization == freezed
          ? _value.isOrganization
          : isOrganization // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileDescEntryModel implements _ProfileDescEntryModel {
  const _$_ProfileDescEntryModel(
      {required this.title,
      required this.description,
      this.isOrganization = false});

  factory _$_ProfileDescEntryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ProfileDescEntryModelFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @JsonKey(defaultValue: false)
  @override
  final bool isOrganization;

  @override
  String toString() {
    return 'ProfileDescEntryModel(title: $title, description: $description, isOrganization: $isOrganization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileDescEntryModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.isOrganization, isOrganization) ||
                const DeepCollectionEquality()
                    .equals(other.isOrganization, isOrganization)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(isOrganization);

  @JsonKey(ignore: true)
  @override
  _$ProfileDescEntryModelCopyWith<_ProfileDescEntryModel> get copyWith =>
      __$ProfileDescEntryModelCopyWithImpl<_ProfileDescEntryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProfileDescEntryModelToJson(this);
  }
}

abstract class _ProfileDescEntryModel implements ProfileDescEntryModel {
  const factory _ProfileDescEntryModel(
      {required String? title,
      required String? description,
      bool isOrganization}) = _$_ProfileDescEntryModel;

  factory _ProfileDescEntryModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileDescEntryModel.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  bool get isOrganization => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProfileDescEntryModelCopyWith<_ProfileDescEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
