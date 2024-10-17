import 'package:farm_ed/components/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const Appbar(),
          Center(child: Text('Article Page Content')),
        ],
      ))),
    );
  }
}
