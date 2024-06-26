// //ニックネーム編集画面
// //firebaseにデータを更新するからStatefulWidgetを継承
// import 'package:caraqueprod/controllers/edit_controller.dart';
// import 'package:caraqueprod/view/common/rounded_button.dart';
// import 'package:caraqueprod/view/common/text_field_container.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class EditScreen extends StatefulWidget{
//   const EditScreen ({super.key});
//   @override
//   State<EditScreen> createState()  => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen>{
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     Get.put(EditController());
//     return Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _titleWidget(),
//         _form(),
//         _positiveButton(),
//       ],
//     );
//   }

//   //タイトル関数
//   Widget _titleWidget(){
//     return const Text("ユーザー情報を編集",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),);
//   }

//   //入力フォーム関数
//   Widget _form(){
//     return Form(key:_formKey,child: _nameTextField(),);
//   }

//   //name入力をする関数
//   Widget _nameTextField(){
//     return TextFieldContainer(
//       child:TextFormField(
//       decoration: const InputDecoration(hintText: "ニックネーム"),
//       onSaved: EditController.to.setName,
//       validator: (value){
//         return value!.isEmpty ? "入力を行ってください" : null;
//       },
//       )
//     );
//   }

//     // 送信するボタン
//   Widget _positiveButton() {
//     return RoundedButton(
//       color: Colors.green, 
//       onPressed: (){
//         if(_formKey.currentState!.validate()){//ニックネームの入力
//           _formKey.currentState!.save();
//         }
//         EditController.to.onPositiveButtonPressed();
//       },
//       textValue: "更新する");
//   }

// }



