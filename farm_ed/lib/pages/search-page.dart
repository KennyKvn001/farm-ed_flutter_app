import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> videos = [
    {
      "title": "Video 1",
      "description": "Description for video 1",
      "thumbnail": "image/images/FarmWorker.png", // Ensure this asset exists
    },
    {
      "title": "Video 2",
      "description": "Description for video 2",
      "thumbnail":
          "image/images/HarvestingField.png", // Ensure this asset exists
    },
    {
      "title": "Video 3",
      "description": "Description for video 3",
      "thumbnail":
          "image/images/rice-plantsunset.png", // Ensure this asset exists
    },
  ];
  List<Map<String, dynamic>> news = [
    {"title": "News 1", "description": "Description for news 1"},
    {"title": "News 2", "description": "Description for news 2"},
  ];
  List<Map<String, dynamic>> blogs = [
    {"title": "Blog 1", "description": "Description for blog 1"},
    {"title": "Blog 2", "description": "Description for blog 2"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Container
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            // Implement your search logic here
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          // Trigger search action
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Videos Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${videos.length} Videos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 170, // Adjust the height based on your design
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            width: 150,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(video['thumbnail']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            video['title'],
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // News Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${news.length} News",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: news.map((newsItem) {
                  return ListTile(
                    leading: Icon(Icons.article),
                    title: Text(newsItem['title']),
                    subtitle: Text(newsItem['description']),
                  );
                }).toList(),
              ),

              // Blogs Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${blogs.length} Blogs",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: blogs.map((blog) {
                  return ListTile(
                    leading: Icon(Icons.book),
                    title: Text(blog['title']),
                    subtitle: Text(blog['description']),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
