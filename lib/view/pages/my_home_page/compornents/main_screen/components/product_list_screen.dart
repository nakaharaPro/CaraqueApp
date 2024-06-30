import 'package:caraqueprod/view/common/card_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 2; //列数変数
    List<Widget> numberList = [
      contentCard(context),
      contentCard2(context),
      contentCard3(context),
    ];

    return Scaffold(
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: columnCount, // 列数
          children: List.generate(
            numberList.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1000),
                columnCount: columnCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Container(
                      color: Colors.pink,
                      child: Center(child: numberList[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget contentCard(BuildContext context) => const CardConst(
      assetImageURL: 'assets/images/caraque1.jpg',
      contentText: "商品",
      descriptionText: "商品説明");
  Widget contentCard2(BuildContext context) => const CardConst(
        assetImageURL: 'assets/images/caraque2.jpg',
        contentText: 'Cats rule the world!',
        descriptionText:
            'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
      );
  Widget contentCard3(BuildContext context) => const CardConst(
        assetImageURL: 'assets/images/caraque3.jpg',
        contentText: 'Cats rule the world!',
        descriptionText:
            'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
      );
}
