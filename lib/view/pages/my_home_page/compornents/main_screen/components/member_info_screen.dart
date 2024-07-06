//会員情報画面
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class MemberInfoScreen extends StatelessWidget {
  const MemberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {







    return Scaffold(
      body: SingleChildScrollView(
        //画面外ならスクロール可能
        child: AnimationLimiter(
          //アニメーションウィジェット
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              //カラムのアニメーション
              duration: const Duration(milliseconds: 1000), //アニメーション速度
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 10.0, //コンテンツをどれくらいの幅スライドさせるか(マイナス値なら左からスライド)
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                _titleWidget(),
                _loginButton(),
                _signUpButton(),
                _logout(),
                _favoriteProducts(),
              ],
            ),
          ),
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


  Widget _favoriteProducts() {

      const data = [
      Text("item0"),Text("item1"),Text("item2"),Text("item3"),Text("item4"),
    ];

    return 
    ListView(
          children: data

   
    );

  }

}
