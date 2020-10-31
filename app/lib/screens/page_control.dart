import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';

import 'package:hack/screens/home_page.dart';
import 'package:hack/screens/profile_screen.dart';
import 'package:hack/screens/search_screen.dart';
import 'package:hack/screens/analytics.dart';

class PagesScreen extends StatefulWidget {
  static const routename = '/page';
  @override
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  int _cIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _cIndex,
          showElevation: true,
          backgroundColor: Colors.white,
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              activeColor: Colors.deepOrangeAccent,
              inactiveColor: Colors.grey,
              title: Text(
                "Home",
                style: TextStyle(fontFamily: "nunito"),
              ),
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text(
                "Search",
                style: TextStyle(fontFamily: "nunito"),
              ),
              inactiveColor: Colors.grey,
              activeColor: Colors.deepOrangeAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text(
                "Health",
                style: TextStyle(fontFamily: "nunito"),
              ),
              inactiveColor: Colors.grey,
              activeColor: Colors.deepOrangeAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontFamily: "nunito"),
              ),
              inactiveColor: Colors.grey,
              activeColor: Colors.deepOrangeAccent,
            )
          ],
          onItemSelected: (index) {
            _incrementTab(index);
          }),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _cIndex = index);
          },
          children: <Widget>[
            HomePage(),
            SearchScreen(),
            AnalyticPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
