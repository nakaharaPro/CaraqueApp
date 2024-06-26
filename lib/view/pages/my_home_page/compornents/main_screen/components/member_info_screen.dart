//会員ページ

import 'package:flutter/material.dart';

class MemberInfoScreen extends StatelessWidget{
  const MemberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('会員情報'),
      ),
      body: const Center(
          child: Text('会員ページ画面', style: TextStyle(fontSize: 32.0))),
    );
  }
}