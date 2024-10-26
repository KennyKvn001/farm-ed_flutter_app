// ignore: file_names
// ignore: file_names
// import 'package:farm_ed/components/navigationbar.dart';

import 'dart:convert';

import 'package:farm_ed/components/featured.dart';
import 'package:farm_ed/components/slidecards.dart';
import 'package:farm_ed/pages/blog_detials.dart';
import 'package:flutter/material.dart';
import 'package:farm_ed/components/appbar.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // page controller
  final _controller = PageController();

  List<dynamic> _blogs = [];
  List<dynamic> _news = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String blogs = await rootBundle.loadString('image/blog.json');
      final blogData = await json.decode(blogs);
      final String news = await rootBundle.loadString('image/news.json');
      final newsData = await json.decode(news);
      setState(() {
        _blogs = blogData["blogs"] ?? [];
        _news = newsData["news"] ?? [];
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading blogs: $e');
      setState(() {
        _blogs = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // Appbar
            const Appbar(),
            const SizedBox(height: 10.0),

            // Cards
            SizedBox(
              height: 320,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: const [
                  SlideCard(
                    type: 'Blog',
                    description: 'Advanced Weather Prediction',
                    image: 'image/images/rice-plantsunset.png',
                  ),
                  SlideCard(
                    type: 'News',
                    description: 'New Fertilizers coming this year',
                    image: 'image/images/Tructor.png',
                  ),
                  SlideCard(
                    type: 'Videos',
                    description: 'New video, how to use modern irrigation ',
                    image: 'image/images/FarmWorker.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // page controller
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(activeDotColor: Colors.green),
            ),

            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(content: _blogs[3], contentType: 'Blog'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _isLoading
                    ? Center(child: const CircularProgressIndicator())
                    : _blogs.isEmpty
<<<<<<< HEAD
                        ? const Center(child: Text('No blogs available'))
                        : Featured(blog: _blogs[3]),
=======
                        ? Center(child: Text('No blogs available'))
                        : Featured(contentType: "Blog", content: _blogs[3]),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(content: _news[3], contentType: 'News'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _news.isEmpty
                        ? Center(child: Text('No news available'))
                        : Featured(
                            content: _news[3],
                            contentType: "News",
                          ),
>>>>>>> c7b2b342dcbb7ddeb94b224fa85d4e6f3ad110cb
              ),
            )
          ]),
        ),
      ),
    );
  }
}
