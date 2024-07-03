import 'package:caraqueprod/constant/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductIndividual1 extends StatelessWidget {
  const ProductIndividual1({super.key});
  static const path = "/Ind1";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightSize = size.height * 0.5;

    return SafeArea(
      
      child: Scaffold(
        backgroundColor: ColorsConst.ColorGrey,
        body: Column(
          children: [
            ElevatedButton(onPressed:(){
               Get.back();
               },
          
             child: const Text("←")
            ),
           
            SizedBox(
              height: heightSize,
              child:Stack(
              children: [
             Padding(
              padding: const EdgeInsets.all(10.0),
             child: Container(
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0), //左上角
                    topRight: Radius.circular(40.0), //右上角,
                    bottomRight: Radius.circular(40.0), //右下角
                    bottomLeft: Radius.circular(40.0), //左下角
                    ),
                    image:DecorationImage(
                      image: AssetImage('assets/images/caraque1.jpg'),
                      fit: BoxFit.cover,
                    ),
              ),
              ),
             ),
              ],
              ),
            ),
   
          
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                "説明", //商品説明
                overflow: TextOverflow.ellipsis,
                maxLines: 1, //表示行数
                style: TextStyle(fontSize: 16),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
