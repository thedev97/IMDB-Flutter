import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_flutter/app/ui/screens/main/home/home.dart';
import 'package:imdb_flutter/app/ui/screens/main/profile/profile.dart';
import 'package:imdb_flutter/app/ui/screens/main/search/search.dart';
import 'package:imdb_flutter/app/ui/screens/main/video/video.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          children: const [Home(), Search(), Video(), Profile()],
        ),
        bottomNavigationBar:
            BottomNavigationBar();
  }
}
