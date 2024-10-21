import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  final Map<String, dynamic> blog;
  const Featured({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // blog featured
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  blog['Image'] ?? 'https://via.placeholder.com/80',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blog',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      blog['Title'] ?? 'No title',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      blog['Description'] ?? 'No Discription',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // News featured

        // video featured
      ],
    );
  }
}
