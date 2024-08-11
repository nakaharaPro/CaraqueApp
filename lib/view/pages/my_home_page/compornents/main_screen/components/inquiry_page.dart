//問い合わせページ
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({super.key});
  static const path = "/inquiry";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //上下のカメラとかを避ける
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "公式アカウントのQRコードになります。こちらを登録してお問い合わせください",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "ID : @979enpsl",
                    style: TextStyle(fontSize: 40.0, color: Colors.red),
                  ),
                ),
              ),
              
              //QRコード
              FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  'assets/images/QR.jpg',
                  filterQuality: FilterQuality.high,
                ),
              ),
              
              //ホームへ戻るボタン
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  label: const Text(
                    'ホームへ戻る',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    //ボタンスタイル
                    backgroundColor: Colors.transparent,
                    elevation: 0, //透明度
                    side: const BorderSide(color: Colors.black), //ボーダー
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
