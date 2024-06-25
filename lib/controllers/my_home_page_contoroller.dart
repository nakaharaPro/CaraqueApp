import 'package:caraqueprod/constant/my_home_page_constant.dart';
import 'package:caraqueprod/core/firesotre/doc_ref_core.dart';
import 'package:caraqueprod/models/public_user/public_user.dart';
import 'package:caraqueprod/repository/firestore_repository.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:get/get.dart';


class MyHomePageContoroller extends GetxController {
  final rxDoc = Rx<Doc?>(null);//作成したドキュメント情報を読み取った変数

  void onFloatingActionButtonpressed() async {
    await _createDoc();
  }

  Future<void> _createDoc() async {
    final repository = FirestoreRepository();
    const user = PublicUser(uid: "core2");
    final ref = DocRefCore.publicUserDocRef(user.uid);
    final data = user.toJson();//フィールド名と値の紐付け
    final result = await repository.createDoc(ref, data);

    result.when(success: (_) async {
     await  _readDoc(ref);
    },failure: (){
      UiHelper.showFlutterToast(MyHomePageConstant.createUserFailureMsg);
    });
  }


    Future<void> _readDoc (DocRef ref) async{
      final repository = FirestoreRepository();
      final result = await repository.getDoc(ref);//作成されたドキュメントを読み取る
      result.when(success: (doc){//()は引数で引数名は自由で中身はresultに代入された値
      rxDoc.value = doc;//引数をrxDocに代入
      UiHelper.showFlutterToast(MyHomePageConstant.readUserSuccessMsg);
      }, failure: (){
        UiHelper.showFlutterToast(MyHomePageConstant.readUserFailureMsg);
      });
    }
}
