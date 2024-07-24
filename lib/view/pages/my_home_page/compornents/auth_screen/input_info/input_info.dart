import 'package:caraqueprod/controllers/firebase_db_controller.dart';
import 'package:flutter/material.dart';


class InputInfo extends StatelessWidget {
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
  final _formKey = GlobalKey<FormState>();

  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _postalCodeController = TextEditingController();

  Map<String,dynamic> inputInfo ={"first":"","last":"","phone":0,"post":0};


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
       print(inputInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseDbController = FirebaseDbController.to;
    return Scaffold(
      appBar: AppBar(
        title: const Text('会員情報入力'),
      ),
      body: Padding(
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
                  //これやっていく
                  inputInfo.addAll({"first":value});
                  return null;
                },
              ),
              TextFormField(
                controller: _firstNameController,
                decoration:const InputDecoration(labelText: '名'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '名を入力してください';
                  }
                   inputInfo.addAll({"last":value});
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration:const  InputDecoration(labelText: '電話番号(ハイフンなし)'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '電話番号を入力してください';
                  }
                  if (!RegExp(r'^\d{10,11}$').hasMatch(value)) {
                    return '正しい電話番号を入力してください';
                  }
                   inputInfo.addAll({"phone":value});
                  return null;
                },
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration:const  InputDecoration(labelText: '郵便番号'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '郵便番号を入力してください';
                  }
                  if (!RegExp(r'^\d{7}$').hasMatch(value)) {
                    return '正しい郵便番号を入力してください';
                  }
                   inputInfo.addAll({"post":value});
                  return null;
                },
              ),


              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('送信'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
