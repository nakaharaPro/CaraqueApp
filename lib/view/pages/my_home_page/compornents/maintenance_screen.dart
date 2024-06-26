//メンテナンス画面
import 'package:flutter/widgets.dart';

class MaintenanceScreen extends StatelessWidget{
const MaintenanceScreen({super.key});

@override
  Widget build(BuildContext context) {
    
    return const Align(//配置位置を指定するウィジェット
    
      alignment: Alignment.center,
      child:  Text("メンテナンス中です",style: TextStyle(fontSize: 25.0),),
    );
  }

}