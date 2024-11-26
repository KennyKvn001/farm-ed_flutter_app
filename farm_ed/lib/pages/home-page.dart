// ignore: file_names
// ignore: file_names
// import 'package:farm_ed/components/navigationbar.dart';

import 'dart:convert';

import 'package:farm_ed/components/featured.dart';
import 'package:farm_ed/components/slidecards.dart';
import 'package:farm_ed/pages/blog_detials.dart';
import 'package:farm_ed/pages/video_detials.dart';
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
  List<Map<String, dynamic>> videos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String videosJson =
          await rootBundle.loadString('image/videos.json');
      final videosData = json.decode(videosJson);
      final String blogs = await rootBundle.loadString('image/blog.json');
      final blogData = await json.decode(blogs);
      final String news = await rootBundle.loadString('image/news.json');
      final newsData = await json.decode(news);
      setState(() {
        _blogs = blogData["blogs"] ?? [];
        _news = newsData["news"] ?? [];
        videos = List<Map<String, dynamic>>.from(videosData['videos'] ?? []);
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading blogs: $e');
      setState(() {
        _blogs = [];
        _news = [];
        videos = [];
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
          child: Column(
            children: [
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
              const SizedBox(height: 10),

              // Page indicator
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(activeDotColor: Colors.green),
              ),

              const SizedBox(height: 25),

              // Featured header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Featured Content
              if (_isLoading) ...[
                const Center(child: CircularProgressIndicator()),
              ] else ...[
                // Featured Blog
                if (_blogs.isNotEmpty && _blogs.length > 3)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                content: _blogs[3], contentType: 'Blog'),
                          ),
                        );
                      },
                      child: Featured(
                        content: _blogs[3],
                        contentType: "Blog",
                      ),
                    ),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(child: Text('No blogs available')),
                  ),

                // Featured News
                if (_news.isNotEmpty && _news.length > 3)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                content: _news[3], contentType: 'News'),
                          ),
                        );
                      },
                      child: Featured(
                        content: _news[3],
                        contentType: "News",
                      ),
                    ),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(child: Text('No news available')),
                  ),

                // Featured Videos
                if (videos.isNotEmpty)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoDetails(
                              title: videos[0]['title'],
                              thumbnail: videos[0]['thumbnail'],
                              videoUrl: videos[0]['videoUrl'],
                            ),
                          ),
                        );
                      },
                      child: Featured(
                        content: videos[0],
                        contentType: "Videos",
                      ),
                    ),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(child: Text('No videos available')),
                  ),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
