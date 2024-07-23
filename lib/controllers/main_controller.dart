//ログイン後のmain画面コントローラー
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/core/firesotre/doc_ref_core.dart';
import 'package:caraqueprod/models/public_user/public_user.dart';
import 'package:caraqueprod/repository/firestore_repository.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:get/get.dart';


class MainController extends GetxController{
  static MainController get to => Get.find<MainController>();
  final rxPublicUser = Rx<PublicUser?>(null);//ログイン中のユーザー情報
  @override
  void onInit() async {
    await _manageUserInfo();
   
    super.onInit();
  }


  Future<void> _manageUserInfo() async{
    final authUser = AuthController.to.rxAuthUser.value;
    if(authUser == null) return ;
    final repository = FirestoreRepository();
    final uid = authUser.uid;
    final email = authUser.email;
    final ref = DocRefCore.publicUserDocRef(authUser.email as String,authUser.uid);
    final result = await repository.getDoc(ref);

    result.when(success: (res) async {
      final json = res.data();
    if(res.exists && json != null){//リファレンス先にデータ(全フィールド)が存在するなら
    rxPublicUser.value = PublicUser.fromJson(json);//作成済みなら読み取り
    }
    else{
      //未作成ならユーザー作成する
      await _createPublicUser(ref,uid);
    }
    }, failure: (){
      UiHelper.showFlutterToast("ユーザーの読み取りが失敗しました");

    });
  }



  Future<void> _createPublicUser(DocRef ref , String uid) async{
    final repository = FirestoreRepository();
    final newPublicUser = PublicUser(uid:uid);
    final json= newPublicUser.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(success: (_){
      rxPublicUser.value = newPublicUser;
      UiHelper.showFlutterToast("ユーザーの作成が成功しました");
    }, failure: (){
      UiHelper.showFlutterToast("ユーザーの作成が失敗しました");
    });

  }


}