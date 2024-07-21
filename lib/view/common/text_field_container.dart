//入力フォームのデザインのウィジェット
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldContainer extends StatelessWidget{
  const TextFieldContainer ({super.key,required this .child});

final Widget child;//TextFildContainerウィジェットでchildを指定をした中身を受けとる、コンストラクタから

  @override
  Widget build(BuildContext context) {
    return
       Container(
      
      decoration: BoxDecoration(
        
        border:Border.all(),//ボーダー
        borderRadius: BorderRadius.circular(8.0),
       ),
       margin:const EdgeInsets.only(bottom: 10.0,left: 20.0,right: 20.0),
       child: child,//childの中身をCintainerウィジェットのchildに指定
    );
  }
}