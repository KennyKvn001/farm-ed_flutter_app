// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:farm_ed/components/appbar.dart';
import 'package:farm_ed/components/blogs.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});
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
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                  child: Text(
                'Blogs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          const SizedBox(height: 800, child: MyBlogs()),
        ],
      ))),
    );
  }
}
