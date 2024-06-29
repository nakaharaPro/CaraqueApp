import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:caraqueprod/repository/auth_repository.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>(); //クラスメソッド
  final verifyEmailContoroller = VerifyEmailContoroller.to;
  final rxAuthUser = Rx<User?>(FirebaseAuth.instance.currentUser); //ログインを情報を初期値にすることで最初はnullになる、ログインしたらここにUser情報が代入される
  //final rxIsLoginMode = false.obs; //obsは元からRx<bool>の型が定義されている。つまりこの記載は rxIsLoginMode = Rx<bool>(false)と同等
  String email = "";
  String password = "";

  void setEmail(String? value) {
    //null許容
    if (value == null) return;
    email = value;
    debugPrint(email);
  }

  void setPassword(String? value) {
    if (value == null) return;
    password = value;
    debugPrint(password);
  }

//新規会員登録ボタン押下処理
  void onSignupButtonPressed() async {
    if (GetUtils.isEmail(email) && password.length >= 8) {
      //ログインモードならサインイン処理、そうでなければ登録処理
          await _createUserWithEmailAndPassword();
          //verifyEmailContoroller.sendEmailVerification();
    }
  }

//ログインボタン押下処理
  void onLoginButtonPressed() async {
    if (GetUtils.isEmail(email) && password.length >= 8) {
      //ログインモードならサインイン処理、そうでなければ登録処理
      await _signInWithEmailAndPassword();
     
    }
  }

//認証ユーザーの登録
  Future<void> _createUserWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.createUserWidthEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UiHelper.showFlutterToast("新規登録が成功しました");
    }, failure: () {
      UiHelper.showFlutterToast("新規登録が成功しました");
    });
  }


//ログイン処理
  Future<void> _signInWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.signInWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UiHelper.showFlutterToast("ログインが成功しました");
    }, failure: () {
      UiHelper.showFlutterToast("ログインが失敗しました");
    });
  }

//サインアウト
  void onSignOutButtonPressed() async {
    _signOut();
  }

//サインアウト
  Future<void> _signOut() async {
    final repository = AuthRepository();
    final result = await repository.signOut();
    result.when(success: (_) {
      rxAuthUser.value = null;
      UiHelper.showFlutterToast("ログアウトに成功しました");
    }, failure: () {
      UiHelper.showFlutterToast("ログアウトに失敗しました");
    });
  }
}