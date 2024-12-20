//サインアップ画面
import 'package:caraqueprod/constant/animation_const.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/common/text_field_container.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/verify_email_screen.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _loginPageButton(),
          _homeButton(),
            ],
          ),
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
        signupAnimation, //アニメーションjsonリンク
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
          AuthController.to.onSignupButtonPressed(); //メール認証実行
          Get.toNamed(VerifyEmailScreen.path);
        }
      },
      child: const Text(
        '会員登録を行う',
        style: style,
      ),
    );
  }

  Widget _homeButton() {
    const style = TextStyle(fontSize: 20.0, color: Colors.black);
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.home,
        color: Colors.black,
      ),
      onPressed: () {
        Get.toNamed(MainScreen.path);
      },
      label: const Text(
        'ホーム',
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


    Widget _loginPageButton() {
    const style = TextStyle(fontSize: 20.0, color: Colors.black);
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.login,
        color: Colors.black,
      ),
      onPressed: () {
        Get.toNamed(LoginScreen.path);
      },
      label: const Text(
        'ログイン',
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
}
