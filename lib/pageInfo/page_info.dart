//商品の情報はここで一元化
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';

class PageInfo{
  static LSDMap productState = [
   { 'page':"page1",'favoriteState':false,'title':"商品名1",'imagePath':'assets/images/caraque1.jpg'},
   { 'page':"page2",'favoriteState':false,'title':"商品名2",'imagePath':'assets/images/caraque2.jpg'},
    { 'page':"page3",'favoriteState':false,'title':"商品名3",'imagePath':'assets/images/caraque3.jpg'},
  ];

}