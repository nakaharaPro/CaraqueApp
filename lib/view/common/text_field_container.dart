//入力フォームのデザインのウィジェット
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldContainer extends StatelessWidget{
  const TextFieldContainer ({Key? key,required this .child}) : super(key: key);

final Widget child;//TextFildContainerウィジェットでchildを指定をした中身を受けとる、コンストラクタから

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16.0),
    child: Container(
      decoration: BoxDecoration(
        border:Border.all(),//ボーダー
        borderRadius: BorderRadius.circular(8.0),
       ),
       child: child,//childの中身をCintainerウィジェットのchildに指定
      ),
    );
  }
}