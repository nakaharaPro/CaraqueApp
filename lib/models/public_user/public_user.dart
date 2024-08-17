import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser implements _$PublicUser {
//インスタンスメソッド
  const PublicUser._();

//モデルのメンバ変数部
  const factory PublicUser({
    required DateTime inputDate,
    required String nameFull,
    required String nameFirst,
    required String nameLast,
    required String phone,
    required String post,

   @Default([{}]) LSDMap pageList,

  }) = _PublicUser;

//モデルのドキュメント読み取り処理メソッド部
  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);

//インスタンスメソッド
//例
  // void greeting(){
  //   debugPrint("私のUIDは$uidです");
  // }
}
