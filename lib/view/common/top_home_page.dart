//topHome画面
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TopHomePage extends StatelessWidget {
  const TopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 背景画像
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/caraqueHome.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft, // 画像右よせ
            ),
          ),
        ),
        // 背景オーバーライド
        Container(
          color: Colors.black.withOpacity(0.6), // 黒の透明度を指定
        ),
        SafeArea(
          child: AnimationLimiter(
            // アニメーションウィジェット
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                // カラムのアニメーション
                duration: const Duration(milliseconds: 1000), // アニメーション速度
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 10.0, // コンテンツをどれくらいの幅スライドさせるか
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  // 文字部
                  const Padding(padding: EdgeInsets.only(top: 150.0)),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'C  a  r  a  q  u  e  .',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left, // 左よせ
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 150.0)),
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      Text(
                        '香川県高松市の洋菓子店',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      Text(
                        '甘さ控えめで大人な洋菓子を提供しています。',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      Text(
                        'ケーキ、ホールケーキ、焼き菓子など\n幅広く取り揃えております。\nクレジット、電子マネー、QRキャッシュレス決済\nでの支払いが可能です。',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 100.0)),
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      Text(
                        'ご来店お待ちしております。',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
