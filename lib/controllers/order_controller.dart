import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find<OrderController>();

  Map<String, Map<String, int>> buyContentsInfo = {};

  //
  Map<String, Map<String, int>> buyInfo(Map<String, Map<String, int>> contentsInfo) {
    contentsInfo.entries.map((entry) {
      entry.value.entries.map((countEntory) {
        if (countEntory.value != 0) {
          buyContentsInfo.addAll({entry.key: entry.value});
        }
      });
    });
    if(buyContentsInfo.isEmpty){
      return buyContentsInfo={};
    }

    return buyContentsInfo;
  }

//金額計算
  int amountCalculation() {
    int totalAmount = 0; //初期化
    buyContentsInfo.forEach((key, value) {
      //keyに商品名 valueにMap
      print('Key : $key');
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

    return totalAmount;
  }
}
