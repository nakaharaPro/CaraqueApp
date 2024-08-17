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
  DateTime get inputDate => throw _privateConstructorUsedError;
  String get nameFull => throw _privateConstructorUsedError;
  String get nameFirst => throw _privateConstructorUsedError;
  String get nameLast => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get post => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get pageList => throw _privateConstructorUsedError;

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
      {DateTime inputDate,
      String nameFull,
      String nameFirst,
      String nameLast,
      String phone,
      String post,
      List<Map<String, dynamic>> pageList});
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
    Object? inputDate = null,
    Object? nameFull = null,
    Object? nameFirst = null,
    Object? nameLast = null,
    Object? phone = null,
    Object? post = null,
    Object? pageList = null,
  }) {
    return _then(_value.copyWith(
      inputDate: null == inputDate
          ? _value.inputDate
          : inputDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nameFull: null == nameFull
          ? _value.nameFull
          : nameFull // ignore: cast_nullable_to_non_nullable
              as String,
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
      pageList: null == pageList
          ? _value.pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
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
      {DateTime inputDate,
      String nameFull,
      String nameFirst,
      String nameLast,
      String phone,
      String post,
      List<Map<String, dynamic>> pageList});
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
    Object? inputDate = null,
    Object? nameFull = null,
    Object? nameFirst = null,
    Object? nameLast = null,
    Object? phone = null,
    Object? post = null,
    Object? pageList = null,
  }) {
    return _then(_$PublicUserImpl(
      inputDate: null == inputDate
          ? _value.inputDate
          : inputDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nameFull: null == nameFull
          ? _value.nameFull
          : nameFull // ignore: cast_nullable_to_non_nullable
              as String,
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
      pageList: null == pageList
          ? _value._pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicUserImpl extends _PublicUser with DiagnosticableTreeMixin {
  const _$PublicUserImpl(
      {required this.inputDate,
      required this.nameFull,
      required this.nameFirst,
      required this.nameLast,
      required this.phone,
      required this.post,
      final List<Map<String, dynamic>> pageList = const [{}]})
      : _pageList = pageList,
        super._();

  factory _$PublicUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicUserImplFromJson(json);

  @override
  final DateTime inputDate;
  @override
  final String nameFull;
  @override
  final String nameFirst;
  @override
  final String nameLast;
  @override
  final String phone;
  @override
  final String post;
  final List<Map<String, dynamic>> _pageList;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get pageList {
    if (_pageList is EqualUnmodifiableListView) return _pageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicUser(inputDate: $inputDate, nameFull: $nameFull, nameFirst: $nameFirst, nameLast: $nameLast, phone: $phone, post: $post, pageList: $pageList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicUser'))
      ..add(DiagnosticsProperty('inputDate', inputDate))
      ..add(DiagnosticsProperty('nameFull', nameFull))
      ..add(DiagnosticsProperty('nameFirst', nameFirst))
      ..add(DiagnosticsProperty('nameLast', nameLast))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('post', post))
      ..add(DiagnosticsProperty('pageList', pageList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicUserImpl &&
            (identical(other.inputDate, inputDate) ||
                other.inputDate == inputDate) &&
            (identical(other.nameFull, nameFull) ||
                other.nameFull == nameFull) &&
            (identical(other.nameFirst, nameFirst) ||
                other.nameFirst == nameFirst) &&
            (identical(other.nameLast, nameLast) ||
                other.nameLast == nameLast) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.post, post) || other.post == post) &&
            const DeepCollectionEquality().equals(other._pageList, _pageList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inputDate, nameFull, nameFirst,
      nameLast, phone, post, const DeepCollectionEquality().hash(_pageList));

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
      {required final DateTime inputDate,
      required final String nameFull,
      required final String nameFirst,
      required final String nameLast,
      required final String phone,
      required final String post,
      final List<Map<String, dynamic>> pageList}) = _$PublicUserImpl;
  const _PublicUser._() : super._();

  factory _PublicUser.fromJson(Map<String, dynamic> json) =
      _$PublicUserImpl.fromJson;

  @override
  DateTime get inputDate;
  @override
  String get nameFull;
  @override
  String get nameFirst;
  @override
  String get nameLast;
  @override
  String get phone;
  @override
  String get post;
  @override
  List<Map<String, dynamic>> get pageList;
  @override
  @JsonKey(ignore: true)
  _$$PublicUserImplCopyWith<_$PublicUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
