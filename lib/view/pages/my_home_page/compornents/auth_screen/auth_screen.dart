//ログイン画面か新規登録画面か判断する(statelessWidget)
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget{
  const AuthScreen({super.key});
  static const path = "/auth_screen"; //パス
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      body: Obx((){
      if(controller.rxIsLoginMode.value){
          return const LoginScreen();//ログインモードならログイン画面出力
      }else{
        return const SignupScreen();//そうじゃないなら新規登録画面出力
      }
    }),
    );
  }
}