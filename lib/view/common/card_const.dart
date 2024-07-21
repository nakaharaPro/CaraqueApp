//商品一覧パネル
import 'package:caraqueprod/constant/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardConst extends StatelessWidget {
  const CardConst({
    super.key,
    required this.assetImageURL,
    required this.contentText,
    required this.page, 
  });

  final String assetImageURL; //画像URL
  final String contentText; //商品名
  final StatelessWidget page;//遷移ページパス

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,//外枠
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),//画像部の角丸
        ),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 16, //画像比率 下にメッセージを配置する場合は16/9
                  child: Ink.image(
                    image: AssetImage(assetImageURL), //画像URL
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {
                        Get.to(page);//押下された時の画面遷移
                      },
                    ),
                  ),
                ),
                Positioned(
                  // widget を任意に重ねて配置する
                  bottom: 0, // Stackの下から子の下部までの距離
                  right: 0, // Stackの右端から子の右端までの距離
                  left: 0, // Stackの左端から子の左端までの距離
                  height: 30.0,
                  child: Container(//コンテナ
                    color: ColorsConst.constColorGrey.withOpacity(0.5), // 背景色を設定
                    child: Text(
                      contentText, // 商品名
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            //   child: Text(
            //     descriptionText,//商品説明
            //     overflow: TextOverflow.ellipsis,
            //     maxLines: 1,//表示行数
            //     style: const TextStyle(fontSize: 16),
            //   ),
            // ),
          ],
        ),
      );
}
