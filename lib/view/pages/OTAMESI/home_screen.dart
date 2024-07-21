// HomeScreen
import 'package:caraqueprod/view/pages/OTAMESI/google_signin_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.toNamed(GoogleSignInScreen.path);
        },
        child:const Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.home,
                  size: 70,
                ),
                Text(
                  "Home",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
