import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/abstract/auth_state.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super (key: key);
    @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends AuthState<LoginScreen>{//抽象クラスの継承


@override//オーバーライド
  Widget titleWidget() {
    return const Text(
      "ログイン",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

//モード切り替えテキストボタン
@override
  Widget toggleLoginModeButton() {
     const style = TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold);
    return TextButton(
      onPressed: AuthController.to.onToggleLoginModeButtonPressed,
      child: const Text("新規登録画面へ",style:style),
      );
  }
}