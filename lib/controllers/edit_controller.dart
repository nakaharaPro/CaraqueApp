// import 'package:caraqueprod/controllers/auth_controller.dart';
// import 'package:caraqueprod/controllers/main_controller.dart';
// import 'package:caraqueprod/core/firesotre/doc_ref_core.dart';
// import 'package:caraqueprod/repository/firestore_repository.dart';
// import 'package:caraqueprod/ui_core/ui_helper.dart';
// import 'package:get/get.dart';


// class EditController extends GetxController {
//   static EditController get to => Get.find<EditController>();
//   String name = "";//初期値
//   void setName(String? value) {
//     if (value == null) return;
//     name = value;
//   }
 
//   void onPositiveButtonPressed() async {//ボタン押下処理
//     if (name.isEmpty) return;//変数が空だったら中断
//     await _updatePublicUser();
//   }
 
//  //nameフィールド変数更新
//   Future<void> _updatePublicUser() async {
//     final repository = FirestoreRepository();
//     final uid = AuthController.to.rxAuthUser.value!.uid;
//     final mail = AuthController.to.rxAuthUser.value!.email;
//     final ref = DocRefCore.publicUserDocRef(mail as String,uid);
//     final data = {
//       "name": name,//nameフィールドを紐付ける
//     };
//     final result = await repository.updateDoc(ref, data);
//     result.when(success: (_) {
//       final oldPublicUser = MainController.to.rxPublicUser.value;//コントローラーのonInitが呼び出される
//       if (oldPublicUser == null) return;
//       final newPublicUser = oldPublicUser.copyWith( // 一部分のみ更新
//         name: name,
//       );
//       MainController.to.rxPublicUser.value = newPublicUser; // 新しく更新
//       UiHelper.showFlutterToast("ユーザーの更新が成功しました");
//     }, failure: () {
//       UiHelper.showFlutterToast("ユーザーの更新が失敗しました");
//     });
//   }
// }