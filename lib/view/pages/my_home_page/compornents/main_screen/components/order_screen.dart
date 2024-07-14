import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/constant/hole_products_discription.dart';
import 'package:caraqueprod/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderScreen> {
  final List<String> products = ['生デコホール', '生チョコホール', '栗チョコホール', 'パリパリショコラ'];
  final List<String> holeDiscription =
      HoleProductsDiscription.holeProductDescription; //商品説明
  final Map<String, Map<String, int>> quantities = {};
  final List<String> sizes = ['12cm', '15cm', '18cm', '21cm', '24cm'];
  final formatter = NumberFormat("#,###");


  @override
  void initState() {
    super.initState();
    for (var product in products) {
      //productsリストから1つずつproductに入れ、length分繰り返し
      quantities[product] = {
        '12cm': 0,
        '15cm': 0,
        '18cm': 0,
        '21cm': 0,
        '24cm': 0
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController.to;
    int? totalAmount;
    String outputTotalAmount = '0';

    return Scaffold(
      appBar: AppBar(
        title: const Text("ホールケーキ注文",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
            textAlign: TextAlign.left),
        toolbarHeight: 40.0, //AppBarの高さ
        backgroundColor: ColorsConst.ColorGrey, //色
      ),
      body: ListView.builder(
        itemCount: products.length, //商品名レングス
        itemBuilder: (context, index) {
          return ExpansionTile(
            //開閉
            title: Column(
              children: [
                Text(
                  products[index],
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(holeDiscription[index],
                    style: const TextStyle(fontSize: 10.0)),
              ],
            ),
            children: sizes.map((size) {
              //mapはsized配列から1つ1つ要素を取り出し(size)に渡して処理する
              return ListTile(
                title: Text(size),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min, //右端に配置
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove), //マイナスボタン
                      onPressed: () {
                        setState(() {
                          //マイナス処理
                          if (quantities[products[index]]![size]! > 0) {
                            quantities[products[index]]![size] =
                                quantities[products[index]]![size]! - 1;
                          }
                        });
                      },
                    ),

                    Text(quantities[products[index]]![size]!.toString()), //カウント

                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          //プラス処理
                          quantities[products[index]]![size] =
                              quantities[products[index]]![size]! + 1;
                        });
                      },
                    ),
                  ],
                ),
              );
            }).toList(), //ListTitleのMapをListに格納する[Map,Map,Map]
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child:const Text('注文する'),

            onPressed: () {
              orderController.quantities = quantities;
              totalAmount = orderController.amountCalculation();//合計金額計算
              outputTotalAmount = formatter.format(totalAmount);
              //合計金額の処理
              showDialog(
                //ダイアログ表示
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('注文内容'),
                  content: Text('合計金額 : ¥$outputTotalAmount'),
                  // content: Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: quantities.entries.map((entry) {
                  //     return Column(
                  //       children: [
                  //         Text(entry.key),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: entry.value.entries
                  //               .map((sizeEntry) => Text(
                  //                   '${sizeEntry.key}: ${sizeEntry.value}'))
                  //               .toList(),
                  //         ),
                  //       ],
                  //     );
                  //   }).toList(),
                  // ),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        //コントローラーに入力値を格納して計算を行い、別画面へ合計金額、注文内容を記載したメールを両者に飛ばす

                        Navigator.of(context).pop(); // ダイアログを閉じる
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
