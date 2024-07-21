//ログイン画面
import 'package:caraqueprod/constant/animation_const.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';

import 'package:caraqueprod/view/common/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const path = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); //validateを使うときに必須
  final authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleWidget(),
            _animation(),
            _padding(),
            _signupForm(),
            _positiveButton(),
            _padding(),
            _homeButton(),
          ],
        ),
      ),
    );
  }

//タイトル
  Widget _titleWidget() {
    return const Text(
      "Login",
      style: TextStyle(fontSize: 25.0, shadows: [
        Shadow(
            offset: Offset(5, 5),
            blurRadius: 10,
            color: Colors.grey) //ofsetはx軸、blurRadiusはぼかし
      ]),
    );
  }

//アニメーション
  Widget _animation() {
    return Center(
      child: Lottie.asset(
        coffeeBreak, //アニメーションjsonリンク
        width: 350,
        height: 170,
      ),
    );
  }

  //入力フォーム関数
  Widget _signupForm() {
    return Form(
      key: _formKey, //validateを使う時にはkeyにGrobal<formstate>を設定しなければならない
      child: Column(
        children: [
          _emailTextField(),
           _padding(),
          _passwordTextField(),
          _padding(),
          
        ],
      ),
    );
  }

  //emailを入力する関数
  Widget _emailTextField() {
    return TextFieldContainer(
      //自作デザインウィジェット
      child: TextFormField(
        decoration: const InputDecoration(hintText: "メールアドレス"),
        onSaved: authController
            .setEmail, //onSavedは(value)が省略できるため、このメソッドの引数にはフォーム入力値がvalueとして渡る
        validator: (value) {
          //valueには入力文字列が入る
          return GetUtils.isEmail(value!) ? null : "正しいメールアドレスを入力してください";
        },
      ),
    );
  }

//パスワードを入力する関数
  Widget _passwordTextField() {
    return TextFieldContainer(
      //自作デザインウィジェット
      child: TextFormField(
        obscureText: true, //パスワードを隠す
        decoration: const InputDecoration(hintText: "パスワード ※8桁以上"), //ヒントテキスト
        onSaved: authController
            .setPassword, //onSavedは(value)が省略できるため、このメソッドの引数にはフォーム入力値がvalueとして渡る
        validator: (value) {
          //valueには入力文字列が入る
          return value!.length > 7 ? null : "パスワードを8文字以上にしてください";
        },
      ),
    );
  }

//ログインボタン
  Widget _positiveButton() {
    const style = TextStyle(fontSize: 20.0, color: Colors.black);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      onPressed: () {
        //バリデーショんを行う
        if (_formKey.currentState!.validate()) {
          //バリデーションを行ったあと、入力文字列情報を変数に保存する
          _formKey.currentState!.save(); //WidgetのonSaved処理が走る
          authController.onLoginButtonPressed(); //ボタン押下処理（登録かサインイン）
          
        }
      },
      child: const Text(
        'Login',
        style: style,
      ),
    );
  }

//ホームボタン
  Widget _homeButton() {
    const style = TextStyle(fontSize: 20.0, color: Colors.black);
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.home,
        color: Colors.black,
      ),
      onPressed: () {
        Get.back();
   
      },
      label: const Text(
        'ホームに戻る',
        style: style,
      ),
      style: ElevatedButton.styleFrom(
        //ボタンスタイル
        backgroundColor: Colors.transparent,
        elevation: 0, //透明度
        side: const BorderSide(color: Colors.black), //ボーダー
      ),
    );
  }

//パディング
  Widget _padding(){
    return const Padding(padding: EdgeInsets.all(5.0));
  }

  
}




