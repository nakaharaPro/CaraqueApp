//サインアップ画面
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/abstract/auth_state.dart';
import 'package:flutter/material.dart';
//抽象クラスから継承
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends AuthState<SignupScreen> {//抽象クラスの継承


@override
  Widget titleWidget() {
    return const Text(
      "新規登録の情報を入力してください",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }
  

//モード切り替えテキストボタン
@override
  Widget toggleLoginModeButton() {
    const style = TextStyle(fontSize: 25.0,color: Colors.black,);
    return TextButton(
      onPressed: AuthController.to.onToggleLoginModeButtonPressed,
      child: const Text("ログイン画面へ遷移",style:style),
      );
  }

  

}
