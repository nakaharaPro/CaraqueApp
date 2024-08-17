

import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/core/firesotre/doc_ref_core.dart';
import 'package:caraqueprod/models/favorite_list/favorite_list.dart';
import 'package:caraqueprod/models/public_user/public_user.dart';
import 'package:caraqueprod/repository/auth_repository.dart';
import 'package:caraqueprod/repository/firestore_repository.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:caraqueprod/view/pages/my_home_page/error_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FirebaseDbController extends GetxController {
  static FirebaseDbController get to => Get.find<FirebaseDbController>();
  final rxDoc = Rx<Doc?>(null); // 新規会員登録時の情報

  bool authBool =AuthController.to.rxAuthUser.value != null ? true : false; //ログイン中かの有無

  Map<String, dynamic>? publicUserInfo; //新規登録もしくはログイン中のメールアドレスから取得した情報

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String postNumber = "";

  LSDMap? readDocPageList=[{}]; //出力ページ情報

  void setFirstName(String? value) {
    if (value == null) return;
    firstName = value;
    debugPrint(firstName);
  }

  void setLastName(String? value) {
    if (value == null) return;
    lastName = value;
    debugPrint(lastName);
  }

  void setPhoneNumber(String? value) {
    if (value == null) return;
    phoneNumber = value;
    debugPrint(phoneNumber);
  }

  void setPostNumber(String? value) {
    if (value == null) return;
    postNumber = value;
    debugPrint(postNumber);
  }

  void onCreateFirebase() async {
    await _createDoc();
  }

//firesotre登録
  Future<void> _createDoc() async {
    final authUser = AuthController.to.rxAuthUser.value;
    String mail = authUser!.email as String;
    DateTime nowtime = DateTime.now();
    String name = firstName + lastName;
    final repository = FirestoreRepository();
    final user = PublicUser(
      nameFull: name,
      inputDate: nowtime,
      nameFirst: firstName,
      nameLast: lastName,
      phone: phoneNumber,
      post: postNumber,
    );
    final ref = DocRefCore.publicUserDocRef("会員情報", mail);
    final data = user.toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) async {

      await _readDoc(ref);
    }, failure: () {
      Get.toNamed(ErrorPage.path);
    });
  }
  

//登録後の読み込み確認
  Future<void> _readDoc(DocRef ref) async {
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(
        success: (doc) {
          rxDoc.value = doc;
          publicUserInfo = doc.data();
          Get.toNamed(MainScreen.path);
          UiHelper.showFlutterToast("会員登録が完了しました");
        },
        failure: () {});
  }

//ログイン中のメールアドレスからdocを持ってくる
  Future<void> emailReadDoc(String email) async {
    final ref = DocRefCore.publicUserDocRef("会員情報", email);
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(
        success: (doc) {
          publicUserInfo = doc.data();
        },
        failure: () {});
  }

  //ユーザー削除
  //database側
  Future<void> deleteUser() async {
    final authUser = AuthController.to.rxAuthUser.value;
    final repository = FirestoreRepository();
    if (authUser == null) {
      return;
    }
    final mail = authUser.email!;
    final ref = DocRefCore.publicUserDocRef("会員情報", mail);
    final result = await repository.deleteDoc(ref); //dbの削除
    result.when(success: (_) {
      _deleteAutuUser(authUser); //auth側の削除
      AuthController.to.rxAuthUser.value = null;
    }, failure: () {
    });
  }
  //auth側
  Future<void> _deleteAutuUser(User authUser) async {
    final repository = AuthRepository();
    final result = await repository.delete(authUser);
     result.when(success: (_) {
      UiHelper.showFlutterToast("ユーザーを削除しました");
      _deleteAutuUser(authUser); //auth側の削除
      if(
      AuthController.to.rxAuthUser.value != null){
        AuthController.to.rxAuthUser.value = null;
      }
    }, failure: () {
      UiHelper.showFlutterToast("ユーザーの削除に失敗しました");
    });
  }



//お気に入りリストの登録
void onfavoriteList(LSDMap pageList) async {
    await _creatFavoriteList(pageList);
  }



//お気に入りリスト登録
  Future<void> _creatFavoriteList(LSDMap pageList) async {
    final authUser = AuthController.to.rxAuthUser.value;
    String mail = authUser!.email as String;
   
      final repository = FirestoreRepository();
      final list = FavoriteList(
        pageList: pageList,
      );
      final ref = DocRefCore.publicUserDocRef("会員情報",mail);
      final data = list.toJson();
      final result = await repository.updateDoc(ref, data);
      result.when(success: (_) async {
        await _readFavoriteList(ref);
      }, failure: () {
         Get.toNamed(ErrorPage.path);
      });
    }
  
//登録後の読み込み確認
  Future<void> _readFavoriteList(DocRef ref) async {
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(success: (doc) {
     print("成功");
     Map<String,dynamic>? test= doc.data();
     readDocPageList = test!['pageList'];
    
    }, failure: () {
    print("失敗");
    });
  }


}
