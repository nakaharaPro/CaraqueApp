import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:like_button/like_button.dart';

class ProductDescriptionPage extends StatefulWidget {
  //メンバ変数
  final String imagePath;
  final String titleName;
  final String description;

  // コンストラクタ
  const ProductDescriptionPage({
    super.key,
    required this.imagePath,
    required this.titleName,
    required this.description,
  });

  @override
  State<ProductDescriptionPage> createState() => _PageState();
}

class _PageState extends State<ProductDescriptionPage> {
  bool isLiked =false;
  int count = 0;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    setState(() {
      this.isLiked = !isLiked; // bool値を変更する
      count++;
    });
    debugPrint("$count");
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 画面の高さ取得
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
                      topLeft: Radius.circular(40.0), // 左上角
                      topRight: Radius.circular(40.0), // 右上角
                      bottomRight: Radius.circular(40.0), // 右下角
                      bottomLeft: Radius.circular(40.0), // 左下角
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [

                          //////
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, //両端に配置
                            children: [
                              //商品名ゾーン
                              Text(
                                widget.titleName, // 商品名
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left, // 左よせ
                              ),
                              //ライクボタンゾーン
                              LikeButton(
                                size: 30.0,
                                isLiked: isLiked, // bool値
                                onTap: onLikeButtonTapped,
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.favorite,
                                    color:
                                        isLiked ? Colors.orange : Colors.grey,
                                    size: 30.0,
                                  );
                                },
                              ),
                            ],
                          ),
                          //////

                          //商品説明ゾーン
                          Text(
                            widget.description, // 商品説明
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left, // 左よせ
                          ),
                        ],
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
