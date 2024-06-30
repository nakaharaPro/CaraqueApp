// ホーム画面
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

//スライダー画像
class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    "assets/images/caraque1.jpg",
    "assets/images/caraque2.jpg",
    "assets/images/caraque3.jpg",
    "assets/images/caraque4.jpg",
    "assets/images/caraque5.jpg",
  ];
  
  int activeIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(//画面外ならスクロール可能
        child: AnimationLimiter(//アニメーションウィジェット
          child: Column(
            children: AnimationConfiguration.toStaggeredList(//カラムのアニメーション
              duration: const Duration(milliseconds:1000),//アニメーション速度
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 10.0,//コンテンツをどれくらいの幅スライドさせるか(マイナス値なら左からスライド)
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                slider(),
                
                ],
            ),
          ),
        ),
      ),
    );
  }






//写真スライダー
  Widget slider() {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 300,
            initialPage: 0,//最初に表示する写真のインデックス
            autoPlay: true,//自動再生
            autoPlayInterval: const Duration(seconds: 4),//自動再生の時間間隔
            viewportFraction: 1,//各写真の幅の割合1~0.2
            enlargeCenterPage: true, //画像が変わる時に中心の画像を拡大して、そのほかの画像を縮小する。
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            final path = images[index];
            return buildImage(path, index);
          },
        ),
       const SizedBox(height: 20),
        buildIndicator(),
      ],
    );
  }

  Widget buildImage(String path, int index) => Container(
        // 画像間の隙間
        margin: const EdgeInsets.symmetric(horizontal: 13),
        color: Colors.grey,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        // エフェクトはドキュメントを見た方がわかりやすい
        effect: const JumpingDotEffect(
          dotHeight: 20,
          dotWidth: 20,
          activeDotColor: Colors.grey,
          dotColor: Colors.black12,
        ),
      );
}