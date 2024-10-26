import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(children: [
      SizedBox(
        height: 10,
      ),
      Row(
        children: [TextField(), Icon(Icons.search)],
      )
    ]));
  }
}
