import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  final Map<String, dynamic> content;
  final String contentType;
  const Featured({Key? key, required this.content, required this.contentType})
      : super(key: key);

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
                  content['Image'] ?? 'https://via.placeholder.com/80',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contentType,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      content['Title'] ?? 'No title',
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      content['Description'] ?? 'No Discription',
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
