// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicUser _$PublicUserFromJson(Map<String, dynamic> json) {
  return _PublicUser.fromJson(json);
}

/// @nodoc
mixin _$PublicUser {
  int get followerCount => throw _privateConstructorUsedError;
  String get nameFull => throw _privateConstructorUsedError;
  DateTime get inputDate => throw _privateConstructorUsedError;
  String get nameFirst => throw _privateConstructorUsedError;
  String get nameLast => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get post => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicUserCopyWith<PublicUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicUserCopyWith<$Res> {
  factory $PublicUserCopyWith(
          PublicUser value, $Res Function(PublicUser) then) =
      _$PublicUserCopyWithImpl<$Res, PublicUser>;
  @useResult
  $Res call(
      {int followerCount,
      String nameFull,
      DateTime inputDate,
      String nameFirst,
      String nameLast,
      String phone,
      String post});
}

/// @nodoc
class _$PublicUserCopyWithImpl<$Res, $Val extends PublicUser>
    implements $PublicUserCopyWith<$Res> {
  _$PublicUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followerCount = null,
    Object? nameFull = null,
    Object? inputDate = null,
    Object? nameFirst = null,
    Object? nameLast = null,
    Object? phone = null,
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      nameFull: null == nameFull
          ? _value.nameFull
          : nameFull // ignore: cast_nullable_to_non_nullable
              as String,
      inputDate: null == inputDate
          ? _value.inputDate
          : inputDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nameFirst: null == nameFirst
          ? _value.nameFirst
          : nameFirst // ignore: cast_nullable_to_non_nullable
              as String,
      nameLast: null == nameLast
          ? _value.nameLast
          : nameLast // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicUserImplCopyWith<$Res>
    implements $PublicUserCopyWith<$Res> {
  factory _$$PublicUserImplCopyWith(
          _$PublicUserImpl value, $Res Function(_$PublicUserImpl) then) =
      __$$PublicUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int followerCount,
      String nameFull,
      DateTime inputDate,
      String nameFirst,
      String nameLast,
      String phone,
      String post});
}

/// @nodoc
class __$$PublicUserImplCopyWithImpl<$Res>
    extends _$PublicUserCopyWithImpl<$Res, _$PublicUserImpl>
    implements _$$PublicUserImplCopyWith<$Res> {
  __$$PublicUserImplCopyWithImpl(
      _$PublicUserImpl _value, $Res Function(_$PublicUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followerCount = null,
    Object? nameFull = null,
    Object? inputDate = null,
    Object? nameFirst = null,
    Object? nameLast = null,
    Object? phone = null,
    Object? post = null,
  }) {
    return _then(_$PublicUserImpl(
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      nameFull: null == nameFull
          ? _value.nameFull
          : nameFull // ignore: cast_nullable_to_non_nullable
              as String,
      inputDate: null == inputDate
          ? _value.inputDate
          : inputDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nameFirst: null == nameFirst
          ? _value.nameFirst
          : nameFirst // ignore: cast_nullable_to_non_nullable
              as String,
      nameLast: null == nameLast
          ? _value.nameLast
          : nameLast // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicUserImpl extends _PublicUser with DiagnosticableTreeMixin {
  const _$PublicUserImpl(
      {this.followerCount = 0,
      required this.nameFull,
      required this.inputDate,
      required this.nameFirst,
      required this.nameLast,
      required this.phone,
      required this.post})
      : super._();

  factory _$PublicUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicUserImplFromJson(json);

  @override
  @JsonKey()
  final int followerCount;
  @override
  final String nameFull;
  @override
  final DateTime inputDate;
  @override
  final String nameFirst;
  @override
  final String nameLast;
  @override
  final String phone;
  @override
  final String post;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicUser(followerCount: $followerCount, nameFull: $nameFull, inputDate: $inputDate, nameFirst: $nameFirst, nameLast: $nameLast, phone: $phone, post: $post)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicUser'))
      ..add(DiagnosticsProperty('followerCount', followerCount))
      ..add(DiagnosticsProperty('nameFull', nameFull))
      ..add(DiagnosticsProperty('inputDate', inputDate))
      ..add(DiagnosticsProperty('nameFirst', nameFirst))
      ..add(DiagnosticsProperty('nameLast', nameLast))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('post', post));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicUserImpl &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.nameFull, nameFull) ||
                other.nameFull == nameFull) &&
            (identical(other.inputDate, inputDate) ||
                other.inputDate == inputDate) &&
            (identical(other.nameFirst, nameFirst) ||
                other.nameFirst == nameFirst) &&
            (identical(other.nameLast, nameLast) ||
                other.nameLast == nameLast) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.post, post) || other.post == post));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, followerCount, nameFull,
      inputDate, nameFirst, nameLast, phone, post);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicUserImplCopyWith<_$PublicUserImpl> get copyWith =>
      __$$PublicUserImplCopyWithImpl<_$PublicUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicUserImplToJson(
      this,
    );
  }
}

abstract class _PublicUser extends PublicUser {
  const factory _PublicUser(
      {final int followerCount,
      required final String nameFull,
      required final DateTime inputDate,
      required final String nameFirst,
      required final String nameLast,
      required final String phone,
      required final String post}) = _$PublicUserImpl;
  const _PublicUser._() : super._();

  factory _PublicUser.fromJson(Map<String, dynamic> json) =
      _$PublicUserImpl.fromJson;

  @override
  int get followerCount;
  @override
  String get nameFull;
  @override
  DateTime get inputDate;
  @override
  String get nameFirst;
  @override
  String get nameLast;
  @override
  String get phone;
  @override
  String get post;
  @override
  @JsonKey(ignore: true)
  _$$PublicUserImplCopyWith<_$PublicUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
