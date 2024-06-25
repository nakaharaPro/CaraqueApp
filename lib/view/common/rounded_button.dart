//ボタンデザインウィジェット
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      this.color,
      this.onPressed,
      required this.textValue,
      this.widthRate = 0.85})
      : super(key: key);

  final Color? color; //ボタンの色
  final Function()? onPressed;//イベント
  final String textValue; //ボタンのテキスト
  final double widthRate; //横幅変数

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //画面サイズ
    return SizedBox(
      //サイズ変更ウィジェット
      width: size.width * widthRate,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ElevatedButton(
          
         onPressed: onPressed,//イベント
            style: ElevatedButton.styleFrom(//ボタンの背景色
            backgroundColor: color,
          ),
          
          child: Text(
            textValue,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
