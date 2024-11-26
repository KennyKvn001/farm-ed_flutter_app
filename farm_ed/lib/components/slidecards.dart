import 'package:flutter/material.dart';

class SlideCard extends StatelessWidget {
  final String type;
  final String description;
  // ignore: prefer_typing_uninitialized_variables
  final image;

  const SlideCard({
    super.key,
    required this.type,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            color: Colors.green[700],
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 70),
            Text(
              description,
              style: const TextStyle(
                  color: Color.fromARGB(255, 73, 208, 79),
                  fontSize: 36,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
