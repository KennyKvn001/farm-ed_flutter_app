import 'package:farm_ed/pages/video_detials.dart';
import 'package:flutter/material.dart';

class MyVideos extends StatefulWidget {
  const MyVideos({super.key});

  @override
  State<MyVideos> createState() => _MyVideosState();
}

class _MyVideosState extends State<MyVideos> {
  List<Map<String, dynamic>> videos = [
    {
      "title": "The IPO parade continues as Wish files",
      "thumbnail":
          "image/images/rice-plantsunset.png", // Ensure this asset exists
    },
    {
      "title": "Insurtech startup PasarPolis gets \$54",
      "thumbnail":
          "image/images/HarvestingField.png", // Ensure this asset exists
    },
    {
      "title": "The IPO parade continues as Wish files",
      "thumbnail": "image/images/FarmWorker.png", // Ensure this asset exists
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: videos.map((video) {
          return GestureDetector(
            onTap: () {
              // Navigate to VideoDetails screen with video data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoDetials(
                    title: video['title'],
                    thumbnail: video['thumbnail'],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(video['thumbnail']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 80),
                        Text(
                          video['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
