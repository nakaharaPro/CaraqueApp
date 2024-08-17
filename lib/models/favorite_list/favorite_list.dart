import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_list.freezed.dart';
part 'favorite_list.g.dart';

@freezed
abstract class FavoriteList implements _$FavoriteList {
//インスタンスメソッド
  const FavoriteList._();

//モデルのメンバ変数部
  const factory FavoriteList({

    @Default([{}]) LSDMap pageList,

  }) = _FavoriteList;

//モデルのドキュメント読み取り処理メソッド部
  factory FavoriteList.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListFromJson(json);

//インスタンスメソッド
//例
  // void greeting(){
  //   debugPrint("私のUIDは$uidです");
  // }
}
