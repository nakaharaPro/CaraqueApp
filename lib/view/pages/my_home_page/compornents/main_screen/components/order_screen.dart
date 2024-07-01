//注文ページ
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget{
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('注文ページ'),
      ),
      body: const Center(
          child: Text('注文ページ画面', style: TextStyle(fontSize: 32.0))),
    );
  }
}