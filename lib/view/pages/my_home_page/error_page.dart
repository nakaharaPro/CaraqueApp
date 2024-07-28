//サンプル使用のためのアカウントページ
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});
  static const path = "/account";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        //上下のカメラとかを避ける
        child: Scaffold(
            body: Center(
                child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Text("エラーが生じました。ホーム画面よりやり直してください"),
          ),
        ),

    ElevatedButton.icon(
      icon: const Icon(
        Icons.home,
        color: Colors.black,
      ),
      onPressed: () {
        Get.toNamed(MainScreen.path);
   
      },
      label: const Text(
        'ホーム',
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        //ボタンスタイル
        backgroundColor: Colors.transparent,
        elevation: 0, //透明度
        side: const BorderSide(color: Colors.black), //ボーダー
      ),
    ),
      ],
                ),
            ),
        ),
    );
  }
}
