import 'package:caraqueprod/view/common/card_const.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/product_%20Individual/product_individual_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 2; //列数変数
    List<Widget> contentsList = [
      contentCard(context),
      contentCard2(context),
      contentCard3(context),
    ];

    return Scaffold(
         appBar: AppBar(
       centerTitle: true,
        title: const Text("商品一覧",style: TextStyle(fontSize:20.0)),
        toolbarHeight: 25.0,//AppBarの高さ
      ),
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: columnCount, // 列数
          children: List.generate(
            contentsList.length,//下の処理長さ回数処理?
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1000),//モーション時間
                columnCount: columnCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Container(
                      color: Colors.white,//グリッドの枠線色
                      child: Center(child: contentsList[index]),
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
      descriptionText: "商品説明",
      page: ProductIndividual1(),
  );
  Widget contentCard2(BuildContext context) => const CardConst(
        assetImageURL: 'assets/images/caraque2.jpg',
        contentText: 'Cats rule the world!',
        descriptionText:
            'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
            page: ProductIndividual1(),
      );
  Widget contentCard3(BuildContext context) => const CardConst(
        assetImageURL: 'assets/images/caraque3.jpg',
        contentText: 'Cats rule the world!',
        descriptionText:
            'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
        page: ProductIndividual1(),
      );
}
