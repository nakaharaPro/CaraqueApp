//repositoryクラスで使用する
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';

class FirestoreClient{
  Future<void> clientCreateDoc(DocRef ref,SDMap data) async => await ref.set(data);
  //内容は.doc(ref).set(data);でドキュメントを登録する

   Future<void> updateDoc(DocRef ref,SDMap data) async => await ref.update(data);

  FutureDoc clientGetDoc(DocRef ref) async => await ref.get();
  //内容は.doc(ref).get()でdocumentSnapshot(フィールド値)を取得する


 

}