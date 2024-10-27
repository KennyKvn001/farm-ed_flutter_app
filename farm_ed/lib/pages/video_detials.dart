import 'package:farm_ed/components/video.dart';
import 'package:flutter/material.dart';

class VideoDetials extends StatelessWidget {
  final String title;
  final String thumbnail;
  const VideoDetials({super.key, required this.title, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity, // Specific width
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 139, 28),
              ),

              child: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.green,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ),
                  // FarmEd icon in the center
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Center(
                        child: Text(
                      'Videos',
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Image.asset(
              //   thumbnail,
              //   fit: BoxFit.cover,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(title,
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Other similar videos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                MyVideos(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
