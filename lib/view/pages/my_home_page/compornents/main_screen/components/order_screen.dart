import 'package:caraqueprod/constant/colors_const.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderScreen> {
  final List<String> products = ['生デコホール', '生チョコホール', '栗チョコホール', 'パリパリショコラ'];
  final Map<String, Map<String, int>> quantities = {};
  final List<String> sizes = ['12cm', '15cm', '18cm','21cm', '24cm'];

  @override
  void initState() {
    super.initState();
    for (var product in products) {
      quantities[product] = {'小': 0, '中': 0, '大': 0};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        title: const Text("ホールケーキ注文",style: TextStyle(fontSize:25.0,color: Colors.white),textAlign: TextAlign.left),
        toolbarHeight: 40.0,//AppBarの高さ
        backgroundColor:ColorsConst.ColorGrey,//色
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(products[index]),
            children: sizes.map((size) {
              return ListTile(
                title: Text(size),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantities[products[index]]![size]! > 0) {
                            quantities[products[index]]![size] =
                                quantities[products[index]]![size]! - 1;
                          }
                        });
                      },
                    ),
                    Text(quantities[products[index]]![size]!.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantities[products[index]]![size] =
                              quantities[products[index]]![size]! + 1;
                        });
                      },
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: const Text('注文する'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('注文内容'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: quantities.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop(); // ポップアップを閉じる
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
