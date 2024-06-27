//会員ページ

import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';

import 'package:flutter/material.dart';

class MemberInfoScreen extends StatelessWidget{
  const MemberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Column(
       //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _titleWidget(),
        _loginButton(context),
 
      ],
    );
  }

  //タイトル関数
  Widget _titleWidget(){
    return const Text("ユーザー情報を編集",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),);
  }


Widget _loginButton(BuildContext context){
  return ElevatedButton(
    onPressed: (){
          Navigator.push(
                context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
  , 
  child: const Text("会員登録ページへ"),
  );
}

}
