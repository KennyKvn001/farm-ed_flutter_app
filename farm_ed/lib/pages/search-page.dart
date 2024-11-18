import 'package:farm_ed/pages/blog_detials.dart';
import 'package:farm_ed/pages/video_detials.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> videos = [];
  List<Map<String, dynamic>> news = [];
  List<Map<String, dynamic>> blogs = [];

  List<Map<String, dynamic>> filteredVideos = [];
  List<Map<String, dynamic>> filteredNews = [];
  List<Map<String, dynamic>> filteredBlogs = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadAllContent();
  }

  Future<void> loadAllContent() async {
    try {
      final String videosJson =
          await rootBundle.loadString('image/videos.json');
      final String newsJson = await rootBundle.loadString('image/news.json');
      final String blogsJson = await rootBundle.loadString('image/blog.json');

      final videosData = json.decode(videosJson);
      final newsData = json.decode(newsJson);
      final blogsData = json.decode(blogsJson);

      setState(() {
        videos = List<Map<String, dynamic>>.from(videosData['videos']);
        news = List<Map<String, dynamic>>.from(newsData['news']);
        blogs = List<Map<String, dynamic>>.from(blogsData['blogs']);

        filteredVideos = videos;
        filteredNews = news;
        filteredBlogs = blogs;

        _isLoading = false;
      });
    } catch (e) {
      print('Error loading content: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void filterContent(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredVideos = videos;
        filteredNews = news;
        filteredBlogs = blogs;
      } else {
        filteredVideos = videos
            .where((video) =>
                video['title']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                (video['description']?.toString().toLowerCase() ?? '')
                    .contains(query.toLowerCase()))
            .toList();

        filteredNews = news
            .where((newsItem) =>
                newsItem['Title']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                (newsItem['Description']?.toString().toLowerCase() ?? '')
                    .contains(query.toLowerCase()))
            .toList();

        filteredBlogs = blogs
            .where((blog) =>
                blog['Title']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                (blog['Description']?.toString().toLowerCase() ?? '')
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(color: Colors.white),
                                onChanged: filterContent,
                              ),
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.search, color: Colors.white),
                              onPressed: () =>
                                  filterContent(_searchController.text),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Videos Section
                    if (filteredVideos.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${filteredVideos.length} Videos",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredVideos.length,
                          itemBuilder: (context, index) {
                            final video = filteredVideos[index];
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VideoDetails(
                                            title: video['title'],
                                            thumbnail: video['thumbnail'],
                                            videoUrl: video['videoUrl'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 220,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(video['thumbnail']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    video['title'],
                                    style: const TextStyle(fontSize: 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                    // News Section
                    if (filteredNews.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${filteredNews.length} News",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredNews.length,
                        itemBuilder: (context, index) {
                          final newsItem = filteredNews[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    content: newsItem,
                                    contentType: 'News',
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: const Icon(Icons.article),
                              title: Text(
                                newsItem['Title'] ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                              ),
                              subtitle: Text(
                                newsItem['Description'] ?? '',
                                maxLines: 2,
                              ),
                            ),
                          );
                        },
                      ),
                    ],

                    // Blogs Section
                    if (filteredBlogs.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${filteredBlogs.length} Blogs",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredBlogs.length,
                        itemBuilder: (context, index) {
                          final blog = filteredBlogs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    content: blog,
                                    contentType: 'Blog',
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: const Icon(Icons.book),
                              title: Text(
                                blog['Title'] ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                              ),
                              subtitle: Text(
                                blog['Description'] ?? '',
                                maxLines: 2,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
    );
  }
}
