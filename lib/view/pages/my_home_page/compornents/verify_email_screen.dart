//メール認証画面
import 'package:caraqueprod/constant/send_emailcheck_massage.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  static const path = "/verify_email";

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailContoroller()); //コントローラーのonInitが発火

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _emailPageTitle(),
            _maillCheckButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailPageTitle() {
    const style = TextStyle(fontSize: 20.0);
    return const Center(
      child: Text(
        SendEmailcheckMassage.sendEmailcheckMassage, //文章
        style: style,
      ),
    );
  }

  Widget _maillCheckButton() {
    final authController = AuthController.to;
    return ElevatedButton(
      onPressed: () {
        if (authController.rxAuthUser.value!.emailVerified) {
          //メール認証ができてたら
          if (authController.reMailAuth.value) {//メール未認証なら
            authController.changeEmailAuthState(); //メール認証ステータスの変更
          }
          UiHelper.showFlutterToast("会員登録が完了しました。");
          Get.back();
          Get.back(); //ホーム画面へ遷移
        } else {
          UiHelper.showFlutterToast("認証が確認できませんでした。");
          authController.changeEmailAuthState(); //メール認証ステータスの変更
          Get.back();
        }
      },
      child: const Text(
        "完了",
      ),
    );
  }
}
