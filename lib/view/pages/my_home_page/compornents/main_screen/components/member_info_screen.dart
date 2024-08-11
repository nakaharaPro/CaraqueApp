import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/pageInfo/page_info.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/signup_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/inquiry_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class MemberInfoScreen extends StatefulWidget {
  const MemberInfoScreen({super.key});
   static const path = "/menber_info"; //パス

  @override
  _MemberInfoScreenState createState() => _MemberInfoScreenState();
}

class _MemberInfoScreenState extends State<MemberInfoScreen> {
  late List<int> favoriteList; // お気に入り配列
  late LSDMap pageList; //

  @override
  void initState() {
    super.initState();
    pageList = PageInfo.productState; // page総数配列
    favoriteList = []; // お気に入りリスト
    // お気に入りがtrueのインデックスを配列に格納
    for (int i = 0; i < pageList.length; i++) {
      if (pageList[i]['favoriteState']) {
        favoriteList.add(i);
      }
    }
  }

  // ライクボタン押下でtrueになれば配列格納、falseになれば削除
  Future<bool> onLikeButtonTapped(bool isLiked, int index) async {
    setState(() {
      pageList[index]['favoriteState'] = !isLiked; //const配列のbool値変更
      if (pageList[index]['favoriteState']) {
        favoriteList.add(index); //お気に入りリスト追加
      } else {
        favoriteList.remove(index); //お気に入りリスト削除
      }
    });
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("会員情報",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
            textAlign: TextAlign.left),
        toolbarHeight: 40.0, //AppBarの高さ
        backgroundColor: ColorsConst.constColorGrey, //色
      ),
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
                    horizontalOffset:
                        10.0, // コンテンツをどれくらいの幅スライドさせるか(マイナス値なら左からスライド)
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    //新規登録ログインログアウトタイトル
                    _menbaerTitle(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _signUpButton(),
                        Obx(() {
                          if (AuthController.to.rxAuthUser.value == null) {
                            return _loginButton();
                          } else {
                            return _logout();
                          }
                        }),
                      ],
                    ),
                //お気に入りタイトル
               _favoriteTitle(),

              // お気に入りリスト
              AnimationLimiter(
                child: favoriteList.isEmpty
                    ? _favoriteNone() //お気に入りリストが登録なければ
                    : ListView.builder(
                        //お気に入りリストの登録があれば
                        physics:
                            const NeverScrollableScrollPhysics(), // 内側のListViewのスクロールを無効にする
                        shrinkWrap: true, // 内側のListViewの高さをコンテンツに合わせる
                        itemCount: favoriteList.length, // リストアイテム個数分リストを作成
                        itemBuilder: (BuildContext context, int index) {
                          int productIndex = favoriteList[index]; // インデックス代入
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 1000),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: _favoriteProducts(
                                  pageList[productIndex]['favoriteState'] ??
                                      false,
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
        
                  _inquiryTitle(),

                  _inquiryButton(),

            ],
          ),
        ),
          ],
                ),
              ),
      ),
    );
  }

//会員情報タイトル
  Widget _menbaerTitle() {
    return Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 20.0),
        width: double.infinity, //横幅いっぱいを意味する
        color: ColorsConst.constColorGrey, //広がっているか色をつけて確認
        child: const Text('　新規登録・ログイン・ログアウト',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)));
  }

//お気に入り一覧タイトル
  Widget _favoriteTitle() {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        width: double.infinity, //横幅いっぱいを意味する
        color: ColorsConst.constColorGrey, //広がっているか色をつけて確認
        child: const Text('　お気に入り一覧',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)));
  }
  //問い合わせタイトル
  Widget _inquiryTitle() {
    return Container(
        margin: const EdgeInsets.only(top: 20.0,bottom: 20.0),
        width: double.infinity, //横幅いっぱいを意味する
        color: ColorsConst.constColorGrey, //広がっているか色をつけて確認
        child: const Text('　お問い合わせ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)));
  }



  // ログインボタン関数
  Widget _loginButton() {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        iconColor: ColorsConst.constColorOrange,
        backgroundColor: ColorsConst.constColorGrey,
      ),
      onPressed: () {
        Get.toNamed(LoginScreen.path);
      },
      icon: const Icon(Icons.login),
      label: const Text(
        'ログイン',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // 問い合わせボタン関数
  Widget _inquiryButton() {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        iconColor: ColorsConst.constColorOrange,
        backgroundColor: ColorsConst.constColorGrey,
      ),
      onPressed: () {
        Get.toNamed(InquiryPage.path);
      },
      icon: const Icon(Icons.view_timeline),
      label: const Text(
        '問い合わせ',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // サインアップボタン関数
  Widget _signUpButton() {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        iconColor: ColorsConst.constColorOrange,
        backgroundColor: ColorsConst.constColorGrey,
      ),
      onPressed: () {
        Get.toNamed(SignupScreen.path);
      },
      icon: const Icon(Icons.add),
      label: const Text(
        "新規会員登録",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

// ログアウトボタン関数
  Widget _logout() {
    final authController = AuthController.to;
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        iconColor: ColorsConst.constColorOrange,
        backgroundColor: ColorsConst.constColorGrey,
      ),
      onPressed: authController.onSignOutButtonPressed,
      icon: const Icon(Icons.logout),
      label: const Text(
        'ログアウト',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // お気に入りが登録されていない場合のウィジェット
  Widget _favoriteNone() {
    return const
     Align(
      alignment: Alignment.center, // 中央寄せ
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "お気に入り登録されていません",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // お気に入りリスト
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
