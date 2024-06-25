import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/common/rounded_button.dart';
import 'package:caraqueprod/view/common/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //抽象クラスの継承

  final _formKey = GlobalKey<FormState>(); //validateを使うときに必須

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleWidget(),
        _signupForm(),
        _positiveButton(),
        toggleLoginModeButton(),
      ],
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

//モード切り替えテキストボタン
  Widget toggleLoginModeButton() {
    const style = TextStyle(
        fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold);
    return TextButton(
      onPressed: AuthController.to.onToggleLoginModeButtonPressed,
      child: const Text("新規登録画面へ移動", style: style),
    );
  }

  Widget _positiveButton() {
    return RoundedButton(
      //自作ボタンデザインウィジェット
      color:const Color.fromARGB(255, 113, 222, 252),
      onPressed: () {
        //バリデーショんを行う
        if (_formKey.currentState!.validate()) {
          //バリデーションを行ったあと、入力文字列情報を変数に保存する
          _formKey.currentState!.save(); //WidgetのonSaved処理が走る
        }
        AuthController.to.onPositiveButtonPressed(); //ボタン押下処理（登録かサインイン）
      },
      textValue: "ログイン",
    );
  }
}
