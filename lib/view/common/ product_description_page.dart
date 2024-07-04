
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class productDescriptionPage extends StatelessWidget {
  const productDescriptionPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; //画面の高さ取得
    final double heightSize = size.height * 0.5;
    return Column(
      children: [
        SizedBox(
          height: heightSize,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0), //左上角
                      topRight: Radius.circular(40.0), //右上角,
                      bottomRight: Radius.circular(40.0), //右下角
                      bottomLeft: Radius.circular(40.0), //左下角
                    ),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Columnアニメーション
        AnimationLimiter(
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
                Row(
                  children: [
                    Text(
                      title, //商品名
                      style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left, //左よせ
                    ),
                  ],
                ),
                Text(
                  description, //商品説明
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left, //左よせ
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
