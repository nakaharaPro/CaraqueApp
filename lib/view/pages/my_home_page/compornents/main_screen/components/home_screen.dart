// ホーム画面
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/caraqueHome.jpg'), 
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SafeArea(
          child: Center(
            child: Text(
              '画面一杯に画像',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
