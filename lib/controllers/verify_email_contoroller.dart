//メール認証コントローラー
import 'dart:async';

import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/repository/auth_repository.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class VerifyEmailContoroller extends GetxController{
   static VerifyEmailContoroller get to => Get.find<VerifyEmailContoroller>(); //クラスメソッド
  Timer? timer;


//認証メールの送信処理
  Future<void> sendEmailVerification() async{
    final user = AuthController.to.rxAuthUser.value;//認証情報
     if(user == null) return;//認証状態じゃなければ処理終了
    final repository = AuthRepository();
    final result = await repository.sendEmailVerification(user);
    result.when(success: (_){
      _startTimer(user);
      UiHelper.showFlutterToast("認証メールが送信されました");
    }, failure: (){
      UiHelper.showFlutterToast("認証メールの送信に失敗しました");
    });
  }

//メール認証ステータス更新
  void _startTimer(User user){//rxAuthUserのステータスを変更するため引数あり
    timer = Timer.periodic(
      const Duration(seconds: 1),//タイマーが1秒ごとに起動
       (_) async {
        //1秒ごとに行いたい処理
        await user.reload();//メールが検証されたか確認するためのリロード
        final newUser = FirebaseAuth.instance.currentUser;//認証が行われたらnewUserのmailverifidはtrueになる(currentUserは現在認証しているユーザー情報)

        if(newUser?.emailVerified ?? false){//nullならfalseを返す
         AuthController.to.rxAuthUser.value = newUser;//emailvariidを更新するために、rxAuthUserを更新する
          timer?.cancel();//タイマー終了
        }
       });
  }
}