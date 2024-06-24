import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        try{
          final data = {"mas":"成功"};
          await FirebaseFirestore.instance.collection('data').doc().set(data);
        }catch(e){
          debugPrint("失敗");
        }
      },),
      body: Center(
        child: Text(
          'Hello ${F.title}',
        ),
      ),
    );
  }
}
