import 'package:caraqueprod/models/public_user/public_user.dart';

class MessageConst {
  //サインアップのメール認証文
  static const sendEmailcheckMassage = 
  '''確認メールを送信しました。
        
メールボックスを確認して、メールの内容からリンクを押下して認証を行ってください。

認証が完了したら、下の完了ボタンをタップしてください。''';

//注文の確認メッセージ
static const sendEmailorderMassage =
  '''注文内容の確認メールを送信しました。
        
メールボックスを確認して間違いなければ,

ホームに戻るボタンをタップしてください。

間違いがある場合は下記問い合わせ項目まで''';


//各商品の説明文
static const productDiscription1 = 
  '''
        
メールボックスよりメールの内容からリンクを押下して認証を行ってください。

認証が完了したら、下の完了ボタンをタップしてください。''';
}


//注文メール本文

class MessageConst2{
static String orderMailConst(String name) {
  return '''
$name様

ご注文の確認をお願いいたします。
''';
}
}

