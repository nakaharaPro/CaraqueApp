//商品一覧画面
import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/pageInfo/page_info.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/view/common/card_const.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/product_%20Individual/product_individual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});


  @override
  Widget build(BuildContext context) {
    int columnCount = 2; // タイルの列数変数

    LSDMap pagestate = PageInfo.productState; // 情報
    int listLength = pagestate.length; // 情報の長さをmaxindexとする

    // コンテンツリストの生成
    List<Widget> contentsList = [];
    for (int i = 0; i < listLength; i++) {//インデックス分繰り返し
      contentsList.addAll(contentsCardList(context, i));//addAllで配列に複数の要素を追加する、contextとインデックスを渡す
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text("商品一覧",style: TextStyle(fontSize:25.0,color: Colors.white),textAlign: TextAlign.left),
        toolbarHeight: 40.0,//AppBarの高さ
        backgroundColor:ColorsConst.ColorGrey,//色
      ),
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: columnCount, // 列数
          children: List.generate(
            listLength, // 下の処理長さ回数処理
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 1000), // モーション時間
                columnCount: columnCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Container(
                      color: Colors.white, // グリッドの枠線色
                      child: Center(child:contentsCardList(context, index)[index]),
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

  List<Widget> contentsCardList(BuildContext context, int index) {//各画面に渡されたcontextと配列のindexを渡す
    return [
      contentCard(context, index),
      contentCard2(context, index),
      contentCard3(context, index),
    ];
  }

  Widget contentCard(BuildContext context, int index) {
    
    LSDMap pagestate = PageInfo.productState; // 情報
    SDMap productState = pagestate[index];
    String title = productState['title'] ?? '';
    String imagePath = productState['imagePath'] ?? '';
    return CardConst(
      assetImageURL: imagePath,
      contentText: title,
      page: ProductIndividual(index: index,),
    );
  }

  Widget contentCard2(BuildContext context, int index) {
    LSDMap pagestate = PageInfo.productState; // 情報
    SDMap productState = pagestate[index];
    String title = productState['title'] ?? '';
    String imagePath = productState['imagePath'] ?? '';
    return  CardConst(
      assetImageURL: imagePath,
      contentText: title,
      page: ProductIndividual(index: index,),
    );
  }


  Widget contentCard3(BuildContext context, int index) {
    LSDMap pagestate = PageInfo.productState; // 情報
    SDMap productState = pagestate[index];
    String title = productState['title'] ?? '';
    String imagePath = productState['imagePath'] ?? '';
    return CardConst(
      assetImageURL: imagePath,
      contentText: title,
      page: ProductIndividual(index: index,),
    );
  }


}
