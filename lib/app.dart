import 'package:caraqueprod/router/get_pages.dart';
import 'package:caraqueprod/view/pages/my_home_page/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'flavors.dart';

class App extends StatelessWidget {

  const App({super.key});
  static const path = "/";//それぞれのページの静的定数
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: F.title,
      //ページ遷移
      getPages: GetPages.value,//ページ指定
      initialRoute: path,//イニシャルルートにパスを与える
      //ページ遷移
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Mincho',//フォントファミリーの指定
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}