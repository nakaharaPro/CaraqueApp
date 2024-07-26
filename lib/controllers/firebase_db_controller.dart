import 'package:caraqueprod/constant/my_home_page_constant.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/core/firesotre/doc_ref_core.dart';
import 'package:caraqueprod/models/public_user/public_user.dart';
import 'package:caraqueprod/repository/firestore_repository.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/auth_screen/input_info/input_info.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class FirebaseDbController extends GetxController {
   static FirebaseDbController get to => Get.find<FirebaseDbController>();
  final rxDoc = Rx<Doc?>(null);//作成したドキュメント情報を読み取った変数

    String firstName = "";
    String lastName = "";
    int phoneNumber =0;
    int postNumber =0;

    void setFirstName(String? value) {
    //null許容
    if (value == null) return;
    firstName = value;
    debugPrint(firstName);
  }

  void setLastName(String? value) {
    if (value == null) return;
    lastName= value;
    debugPrint(lastName);
  }




  void oncreateFirebase( Map<String,dynamic> inputInfo) async {
    final String first = inputInfo['first'];

    await _createDoc(first);
  }

//クリエイトDB
  Future<void> _createDoc(String first) async {
    final authuser = AuthController.to.rxAuthUser.value;

    if(authuser==null){
      UiHelper.showFlutterToast("会員登録を先に行なってください");
    }else{
    final repository = FirestoreRepository();
    const user = PublicUser(uid: "test",first:, last:,phone: ,post:);
    final ref = DocRefCore.publicUserDocRef(authuser.email as String,user.uid);//コレクションとドキュメント名の指定
    final data = user.toJson();//フィールド名と値の紐付け
    final result = await repository.createDoc(ref, data);

    result.when(success: (_) async {
     await  _readDoc(ref);
    },failure: (){
      UiHelper.showFlutterToast(MyHomePageConstant.createUserFailureMsg);
    });
  }
  }
  


//読み込み
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
