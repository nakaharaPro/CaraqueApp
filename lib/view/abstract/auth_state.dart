//ログインと新規登録の抽象クラス
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/common/rounded_button.dart';
import 'package:caraqueprod/view/common/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class AuthState<T extends StatefulWidget> extends State<T>{//抽象クラスはジェネリクスにstatefulWidgetを継承すること

final _formKey = GlobalKey<FormState>();//validateを使うときに必須



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

//タイトルは画面によって違うからオーバーライドさせる
  Widget titleWidget();
    

//入力フォーム関数
  Widget _signupForm() {
    return Form(
      key: _formKey,//validateを使う時にはkeyにGrobal<formstate>を設定しなければならない
      child: Column(
        children: [
          _emailTextField(),
          _passwordTextField(),
        ],
      ),
    );
  }

  //emailを入力する関数
  Widget _emailTextField(){
    final controller = AuthController.to;
    return TextFieldContainer(//自作デザインウィジェット
      child: TextFormField(
        decoration: const InputDecoration(hintText: "メールアドレス"),
        onSaved: controller.setEmail,//onSavedは(value)が省略できるため、このメソッドの引数にはフォーム入力値がvalueとして渡る
        validator: (value){//valueには入力文字列が入る
        return GetUtils.isEmail(value!) ? null : "正しいメールアドレスを入力してください";
        },
      ),
    );
  }

//パスワードを入力する関数
  Widget _passwordTextField(){
    final controller = AuthController.to;
     return TextFieldContainer(//自作デザインウィジェット
       child: TextFormField(
        obscureText: true,//パスワードを隠す
        decoration: const InputDecoration(hintText: "パスワード"),//ヒントテキスト
        onSaved: controller.setPassword,//onSavedは(value)が省略できるため、このメソッドの引数にはフォーム入力値がvalueとして渡る
        validator: (value){//valueには入力文字列が入る
        return value!.length > 7 ? null : "パスワードを8文字以上にしてください";
        },
           ),
     );
  }

//画面切り替えの文言が違うため、オーバーライドさせる
Widget toggleLoginModeButton();




Widget _positiveButton(){
  return RoundedButton(//自作ボタンデザインウィジェット
  color: Colors.orange,
    onPressed: ()  {
      //バリデーショんを行う
      if (_formKey.currentState!.validate()){
        //バリデーションを行ったあと、入力文字列情報を変数に保存する
        _formKey.currentState!.save();//WidgetのonSaved処理が走る
      }
      AuthController.to.onPositiveButtonPressed();//ボタン押下処理（登録かサインイン）
    },
    textValue: "送信",
    );
}



}