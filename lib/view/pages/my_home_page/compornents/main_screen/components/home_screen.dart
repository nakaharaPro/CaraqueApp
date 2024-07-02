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
            image: DecorationImage(
              image: AssetImage('assets/images/caraqueHome.jpg'), 
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,//画像右よせ
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.6), // 黒の透明度を指定
        ),
        const SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(padding: EdgeInsets.only(top: 150.0)),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'C a r a q u e .',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    Text(
                      '香川県高松市に拠点を置く洋菓子店',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
