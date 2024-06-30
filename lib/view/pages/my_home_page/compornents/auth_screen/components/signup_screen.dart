//サインアップ画面
import 'package:caraqueprod/constant/animation_const.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/common/text_field_container.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const path = "/signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>(); //validateを使うときに必須
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _titleWidget(),
          _animation(),
          _signupForm(),
          _positiveButton(),
          _homeButton(),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Signup",
      style: TextStyle(fontSize: 25.0, shadows: [
        Shadow(offset: Offset(5, 5), blurRadius: 10, color: Colors.grey)
      ]),
    );
  }

  //アニメーション
  Widget _animation() {
    return Center(
      child: Lottie.asset(
        coffeeBreak, //アニメーションjsonリンク
        width: 350,
        height: 200,
      ),
    );
  }

  //入力フォーム関数
  Widget _signupForm() {
    return Form(
      key: _formKey, //validateを使う時にはkeyにGrobal<formstate>を設定しなければならない
      child: Column(
        children: [
          _reAuthMag(),
          _emailTextField(),
          _passwordTextField(),
        ],
      ),
    );
  }

  //
  Widget _reAuthMag() {
    final controller = AuthController.to;
    const style = TextStyle(fontSize: 15.0, color: Colors.red);
    return Obx(() {
      if (controller.reMailAuth.value) {
        return const Text(
          "※メールアドレスを使用可能なものに変更してください。",
          style: style,
        );
      } else {
        return const Text("");
      }
    });
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
        decoration: const InputDecoration(hintText: "パスワード ※8桁以上"), //ヒントテキスト
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
        fontSize: 20.0, color: Colors.black);
    return OutlinedButton(
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.black,
  ),
      onPressed: () {
        //バリデーショんを行う
        if (_formKey.currentState!.validate()) {
          //バリデーションを行ったあと、入力文字列情報を変数に保存する
          _formKey.currentState!.save(); //WidgetのonSaved処理が走る
        AuthController.to.onSignupButtonPressed(); //メール認証実行
        Get.toNamed(VerifyEmailScreen.path);
        }
      
      },
      child: const Text(
        'Registration',
        style: style,
      ),
    );
  }

  Widget _homeButton() {
    const style = TextStyle(
        fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
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
