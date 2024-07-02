import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/my_home_page_contoroller.dart';

import 'package:caraqueprod/controllers/remote_config_contoroller.dart';
import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/maintenance_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageContoroller());
    Get.put(VerifyEmailContoroller());
    Get.put(AuthController());
    final remoteConfigContoroller = Get.put(RemoteConfigController());
      
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: const Text("Caraque",style: TextStyle(fontSize:25.0,color: Colors.white)),
        toolbarHeight: 50.0,//AppBarの高さ
        backgroundColor:ColorsConst.ColorGrey,//色
      ),
      body: Obx((){
        if(remoteConfigContoroller.rxIsMaintenenanceMode.value){
          return const MaintenanceScreen();//メンテナンス画面
        }else{
        return const MainScreen();
        }
      }),
    );
  }
}
