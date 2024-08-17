// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteList _$FavoriteListFromJson(Map<String, dynamic> json) {
  return _FavoriteList.fromJson(json);
}

/// @nodoc
mixin _$FavoriteList {
  List<Map<String, dynamic>> get pageList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteListCopyWith<FavoriteList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteListCopyWith<$Res> {
  factory $FavoriteListCopyWith(
          FavoriteList value, $Res Function(FavoriteList) then) =
      _$FavoriteListCopyWithImpl<$Res, FavoriteList>;
  @useResult
  $Res call({List<Map<String, dynamic>> pageList});
}

/// @nodoc
class _$FavoriteListCopyWithImpl<$Res, $Val extends FavoriteList>
    implements $FavoriteListCopyWith<$Res> {
  _$FavoriteListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageList = null,
  }) {
    return _then(_value.copyWith(
      pageList: null == pageList
          ? _value.pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteListImplCopyWith<$Res>
    implements $FavoriteListCopyWith<$Res> {
  factory _$$FavoriteListImplCopyWith(
          _$FavoriteListImpl value, $Res Function(_$FavoriteListImpl) then) =
      __$$FavoriteListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> pageList});
}

/// @nodoc
class __$$FavoriteListImplCopyWithImpl<$Res>
    extends _$FavoriteListCopyWithImpl<$Res, _$FavoriteListImpl>
    implements _$$FavoriteListImplCopyWith<$Res> {
  __$$FavoriteListImplCopyWithImpl(
      _$FavoriteListImpl _value, $Res Function(_$FavoriteListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageList = null,
  }) {
    return _then(_$FavoriteListImpl(
      pageList: null == pageList
          ? _value._pageList
          : pageList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteListImpl extends _FavoriteList with DiagnosticableTreeMixin {
  const _$FavoriteListImpl(
      {final List<Map<String, dynamic>> pageList = const [{}]})
      : _pageList = pageList,
        super._();

  factory _$FavoriteListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteListImplFromJson(json);

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
    return 'FavoriteList(pageList: $pageList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FavoriteList'))
      ..add(DiagnosticsProperty('pageList', pageList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteListImpl &&
            const DeepCollectionEquality().equals(other._pageList, _pageList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pageList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteListImplCopyWith<_$FavoriteListImpl> get copyWith =>
      __$$FavoriteListImplCopyWithImpl<_$FavoriteListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteListImplToJson(
      this,
    );
  }
}

abstract class _FavoriteList extends FavoriteList {
  const factory _FavoriteList({final List<Map<String, dynamic>> pageList}) =
      _$FavoriteListImpl;
  const _FavoriteList._() : super._();

  factory _FavoriteList.fromJson(Map<String, dynamic> json) =
      _$FavoriteListImpl.fromJson;

  @override
  List<Map<String, dynamic>> get pageList;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteListImplCopyWith<_$FavoriteListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
