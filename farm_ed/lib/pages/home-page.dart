// import 'package:farm_ed/components/navigationbar.dart';
import 'package:farm_ed/components/slidecards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:farm_ed/components/appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // Appbar
            Appbar(),
            SizedBox(height: 10.0),

            // Cards
            Container(
              height: 320,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  SlideCard(
                    type: 'Blog',
                    description: 'Microsoft launches a deepfake',
                    image: 'image/images/rice-plantsunset.png',
                  ),
                  SlideCard(
                    type: 'News',
                    description: 'New Fertilizers coming this year',
                    image: 'image/images/HarvestingField.png',
                  ),
                  SlideCard(
                    type: 'Videos',
                    description: 'New video, how to use modern irrigation ',
                    image: 'image/images/FarmWorker.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // page controller
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.green),
            ),
          ]),
        ),
      ),
    );
  }
}
