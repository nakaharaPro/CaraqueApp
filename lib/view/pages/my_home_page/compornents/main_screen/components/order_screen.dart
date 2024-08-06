
import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/constant/hole_products_discription.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/controllers/firebase_db_controller.dart';
import 'package:caraqueprod/controllers/order_controller.dart';
import 'package:caraqueprod/controllers/sendmail_controller.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/components/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderScreen> {
  // コントローラーの定義
  final orderController = OrderController.to;
  final sendEmailController = SendmailController.to;
  final authController = AuthController.to;
  final firebaseDbController = FirebaseDbController.to;

  String authEmail = '';
  String memberFullName = '';

  @override
  void initState() {
    super.initState();

    // ログインユーザーのフルネームの取得
    authEmail = authController.rxAuthUser.value?.email ?? '';

    if (authEmail.isNotEmpty) {
      firebaseDbController.emailReadDoc(authEmail);
      memberFullName = firebaseDbController.publicUserInfo?['nameFull'] ?? '';
    }

    // 商品情報の初期化
    for (var product in products) {
      contentsInfo[product] = {
        '12cm': 0,
        '15cm': 0,
        '18cm': 0,
        '21cm': 0,
        '24cm': 0
      };
    }
  }

  // 商品情報
  final formatter = NumberFormat("#,###"); // 円フォーマット
  final List<String> products = ['生デコホール', '生チョコホール', '栗チョコホール', 'パリパリショコラ'];
  final List<String> holeDiscription = HoleProductsDiscription.holeProductDescription; // 商品説明
  final List<String> amountList = HoleProductsDiscription.amountList; // 価格リスト
  final Map<String, Map<String, int>> contentsInfo = {};
  final List<String> sizes = ['12cm', '15cm', '18cm', '21cm', '24cm'];
  Map<String, Map<String, int>> buyContentsInfo = {}; // 購入商品情報

  @override
  Widget build(BuildContext context) {
    int totalAmount;
    String outputTotalAmount = '0';

    return Scaffold(
      appBar: AppBar(
        title: const Text("ホールケーキ注文",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
            textAlign: TextAlign.left),
        toolbarHeight: 40.0, // AppBarの高さ
        backgroundColor: ColorsConst.constColorGrey, // 色
      ),
      body: ListView.builder(
        itemCount: products.length, // 商品名レングス
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Column(
              children: [
                Text(
                  products[index],
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(holeDiscription[index],
                    style: const TextStyle(fontSize: 10.0)),
                Text(amountList[index],
                    style: const TextStyle(fontSize: 10.0)),
              ],
            ),
            children: sizes.map((size) {
              return ListTile(
                title: Text(size),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min, // 右端に配置
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove), // マイナスボタン
                      onPressed: () {
                        setState(() {
                          // マイナス処理
                          if (contentsInfo[products[index]]![size]! > 0) {
                            contentsInfo[products[index]]![size] =
                                contentsInfo[products[index]]![size]! - 1;
                          }
                        });
                      },
                    ),
                    Text(contentsInfo[products[index]]![size]!
                        .toString()), // カウント
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          // プラス処理
                          contentsInfo[products[index]]![size] =
                              contentsInfo[products[index]]![size]! + 1;
                        });
                      },
                    ),
                  ],
                ),
              );
            }).toList(), // ListTitleのMapをListに格納する[Map,Map,Map]
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsConst.constColorGrey,
            ),
            child: const Text(
              '注文する',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              buyContentsInfo = orderController.buyInfo(contentsInfo); // 注文したリストの作成
              totalAmount = orderController.amountCalculation(buyContentsInfo); // 合計金額計算
              outputTotalAmount = formatter.format(totalAmount); // 円フォーマット

              // タイアログ表示
              if (buyContentsInfo.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: Text("商品を選択してください"),
                  ),
                );
              } else {
                // 合計金額の処理
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('注文内容'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: buyContentsInfo.entries.map((entry) {
                            return Column(
                              children: [
                                Text(entry.key),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: entry.value.entries
                                      .map((sizeEntry) => Text(
                                          '${sizeEntry.key}: ${sizeEntry.value}'))
                                      .toList(),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        Text('合計金額 : ¥$outputTotalAmount',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        const Text(
                          '注文には事前にログイン(新規会員登録)が必要となります。',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ],
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: const Text('戻る'),
                            onPressed: () {
                              Navigator.of(context).pop(); // ダイアログを閉じる
                            },
                          ),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // ダイアログを閉じる

                              if (authEmail.isEmpty) {
                                Get.toNamed(LoginScreen.path);
                              } else {
                                sendEmailController.sendEmail(
                                  authEmail,
                                  memberFullName,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
