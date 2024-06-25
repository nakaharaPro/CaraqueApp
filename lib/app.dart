import 'package:caraqueprod/view/pages/my_home_page/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'flavors.dart';

class App extends StatelessWidget {

  const App({super.key});
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}