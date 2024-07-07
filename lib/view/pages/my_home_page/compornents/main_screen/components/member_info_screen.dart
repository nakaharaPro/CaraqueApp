import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/pageInfo/page_info.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class MemberInfoScreen extends StatefulWidget {
  const MemberInfoScreen({super.key});

  @override
  _MemberInfoScreenState createState() => _MemberInfoScreenState();
}

class _MemberInfoScreenState extends State<MemberInfoScreen> {
  late List<int> favoriteList; // お気に入り配列
  late LSDMap pageList; //
  

  @override
  void initState() {
    super.initState();
    pageList = PageInfo.productState;//page総数配列
    favoriteList = [];//お気に入りリスト
    //お気に入りがtrueのインデックスを配列に格納
    for (int i = 0; i < pageList.length; i++) {
      if (pageList[i]['favoriteState']) {
        favoriteList.add(i);
      }
    }
  }

//ライクボタン押下でtureになれば配列格納、falseになれば
  Future<bool> onLikeButtonTapped(bool isLiked, int index) async {
    setState(() {
      pageList[index]['favoriteState'] = !isLiked;
      if (pageList[index]['favoriteState']) {
        favoriteList.add(index);
      } else {
        favoriteList.remove(index);
      }
    });
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // 画面外ならスクロール可能
        child: AnimationLimiter(
          child: Column(
            children: [
              Column(
                children: AnimationConfiguration.toStaggeredList(
                  // カラムのアニメーション
                  duration: const Duration(milliseconds: 1000), // アニメーション速度
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset:10.0, // コンテンツをどれくらいの幅スライドさせるか(マイナス値なら左からスライド)
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    _titleWidget(),
                    _loginButton(),
                    _signUpButton(),
                    _logout(),
                    _favoriteTitleWidget(),
                    
                  ],
                ),
              ),

              // お気に入りリスト
              AnimationLimiter(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(), // 内側のListViewのスクロールを無効にする
                  shrinkWrap: true, // 内側のListViewの高さをコンテンツに合わせる
                  itemCount: favoriteList.length, // リストアイテム個数分リストを作成
                  itemBuilder: (BuildContext context, int index) {
                    int productIndex = favoriteList[index];//インデックス代入
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: _favoriteProducts(
                            pageList[productIndex]['favoriteState'] ?? false,
                            pageList[productIndex]['imagePath'] ?? '',
                            pageList[productIndex]['title'] ?? '',
                            productIndex,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // タイトル関数
  Widget _titleWidget() {
    return const Text(
      "ユーザー情報を編集",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  // ログインボタン関数
  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(LoginScreen.path);
      },
      child: const Text("ログインを行う"),
    );
  }

  // サインアップボタン関数
  Widget _signUpButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(SignupScreen.path);
      },
      child: const Text("新規会員登録を行う"),
    );
  }

  Widget _logout() {
    final authController = AuthController.to;
    return ElevatedButton(
      onPressed: authController.onSignOutButtonPressed,
      child: const Text(
        "ログアウト",
      ),
    );
  }

   Widget _favoriteTitleWidget() {
    return const Align(
    alignment: Alignment.topLeft,//左よせ
    child:  Text(
      "お気に入り一覧",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
     ),
    );
  }

//お気に入りリスト
  Widget _favoriteProducts(bool isLiked, String imagePath, String title, int index) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(10.0)),
          Image.asset(
            imagePath,
            height: 80, // 画像の高さ
            width: 100, // 画像の幅
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, size: 60);
            },
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          Expanded(
            child: Text(title),
          ),
          const Expanded(child: SizedBox()), // 最大幅で空間を埋める
          LikeButton(
            size: 30.0,
            isLiked: isLiked, // bool値
            onTap: (isLiked) => onLikeButtonTapped(isLiked, index),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.favorite,
                color: isLiked ? Colors.orange : Colors.grey,
                size: 30.0,
              );
            },
            padding: const EdgeInsets.only(right: 10.0),
          ),
        ],
      ),
    );
  }
}