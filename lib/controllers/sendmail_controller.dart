import 'package:caraqueprod/constant/massage_const.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class SendmailController extends GetxController{
   static SendmailController get to => Get.find<SendmailController>();

   Future<void> sendEmail(String address, String fullName,Map<String, Map<String, int>>buyContentsInfo) async {
    String bodyMsg = orderMailMsgConst(fullName);

    final Email email = Email(
      body: bodyMsg,
      subject: '注文の確定',
      recipients: ['aws09300130@gmail.com',address], // 送信先のメールアドレスを指定
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      UiHelper.showFlutterToast("注文が確定しました");
      
    } catch (error) {
    UiHelper.showFlutterToast("注文に失敗しました。情報を見直してください");
    }
  }

}