import 'package:caraqueprod/constant/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ProductIndividual1 extends StatelessWidget {
  const ProductIndividual1({super.key,required this.title,required this.description});

final String title;
final String description;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightSize = size.height * 0.5;

    return SafeArea(
      
      child: Scaffold(
        backgroundColor: ColorsConst.ColorGrey,
        body: Column(
          children: [
            //戻るアイコン
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                ),
                IconButton(
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),

            SizedBox(
              height: heightSize,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0), //左上角
                          topRight: Radius.circular(40.0), //右上角,
                          bottomRight: Radius.circular(40.0), //右下角
                          bottomLeft: Radius.circular(40.0), //左下角
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/caraque1.jpg'),
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
                style:const TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold),
              ),
                    ],
                  ),
                ],
              ),
            ),

     
            ),
          ],
        ),
      ),
    );
  }
}
