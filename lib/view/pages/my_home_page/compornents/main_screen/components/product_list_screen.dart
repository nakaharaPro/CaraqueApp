import 'package:caraqueprod/view/common/card_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 2;//列数変数
    List<Widget> numberList = [
      buildImageInteractionCard(context), 
      buildImageInteractionCard2(context),
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

  Widget buildImageInteractionCard(BuildContext context) => const CardConst(assetImageURL: 'assets/images/caraque1.jpg', contentText: "商品", descriptionText: "商品説明");


      Widget buildImageInteractionCard2(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Ink.image(
                    image: const AssetImage('assets/images/caraque2.jpg'),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {}, // 画像をタップしたときの動作
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Cats rule the world!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
}
