// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicUserImpl _$$PublicUserImplFromJson(Map<String, dynamic> json) =>
    _$PublicUserImpl(
      followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
      nameFull: json['nameFull'] as String,
      inputDate: DateTime.parse(json['inputDate'] as String),
      nameFirst: json['nameFirst'] as String,
      nameLast: json['nameLast'] as String,
      phone: json['phone'] as String,
      post: json['post'] as String,
    );

Map<String, dynamic> _$$PublicUserImplToJson(_$PublicUserImpl instance) =>
    <String, dynamic>{
      'followerCount': instance.followerCount,
      'nameFull': instance.nameFull,
      'inputDate': instance.inputDate.toIso8601String(),
      'nameFirst': instance.nameFirst,
      'nameLast': instance.nameLast,
      'phone': instance.phone,
      'post': instance.post,
    };
