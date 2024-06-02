import 'package:flutter/material.dart';
import 'package:imdb_flutter/app/ui/screens/main/home/home.dart';
import 'package:imdb_flutter/app/ui/screens/main/home/home_view_model.dart';
import 'package:imdb_flutter/app/ui/screens/main/profile/profile.dart';
import 'package:imdb_flutter/app/ui/screens/main/search/search.dart';
import 'package:imdb_flutter/app/ui/screens/main/video/video.dart';
import 'package:imdb_flutter/app/ui/screens/main/widgets/bottom_navigation.dart';

class IMDBMain extends StatefulWidget {
  const IMDBMain({super.key});

  @override
  State<IMDBMain> createState() => _IMDBMainState();
}

class _IMDBMainState extends State<IMDBMain> {
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
          children: [
            IMDBHome(
              viewModel: IMDBHomeViewModel(),
            ),
            const IMDBSearch(),
            const IMDBVideo(),
            const IMDBProfile()
          ],
        ),
        bottomNavigationBar:
            IMDBBottomNavigationBar(pageController: _pageController));
  }
}
