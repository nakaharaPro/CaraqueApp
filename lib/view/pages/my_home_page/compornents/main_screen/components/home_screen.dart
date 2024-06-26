//ホーム画面
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      appBar: AppBar(
        title: const Text('ho-mu'),
      ),
      body: const Center(
          child: Text('ホーム画面', style: TextStyle(fontSize: 32.0))),
    );
  }
}