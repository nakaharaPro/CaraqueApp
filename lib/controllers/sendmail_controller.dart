import 'package:caraqueprod/constant/massage_const.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/components/order_page/order_complete_screen.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class SendmailController extends GetxController{
   static SendmailController get to => Get.find<SendmailController>();

   Future<void> sendEmail(String address, String fullName,Map<String, Map<String, int>>buyContentsInfo) async {
    String bodyMsg = orderMailMsgConst(fullName,buyContentsInfo);//body文の中身



    final Email email = Email(
      body: bodyMsg,
      subject: '注文の確定',
      recipients: ['marimo09300130@outlook.jp',address], // 送信先のメールアドレスを指定
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      
      Get.toNamed(OrderCompleteScreen.path);
    } catch (error) {
    UiHelper.showFlutterToast("注文に失敗しました。情報を見直してください");
    }
  }
}
