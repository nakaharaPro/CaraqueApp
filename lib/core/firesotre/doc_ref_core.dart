
//col_ref_core.dartのコレクション名を使用して、引数からドキュメント名指定


import 'package:caraqueprod/core/firesotre/col_ref_core.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';

class DocRefCore{
  static DocRef publicUserDocRef(String mail,String uid) => ColRefCore.publicUsersColRef(mail).doc(uid);
}