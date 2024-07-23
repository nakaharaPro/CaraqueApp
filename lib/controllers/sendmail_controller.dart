import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class SendmailController extends GetxController{
   static SendmailController get to => Get.find<SendmailController>();

   Future<void> sendEmail(String Address) async {

    final Email email = Email(
      body: '〇〇様',
      subject: '注文の確定',
      recipients: ['aws09300130@gmail.com',Address], // 送信先のメールアドレスを指定
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