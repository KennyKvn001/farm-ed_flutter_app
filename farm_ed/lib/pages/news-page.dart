import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article Page')),
      body: const Center(child: Text('Article Page Content')),
    );
  }
}
