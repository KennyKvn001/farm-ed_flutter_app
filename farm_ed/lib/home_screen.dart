import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../pages/home-page.dart';
import '../pages/blog-page.dart';
import '../pages/news-page.dart';
import '../pages/search-page.dart';
import '../pages/video-page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages corresponding to the bottom nav items
  final List<Widget> _pages = [
    const HomePage(), // This would be the main screen with cards
    const BlogPage(),
    const SearchPage(),
    const ArticlePage(),
    const VideosPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected page index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _pages[_selectedIndex], // Display the selected page
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: CustomNavigationBar(
          isFloating: true,
          elevation: 2,
          iconSize: 30.0,
          borderRadius: const Radius.circular(30),
          selectedColor: Colors.green,
          unSelectedColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 50, 121, 53),
          strokeColor: Colors.white,
          items: [
            CustomNavigationBarItem(icon: const Icon(Icons.home_outlined)),
            CustomNavigationBarItem(icon: const Icon(Icons.ballot_rounded)),
            CustomNavigationBarItem(icon: const Icon(Icons.search)),
            CustomNavigationBarItem(icon: const Icon(Icons.article_rounded)),
            CustomNavigationBarItem(icon: const Icon(Icons.play_circle_outline)),
          ],
          currentIndex: _selectedIndex, // Show active item
          onTap: _onNavItemTapped, // Handle nav tap
        ),
      ),
    );
  }
}
