//商品一覧ページ
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget{
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text('商品一覧'),
      ),
      body: const Center(
          child: Text('商品一覧ページ', style: TextStyle(fontSize: 32.0))),
    );
    
  }
}