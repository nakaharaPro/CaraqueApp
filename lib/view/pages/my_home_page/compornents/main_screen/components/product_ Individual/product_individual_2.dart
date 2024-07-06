import 'package:caraqueprod/MapState/page_info.dart';
import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/constant/massage_const.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/view/common/product_description_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductIndividual1 extends StatelessWidget {
  const ProductIndividual1({super.key});



  @override
  Widget build(BuildContext context) {
  final  LSDMap pagestate = PageInfo.productState;
  final SDMap productState = pagestate[2];
  final String title= productState['title'] ?? '';
  final String imagePath= productState['imagePath'] ?? '';


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
            ProductDescriptionPage(
                imagePath: imagePath,
                titleName: title,
                description: MessageConst.productDiscription1)
          ],
        ),
      ),
    );
  }
}
