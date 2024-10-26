import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> content; 
  final String contentType; 

  const DetailsPage({
    Key? key,
    required this.content,
    required this.contentType, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  child: Image.network(
                    content['Image'] ?? 'https://via.placeholder.com/80',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    contentType,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    blog['Title'] ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    blog['Author1'] ?? 'No Dates',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    content['Description'] ?? 'No Description',
                    style:
                        const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
        // Back button
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
