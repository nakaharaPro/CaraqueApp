// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicUserImpl _$$PublicUserImplFromJson(Map<String, dynamic> json) =>
    _$PublicUserImpl(
      followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      inputDate: DateTime.parse(json['inputDate'] as String),
      first: json['first'] as String,
      last: json['last'] as String,
      phone: json['phone'] as String,
      post: json['post'] as String,
    );

Map<String, dynamic> _$$PublicUserImplToJson(_$PublicUserImpl instance) =>
    <String, dynamic>{
      'followerCount': instance.followerCount,
      'name': instance.name,
      'inputDate': instance.inputDate.toIso8601String(),
      'first': instance.first,
      'last': instance.last,
      'phone': instance.phone,
      'post': instance.post,
    };
