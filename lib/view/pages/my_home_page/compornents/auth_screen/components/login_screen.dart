//ログイン画面
import 'package:caraqueprod/controllers/auth_controller.dart';

import 'package:caraqueprod/view/common/text_field_container.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const path = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); //validateを使うときに必須
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleWidget(),
          _signupForm(),
          _positiveButton(),
          _toggleLoginModeButton(),
          _homeButton(),
        ],
      ),
    );
  }

//タイトル
  Widget titleWidget() {
    return const Text(
      "ログイン情報を入力してください",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  //入力フォーム関数
  Widget _signupForm() {
    return Form(
      key: _formKey, //validateを使う時にはkeyにGrobal<formstate>を設定しなければならない
      child: Column(
        children: [
          _emailTextField(),
          _passwordTextField(),
        ],
      ),
    );
  }

  //emailを入力する関数
  Widget _emailTextField() {
    final controller = AuthController.to;
    return TextFieldContainer(
      //自作デザインウィジェット
      child: TextFormField(
        decoration: const InputDecoration(hintText: "メールアドレス"),
        onSaved: controller
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
    final controller = AuthController.to;
    return TextFieldContainer(
      //自作デザインウィジェット
      child: TextFormField(
        obscureText: true, //パスワードを隠す
        decoration: const InputDecoration(hintText: "パスワード"), //ヒントテキスト
        onSaved: controller
            .setPassword, //onSavedは(value)が省略できるため、このメソッドの引数にはフォーム入力値がvalueとして渡る
        validator: (value) {
          //valueには入力文字列が入る
          return value!.length > 7 ? null : "パスワードを8文字以上にしてください";
        },
      ),
    );
  }

  Widget _positiveButton() {
    const style = TextStyle(
        fontSize: 25.0,
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.bold);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 72, 97, 121),
      ),
      onPressed: () {
        //バリデーショんを行う
        if (_formKey.currentState!.validate()) {
          //バリデーションを行ったあと、入力文字列情報を変数に保存する
          _formKey.currentState!.save(); //WidgetのonSaved処理が走る
        }
        AuthController.to.onPositiveButtonPressed(); //ボタン押下処理（登録かサインイン）
      },
      child: const Text(
        'ログイン',
        style: style,
      ),
    );
  }

//新規会員登録画面
  Widget _toggleLoginModeButton() {
    const style = TextStyle(
        fontSize: 25.0,
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.bold);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 72, 97, 121),
      ),
      onPressed: () {
        Get.toNamed(SignupScreen.path);
      },
      child: const Text(
        '新規会員登録へ',
        style: style,
      ),
    );
  }

  Widget _homeButton() {
    const style = TextStyle(
        fontSize: 25.0,
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.bold);
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.home,
        color: Colors.white,
      ),
      label: const Text(
        'ホームに戻る',
        style: style,
      ),
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 72, 97, 121)),
      onPressed: () {
        Get.back();
      },
    );
  }
}
