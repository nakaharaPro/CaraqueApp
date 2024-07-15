import 'package:caraqueprod/constant/massage_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSendmailScreen extends StatelessWidget {
  const OrderSendmailScreen({super.key});



@override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _emailPageTitle(),
            _homeButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailPageTitle() {
    const style = TextStyle(fontSize: 15.0);
    return const SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
  
   
      Text(
        MessageConst.sendEmailorderMassage, //文章
        style: style,
      ),

    Padding(padding:EdgeInsets.all(10.0)),
   
      ],
    ),
    );
    
  }
  
  Widget _homeButton() {
      const style = TextStyle(fontSize: 20.0, color: Colors.black);
    return 
     Column(
        children: [
          const Padding(padding:EdgeInsets.all(10.0)),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
            label: const Text(
              'ホームに戻る',
              style: style,
            ),
            style: ElevatedButton.styleFrom(
              //ボタンスタイル
              backgroundColor: Colors.transparent,
              elevation: 0, //透明度
              side: const BorderSide(color: Colors.black), //ボーダー
            ),
          ),
        ],
    );
  }
}
