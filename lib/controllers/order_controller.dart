import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find<OrderController>();

  Map<String, Map<String, int>> buyContentsInfo = {};
  Map<String, int> buyCountInfo = {};

  //購入リスト作成
  Map<String, Map<String, int>> buyInfo(
      Map<String, Map<String, int>> contentsInfo) {
    buyContentsInfo = {}; //初期化
    buyCountInfo = {};
    contentsInfo.forEach((key, value) {
      value.forEach((size, count) {
        if (count != 0) {//注文個数が1以上であれば
          buyCountInfo.addAll({size: count});
          buyContentsInfo.addAll({key: buyCountInfo});//mapに追加
        }
      });
      buyCountInfo = {};//繰り返すたびに初期化
    });

    if (buyContentsInfo.isEmpty) {
      return buyContentsInfo = {};//全て個数0なら空mapを返す
    }
    return buyContentsInfo;
  }


//金額計算
  int amountCalculation(Map<String, Map<String, int>> buyContentsList) {
    int totalAmount = 0; //初期化
    if (buyContentsList.isEmpty) {
      return totalAmount = 0;
    } else {
      buyContentsInfo.forEach((key, value) {
        //keyに商品名 valueにMap
        if (key == '生デコホール' || key == '生チョコホール') {
          value.forEach((sizekey, quantityvalue) {
            //keyサイズ　valueに個数
            if (sizekey == '12cm') {
              totalAmount = totalAmount + quantityvalue * 2350;
            }
            if (sizekey == '15cm') {
              totalAmount = totalAmount + quantityvalue * 3550;
            }
            if (sizekey == '18cm') {
              totalAmount = totalAmount + quantityvalue * 4500;
            }
            if (sizekey == '21cm') {
              totalAmount = totalAmount + quantityvalue * 5900;
            }
            if (sizekey == '24cm') {
              totalAmount = totalAmount + quantityvalue * 7100;
            }
          });
        }

        if (key == '栗チョコホール') {
          value.forEach((sizekey, quantityvalue) {
            //keyサイズ　valueに個数
            if (sizekey == '12cm') {
              totalAmount = totalAmount + quantityvalue * 2450;
            }
            if (sizekey == '15cm') {
              totalAmount = totalAmount + quantityvalue * 3700;
            }
            if (sizekey == '18cm') {
              totalAmount = totalAmount + quantityvalue * 4700;
            }
            if (sizekey == '21cm') {
              totalAmount = totalAmount + quantityvalue * 6150;
            }
            if (sizekey == '24cm') {
              totalAmount = totalAmount + quantityvalue * 7400;
            }
          });
        }

        if (key == 'パリパリショコラ') {
          value.forEach((sizekey, quantityvalue) {
            //keyサイズ　valueに個数
            if (sizekey == '12cm') {
              totalAmount = totalAmount + quantityvalue * 2450;
            }
            if (sizekey == '15cm') {
              totalAmount = totalAmount + quantityvalue * 3700;
            }
            if (sizekey == '18cm') {
              totalAmount = totalAmount + quantityvalue * 4700;
            }
            if (sizekey == '21cm') {
              totalAmount = totalAmount + quantityvalue * 6150;
            }
            if (sizekey == '24cm') {
              totalAmount = totalAmount + quantityvalue * 7400;
            }
          });
        }
      });
    }

    return totalAmount;
  }
}
