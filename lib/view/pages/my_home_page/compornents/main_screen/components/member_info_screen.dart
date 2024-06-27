
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberInfoScreen extends StatelessWidget {
  const MemberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _titleWidget(),
          _loginButton(),
          _signupButton(),
        ],
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
      child: const Text("ログインページへ"),
    );
  }

  Widget _signupButton() {
    return ElevatedButton(
      onPressed: () {
       Get.toNamed(SignupScreen.path);
      },
      child: const Text("会員登録ページへ"),
    );
  }
}