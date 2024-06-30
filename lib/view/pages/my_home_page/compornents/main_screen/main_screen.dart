import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/home_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/member_info_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/order_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const path = "/main";

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //各画面の配列
  static const _screens = [
    HomeScreen(),
    OrderScreen(),
    ProductListScreen(),
    MemberInfoScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; //タップされたインデックス代入
    });
  }

  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
      const style = TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Obx(() {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: authController.rxAuthUser.value != null
                    ? Colors.white
                    : Colors.black,
                backgroundColor: authController.rxAuthUser.value != null
                    ? Colors.green
                    : Colors.grey,
                shape: const StadiumBorder(),
              ),
              child: Text(
                  authController.rxAuthUser.value != null ? 'ログイン中' : '未ログイン',style: style,),
              onPressed: () {
                //処理なし
              },
            );
          }),
          //追加したかったらコメント消す
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.more_vert),
          // ),
        ],
      ),


      body: _screens[_selectedIndex], //画面配列からタップされたインデックスを指定して紐づく画面を表示
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //アクティブなページ番号(インデックス)を指定
        onTap: _onItemTapped, //タップされたアイコンのインデックスを取得（currentIndexとセット）
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: '注文'),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: '商品一覧'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: '会員情報'),
        ],
        type: BottomNavigationBarType.fixed, //アイコンの下にラベルをつけるタイプ
        backgroundColor: const Color.fromARGB(255, 72, 97, 121),
        selectedIconTheme:
            const IconThemeData(color: Colors.white), //選択されたアイコンの色
        unselectedIconTheme:
            const IconThemeData(color:  Color.fromARGB(255, 186, 185, 185)), //選択されてないアイコンの色
        selectedItemColor: Colors.white, //選択された文字の色
        unselectedItemColor: const Color.fromARGB(255, 186, 185, 185), //選択されてない文字の色
      ),
    );
  }
}
