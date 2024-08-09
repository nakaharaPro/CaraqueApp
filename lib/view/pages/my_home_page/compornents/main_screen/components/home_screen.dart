// ホーム画面
import 'package:caraqueprod/view/common/top_home_page.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topHome(context),
           // _topHome2(context),
          ],
        ),
      ),
    );
  }

  Widget _topHome(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.935,//ディスプレイのheightを高さに設定

      child: const TopHomePage(),//topPage
    );
  }


//   Widget _topHome2(BuildContext context) {
//   final height = MediaQuery.of(context).size.height;
//   final width = MediaQuery.of(context).size.width;
  
//   return SizedBox(
//     height: height, // ディスプレイのheightを高さに設定
//     child: Stack(
//       children: [
//         Positioned(
//           left: -width * 0.1,//円の配置
//           child: ClipOval(
//             child: Container(
//               height: height * 0.5, //円の大きさ ここで高さと幅を調整して円形にする
//               width: height * 0.5, //円の大きさ 円形にするため高さと幅を同じにする
//              decoration: const  BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/caraque2.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: height * 0.4,
//           left: width * 0.2,
//           child: ClipOval(
//             child: Container(
//               height: height * 0.4, // ここで高さと幅を調整して画像を縮小
//               width: height * 0.4, // 円形にするため高さと幅を同じにする
//               decoration:const  BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/caraque3.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: height * 0.7,
//           child: ClipOval(
//             child: Container(
//               height: height * 0.3, // ここで高さと幅を調整して円形にする
//               width: height * 0.3, // 円形にするため高さと幅を同じにする
//              decoration:const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/caraque5.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
}