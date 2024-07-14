import 'package:get/get.dart';

class OrderController extends GetxController{
  static OrderController get to => Get.find<OrderController>();

 Map<String, Map<String, int>> quantities = {};
 int totalAmount = 0;


Future<int> amountCalculation() async {
  quantities.forEach((key,value){ //keyに商品名 valueにMap
    print('Key : $key');
    if(key == '生デコホール' || key=='生チョコホール'){
      value.forEach((sizekey,numbervalue){//keyサイズ　valueに個数




      });

    }else{

    }
  

  });



  return totalAmount;


}


}