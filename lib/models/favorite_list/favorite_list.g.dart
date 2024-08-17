// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteListImpl _$$FavoriteListImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteListImpl(
      pageList: (json['pageList'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [{}],
    );

Map<String, dynamic> _$$FavoriteListImplToJson(_$FavoriteListImpl instance) =>
    <String, dynamic>{
      'pageList': instance.pageList,
    };
