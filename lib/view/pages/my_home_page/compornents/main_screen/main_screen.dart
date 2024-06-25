//ログイン後の画面で出力画面を選別
import 'package:caraqueprod/controllers/main_controller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/content_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return Obx(() {
      final publicUser = controller.rxPublicUser.value;
      if(publicUser == null){
        return const CircularProgressIndicator();//クルクル回るやつ
      }else{
        return publicUser.name.isEmpty ? const EditScreen() : const ContentScreen();//firebaseのnameフィールドの有無で出力画面を変える
      }
      });

   


   
  }
}
