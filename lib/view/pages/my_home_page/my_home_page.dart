
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/firebase_db_controller.dart';
import 'package:caraqueprod/controllers/order_controller.dart';

import 'package:caraqueprod/controllers/remote_config_contoroller.dart';
import 'package:caraqueprod/controllers/sendmail_controller.dart';
import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/maintenance_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailContoroller());
    Get.put(AuthController());
    Get.put(FirebaseDbController());
    Get.put(OrderController());
    Get.put(SendmailController());
    final remoteConfigContoroller = Get.put(RemoteConfigController());
      
    return Scaffold(
      body: Obx((){
        if(remoteConfigContoroller.rxIsMaintenenanceMode.value){
          return const MaintenanceScreen();//メンテナンス画面
        }else{
        return 
        const MainScreen();
        
        }
      }),
    );
  }
}

