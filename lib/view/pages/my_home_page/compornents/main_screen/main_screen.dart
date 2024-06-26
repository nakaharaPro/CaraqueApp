//main画面
import 'package:caraqueprod/controllers/auth_controller.dart';
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



    // return Obx(() {
    //   final publicUser = controller.rxPublicUser.value;
    //   if(publicUser == null){
    //     return const CircularProgressIndicator();//クルクル回るやつ
    //   }else{
    //     return publicUser.name.isEmpty ? const EditScreen() : const ContentScreen();//firebaseのnameフィールドの有無で出力画面を変える
    //   }
    //   });

   


   
  }

