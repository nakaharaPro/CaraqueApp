//メール認証画面
import 'package:caraqueprod/constant/massage_const.dart';
import 'package:caraqueprod/controllers/verify_email_contoroller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});
  static const path = "/order_complete";



  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailContoroller()); //コントローラーのonInitが発火

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _orderCompleteTitle(),
            _homeButton(),
          ],
        ),
      ),
    );
  }

  Widget _orderCompleteTitle() {
    const style = TextStyle(fontSize: 20.0);
    return const Center(
      child: Text(
        MessageConst.orderComplete, //文章
        style: style,
      ),
    );
  }




  Widget _homeButton() {
    return ElevatedButton(
      onPressed: () {
     Get.toNamed(MainScreen.path);
      },
      child: const Text(
        "ホーム",
      ),
    );
  }
}
