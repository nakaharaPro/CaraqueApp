//メイン画面
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentScreen extends StatelessWidget{
  const ContentScreen ({Key? key}) : super (key:key);
  @override
  Widget build(BuildContext context) {
  const style = TextStyle(fontSize: 30.0);
   final authController = AuthController.to; //これfindしてるってこと



   return  Column(
      children: [
       Obx(()=>  Text(MainController.to.rxPublicUser.value?.uid ?? "nullです",style: style,),),
       const SizedBox(height: 10.0,),
        ElevatedButton(
          onPressed: authController.onSignOutButtonPressed,
          child: const Text(
            "ログアウト",
            style: style,
          ),
        ),
      ],
    );
  }
}