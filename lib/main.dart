import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Reality',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Reality'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Action for search button
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: '13 Videos'),
              VideoSection(),
              SizedBox(height: 20),
              SectionHeader(title: '78 News'),
              NewsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: '',
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class VideoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          VideoCard(title: 'The IPO parade continues as Wish files'),
          VideoCard(title: 'Insurtech startup PasarPolis gets \$54 million'),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;

  const VideoCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: Colors.blueAccent, // Placeholder for video image
            child: Center(
                child: Icon(Icons.play_circle_fill, color: Colors.white)),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class NewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewsTile(
            title: 'Insurtech startup PasarPolis gets \$54 million — Series B'),
        NewsTile(title: 'Hypatos gets \$11.8M for a deep learning approach'),
        NewsTile(
            title: 'The IPO parade continues as Wish files, Bumble targets'),
        NewsTile(title: 'Hypatos gets \$11.8M for a deep learning approach'),
      ],
    );
  }
}

class NewsTile extends StatelessWidget {
  final String title;

  const NewsTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      onTap: () {
        // Action when the news is tapped
      },
    );
  }
}
