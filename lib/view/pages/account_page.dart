//サンプル使用のためのアカウントページ
import 'package:flutter/material.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static const path = "/account";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(//上下のカメラとかを避ける
        child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Text("アカウント情報"),
        ),
      ),
    ));
  }
}
