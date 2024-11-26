import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  final Map content;
  final String contentType;

  const Featured({Key? key, required this.content, required this.contentType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildImage(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contentType,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      content['Title'] ?? content['title'] ?? 'No title',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      content['Description'] ??
                          content['description'] ??
                          'No Description',
                      style: const TextStyle(
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
      ],
    );
  }

  Widget _buildImage() {
    // First try to load network image
    if (content['Image'] != null) {
      return Image.network(
        content['Image']!,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // If network image fails, fall back to placeholder
          return _buildPlaceholder();
        },
      );
    }

    // Then try to load asset image
    else if (content['thumbnail'] != null) {
      return Image.asset(
        content['thumbnail']!,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // If asset image fails, fall back to placeholder
          return _buildPlaceholder();
        },
      );
    }

    // If no image source is available, show placeholder
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Image.network(
      'https://via.placeholder.com/80',
      width: 80,
      height: 80,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // If even placeholder fails, show colored container
        return Container(
          width: 80,
          height: 80,
          color: Colors.grey[300],
          child: const Icon(Icons.image, color: Colors.grey),
        );
      },
    );
  }
}
