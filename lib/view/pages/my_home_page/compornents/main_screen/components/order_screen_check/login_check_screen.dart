import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/order_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/order_screen_check/order_sendmail/order_sendmail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCheckScreen extends StatelessWidget{
  const LoginCheckScreen({super.key});
  static const path = "/login_check"; //パス
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      body: Obx((){
      if(controller.rxAuthUser.value==null){
          return const LoginScreen();
      }else{
        return const OrderSendmailScreen();
      }
    }),
    );
  }
}
  
