import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/my_home_page_contoroller.dart';

import 'package:caraqueprod/controllers/remote_config_contoroller.dart';
import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/maintenance_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageContoroller());
    Get.put(VerifyEmailContoroller());
    final authController = Get.put(AuthController());
    final remoteConfigContoroller = Get.put(RemoteConfigController());
    return Scaffold(
      body: Obx((){
        final authUser = authController.rxAuthUser.value;
        if(remoteConfigContoroller.rxIsMaintenenanceMode.value){
          return const MaintenanceScreen();//メンテナンス画面
        }else if(authUser ==  null){
        return const MainScreen();////////////////今これで確認している
        //const AuthScreen();//認証画面
        }
        else if(!authUser.emailVerified){//emailVerifiedが行われていないなら(メール認証してたらtrueになる)
         return const VerifyEmailScreen();//メール認証画面
        }
        else{
          //rxAuthUserがnullじゃなくなったら
          return const MainScreen();
          }
      }),
    );
  }
}