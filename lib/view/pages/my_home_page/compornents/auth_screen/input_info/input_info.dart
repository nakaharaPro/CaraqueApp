import 'dart:ui';

import 'package:caraqueprod/constant/colors_const.dart';
import 'package:caraqueprod/controllers/firebase_db_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

//会員情報入力ページ
class InputInfo extends StatelessWidget {
  const InputInfo({super.key});
  static const path = "/menber_info_add"; //パス
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InputFormScreen(),
    );
  }
}

class InputFormScreen extends StatefulWidget {
  @override
  _InputFormScreenState createState() => _InputFormScreenState();
}

class _InputFormScreenState extends State<InputFormScreen> {
  final firebaseDbController = FirebaseDbController.to;
  final _formKey = GlobalKey<FormState>();

  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _postalCodeController = TextEditingController();

  @override
  void dispose() {
    _lastNameController.dispose();
    _firstNameController.dispose();
    _phoneNumberController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      firebaseDbController.onCreateFirebase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('会員情報入力'),
      ),
      body:
      Column(
        children: [
          _memberInfoTitle(),
          Expanded(child: _memberInfo()),
        ],
      ),
    );
  }

  Widget _memberInfoTitle() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("メール認証が確認できました。",style: TextStyle(fontSize: 20),),
          Text("以下に会員情報を入力してください。",style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }

  Widget _memberInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: '姓'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '姓を入力してください';
                }
                firebaseDbController.setFirstName(value);
                return null;
              },
            ),
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: '名'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '名を入力してください';
                }
                firebaseDbController.setLastName(value);
                return null;
              },
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: '電話番号(ハイフンなし)'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '電話番号を入力してください';
                }
                if (!RegExp(r'^\d{10,11}$').hasMatch(value)) {
                  return '正しい電話番号を入力してください';
                }
                firebaseDbController.setPhoneNumber(value);
                return null;
              },
            ),
            TextFormField(
              controller: _postalCodeController,
              decoration: const InputDecoration(labelText: '郵便番号'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '郵便番号を入力してください';
                }
                if (!RegExp(r'^\d{7}$').hasMatch(value)) {
                  return '正しい郵便番号を入力してください';
                }
                firebaseDbController.setPostNumber(value);
                return null;
              },
            ),
           const SizedBox(height: 20),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: ColorsConst.constColorGrey,
              ),
              onPressed: _submitForm,
              child:const  Text('登録',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
