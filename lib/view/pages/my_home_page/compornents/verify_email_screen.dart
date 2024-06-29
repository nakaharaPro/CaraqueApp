//メール認証画面
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  static const path = "/verify_email";

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailContoroller()); //コントローラーのonInitが発火

    return Scaffold(
      body: SingleChildScrollView(
        //画面からはみ出たらスクロールできるウィジェット
        child: Column(
          children: [
            _emailPageTitle(),
            _maillCheckButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailPageTitle() {
    const style = TextStyle(fontSize: 30.0);
    return const Center(
      child: Text(
        '''確認メールを送信しました。メールボックスよりメールの内容からリンクを押下して認証を行ってください。
        認証が完了したら、下の完了ボタンをタップしてください。''',
        style: style,
      ),
    );
  }

  Widget _maillCheckButton() {
    final authController = Get.find<AuthController>();
    return ElevatedButton(
      onPressed: authController.onSignOutButtonPressed,
      child: const Text(
        "完了",
      ),
    );
  }
}
