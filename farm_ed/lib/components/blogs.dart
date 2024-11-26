import 'dart:convert';
import 'package:farm_ed/pages/blog_detials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyBlogs extends StatefulWidget {
  const MyBlogs({super.key});

  @override
  State<MyBlogs> createState() => _MyBlogsState();
}

class _MyBlogsState extends State<MyBlogs> {
  List<dynamic> _blogs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('image/blog.json');
      final data = await json.decode(response);
      setState(() {
        _blogs = data["blogs"] ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _blogs = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _blogs.isEmpty
                    ? const Center(child: Text('No blogs available'))
                    : ListView.builder(
                        itemCount: _blogs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                        content: _blogs[index],
                                        contentType: 'Blog')),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      _blogs[index]['Image'] ??
                                          'https://via.placeholder.com/80',
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Blog',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          _blogs[index]['Title'] ?? 'No title',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          _blogs[index]['Description'] ??
                                              'No Discription',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
