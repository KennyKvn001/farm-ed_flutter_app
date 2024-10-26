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
<<<<<<< HEAD
                    const Text(
                      'Blog',
=======
                    Text(
                      contentType,
>>>>>>> c7b2b342dcbb7ddeb94b224fa85d4e6f3ad110cb
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
<<<<<<< HEAD
                      blog['Description'] ?? 'No Discription',
                      style: const TextStyle(
=======
                      content['Description'] ?? 'No Discription',
                      style: TextStyle(
>>>>>>> c7b2b342dcbb7ddeb94b224fa85d4e6f3ad110cb
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
