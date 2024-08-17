import 'package:caraqueprod/infrastracture/firestore/firestore_client.dart';
import 'package:caraqueprod/models/result/result.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/typedefs/result_typedefs.dart';

class FirestoreRepository{
  //ドキュメント登録とエラーハンドリング
  FutureResult<bool> createDoc(DocRef ref,SDMap data) async{ //戻り値がturefaluseだからbool
    final client = FirestoreClient();
    try{
      await client.clientCreateDoc(ref, data);//ドキュメントを登録する
      return const Result.success(true);//trueは定数だからconstつける
    }catch(e){
      return const Result.failure();//失敗した時のインスタンスを返す
    }
  }

//ドキュメントの更新
  FutureResult<bool> updateDoc(DocRef ref,SDMap data) async{
    final client = FirestoreClient();
    try{
      await client.updateDoc(ref, data);
      return const Result.success(true);
    }catch(e){
      return const Result.failure();
  }
  }


//ドキュメント取得とエラーハンドリング
  FutureResult<Doc> getDoc(DocRef ref) async {
    final client = FirestoreClient();
    try {
      final Doc doc = await client.clientGetDoc(ref);//コレクション名がrefのdocumentSnapshot(フィールド値)がdocに渡る
      return Result.success(doc);//documentSnapshot(フィールド値)を返す
    }catch(e){
      return const Result.failure();//失敗した時のインスタンスを返す
    }
  }

  //ドキュメントの削除
  FutureResult<bool> deleteDoc(DocRef ref) async{
    final client = FirestoreClient();
    try{
      await client.deleteDoc(ref);
      return const Result.success(true);
    }catch(e){
      return const Result.failure();
    }

  }

}