import 'package:farm_ed/components/appbar.dart';
import 'package:farm_ed/components/news.dart';
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
          Container(
            decoration: BoxDecoration(color: Colors.green[700]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                  child: Text(
                'Newsletters',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(height: 800, child: News()),
        ],
      ))),
    );
  }
}
