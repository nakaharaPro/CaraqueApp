//リポジトリで使用
import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  Future<UserCredential> createUserWidthEmailAndPassword(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential;
  }
  //firebaseAuthenticateに新規登録するメソッド

  Future<UserCredential> signInWidthEmailAndPassword(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }
  //firebaseAuthenticateにサインインするメソッド

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  //サインアウトメソッド

  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }
//認証メール送信メソッド


//ユーザー削除メソッド
 Future<void> delte(User user) async {
    await user.delete();
  }



}
