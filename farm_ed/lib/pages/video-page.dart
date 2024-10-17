import 'package:farm_ed/components/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          const Appbar(),
          Center(child: Text('Videos Page Content')),
        ],
      ))),
    );
  }
}
