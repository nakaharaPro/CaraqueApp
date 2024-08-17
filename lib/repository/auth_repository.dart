import 'package:caraqueprod/infrastracture/auth/auth_client.dart';
import 'package:caraqueprod/models/result/result.dart';
import 'package:caraqueprod/typedefs/result_typedefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthRepository{
  //認証ユーザー登録
  FutureResult<User> createUserWidthEmailAndPassword(String email,String password) async{
    final client= AuthClient();
    try{
      final res = await client.createUserWidthEmailAndPassword(email, password);
      final user = res.user;
      return (user == null) ? const Result.failure() : Result.success(user);
    }catch(e){
      debugPrint(e.toString());//エラーメッセージの出力
      return const Result.failure();
    }
  }

  //認証ユーザーログイン(
   FutureResult<User> signInWithEmailAndPassword(String email,String password) async{
    final client= AuthClient();
    try{
      final res = await client.signInWidthEmailAndPassword(email, password);
      final user = res.user;
      return (user == null) ? const Result.failure() : Result.success(user);
    }catch(e){
      debugPrint(e.toString());//エラーメッセージの出力
      return const Result.failure();
    }
  }

  //認証ユーザーログイン(
   FutureResult<bool> signOut() async{
    final client= AuthClient();
    try{
      client.signOut();
      return const Result.success(true);
    }catch(e){
      return const Result.failure();
    }
  }

//認証メール送信の可否
  FutureResult<bool> sendEmailVerification(User user) async{
    final client = AuthClient();
    try{
      await client.sendEmailVerification(user);
      return const Result.success(true);
    }catch(e){
      return const Result.failure();
    }
  }

  //ユーザーの削除
   FutureResult<bool> delete(User user) async{
    final client = AuthClient();
    try{
      await client.delte(user);
      return const Result.success(true);
    }catch(e){
      return const Result.failure();
    }
  }
}