import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductIndividual1 extends StatelessWidget{
  const ProductIndividual1 ({super.key});
     static const path = "/Ind1";


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double heightSize = size.height * 0.5; 

    return SafeArea(
      child: Scaffold(  
      body:Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: heightSize,
                  color: Colors.black,
                
                ),
                   Container(
                  height: heightSize*0.7,
                  color: Colors.orange,
                
                ),
                Container(
                  child: 
             SizedBox(
               height:heightSize * 0.2,
               child: AspectRatio(
                 aspectRatio: 16 / 16, //画像比率 下にメッセージを配置する場合は16/9
                 child: Ink.image(
                   image: const AssetImage('assets/images/caraque1.jpg'), //画像URL
                   fit: BoxFit.cover,
                 ),
               ),
             ),
                ),
               
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                "説明",//商品説明
                overflow: TextOverflow.ellipsis,
                maxLines: 1,//表示行数
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

}