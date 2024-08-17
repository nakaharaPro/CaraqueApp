// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicUserImpl _$$PublicUserImplFromJson(Map<String, dynamic> json) =>
    _$PublicUserImpl(
      inputDate: DateTime.parse(json['inputDate'] as String),
      nameFull: json['nameFull'] as String,
      nameFirst: json['nameFirst'] as String,
      nameLast: json['nameLast'] as String,
      phone: json['phone'] as String,
      post: json['post'] as String,
      pageList: (json['pageList'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [{}],
    );

Map<String, dynamic> _$$PublicUserImplToJson(_$PublicUserImpl instance) =>
    <String, dynamic>{
      'inputDate': instance.inputDate.toIso8601String(),
      'nameFull': instance.nameFull,
      'nameFirst': instance.nameFirst,
      'nameLast': instance.nameLast,
      'phone': instance.phone,
      'post': instance.post,
      'pageList': instance.pageList,
    };
