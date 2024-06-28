import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberInfoScreen extends StatelessWidget {
  const MemberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("会員情報")
        ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleWidget(),
            _loginButton(),
            _signUpButton(),
            _logout(),
          ],
        ),
      ),
    );
  }

  // タイトル関数
  Widget _titleWidget() {
    return const Text(
      "ユーザー情報を編集",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  // ログインボタン関数
  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(LoginScreen.path);
      },
      child: const Text("ログインを行う"),
    );
  }

  // サインアップボタン関数
  Widget _signUpButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(SignupScreen.path);
      },
      child: const Text("新規会員登録を行う"),
    );
  }

  Widget _logout() {
    final authController = AuthController.to;
    return ElevatedButton(
      onPressed: authController.onSignOutButtonPressed,
      child: const Text(
        "ログアウト",
      ),
    );
  }
}
