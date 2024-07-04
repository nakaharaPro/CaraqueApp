import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/constant/massage_const.dart';
import 'package:caraqueprod/view/common/%20product_description_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductIndividual1 extends StatelessWidget {
  const ProductIndividual1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.ColorGrey,
        body: Column(
          children: [
            //戻るアイコン
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                ),
                IconButton(
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),

            //表示内容
            const productDescriptionPage(
                image: 'assets/images/caraque2.jpg',
                title: "商品名2",
                description: MessageConst.productDiscription1)
          ],
        ),
      ),
    );
  }
}
