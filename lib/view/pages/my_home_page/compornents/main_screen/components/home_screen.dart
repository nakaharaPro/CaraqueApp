// ホーム画面
import 'package:caraqueprod/view/common/top_home_page.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topHome(context),
           // _topHome2(context),
          ],
        ),
      ),
    );
  }

  Widget _topHome(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.935,//ディスプレイのheightを高さに設定

      child: const TopHomePage(),//topPage
    );
  }



}