//メール認証画面
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailContoroller()); //コントローラーのonInitが発火
   

    return SingleChildScrollView(
      //画面からはみ出たらスクロールできるウィジェット
      child: Column(
        children: [
          _emailPageTitle(),
          _logout(),
        ],
      ),
    );
  }

  Widget _emailPageTitle() {
    const style = TextStyle(fontSize: 30.0);
    return const Center(
      child: Text(
        "確認メールを送信しました。メールボックスより確認してください",
        style: style,
      ),
    );
  }

  Widget _logout() {
     final authController = Get.find<AuthController>();
    return ElevatedButton(
      onPressed: authController.onSignOutButtonPressed,
      child: const Text(
        "新規登録をやり直す",
      ),
    );
  }
}
