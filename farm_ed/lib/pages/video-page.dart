import 'package:farm_ed/components/appbar.dart';
import 'package:farm_ed/components/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Appbar(),
              Container(
                decoration: BoxDecoration(color: Colors.green[700]),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      'Videos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              MyVideos()
            ],
          ),
        ),
      ),
    );
  }
}
