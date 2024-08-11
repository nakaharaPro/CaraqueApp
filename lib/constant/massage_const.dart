

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

String orderMailMsgConst(String fullName, Map<String, Map<String, int>> buyContentsInfo) {
  // メッセージの初期化
  String message = '$fullName様\n\nご注文の確認をお願い致します。\n注文内容に間違いなければ送信ボタンを押してください。\n\n';

  // buyContentsInfoの内容をメッセージに追加
  buyContentsInfo.forEach((product, sizes) {
    message += '$product:\n';
    sizes.forEach((size, quantity) {
      message += '  サイズ: $size, 数量: $quantity\n';
    });
    message += '\n';
  });

  return message;
}



