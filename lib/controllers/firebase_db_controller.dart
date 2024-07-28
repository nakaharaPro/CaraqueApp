import 'package:caraqueprod/constant/my_home_page_constant.dart';
import 'package:caraqueprod/controllers/auth_controller.dart';
import 'package:caraqueprod/core/firesotre/doc_ref_core.dart';
import 'package:caraqueprod/models/public_user/public_user.dart';
import 'package:caraqueprod/repository/firestore_repository.dart';
import 'package:caraqueprod/typedefs/firestore_typedefs.dart';
import 'package:caraqueprod/ui_core/ui_helper.dart';
import 'package:caraqueprod/view/pages/my_home_page/compornents/main_screen/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FirebaseDbController extends GetxController {
  static FirebaseDbController get to => Get.find<FirebaseDbController>();
  final rxDoc = Rx<Doc?>(null); // 作成したドキュメント情報を読み取る変数

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String postNumber = "";

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

  Future<void> _createDoc() async {
    final authUser = AuthController.to.rxAuthUser.value;
    String mail = authUser!.email as String;
      final repository = FirestoreRepository();
      final user = PublicUser(
        uid: "テスト",
        first: firstName,
        last: lastName,
        phone: phoneNumber,
        post: postNumber,
      );
      final ref = DocRefCore.publicUserDocRef("会員情報",mail);
      final data = user.toJson();
      final result = await repository.createDoc(ref, data);

      result.when(success: (_) async {
        await _readDoc(ref);
        Get.toNamed(MainScreen.path);
      }, failure: () {
        UiHelper.showFlutterToast(MyHomePageConstant.createUserFailureMsg);
      });
    }
  

  Future<void> _readDoc(DocRef ref) async {
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(success: (doc) {
      rxDoc.value = doc;
      UiHelper.showFlutterToast(MyHomePageConstant.readUserSuccessMsg);
    }, failure: () {
      UiHelper.showFlutterToast(MyHomePageConstant.readUserFailureMsg);
    });
  }
}
