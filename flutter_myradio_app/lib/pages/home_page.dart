import 'package:flutter/material.dart';
import 'package:flutter_myradio_app/pages/radio_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _childern = [new RadioPage(), new Text("Page 2")];

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
      body: _childern[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        currentIndex: _currentIndex,
        items: [
          _bottomNavItems(Icons.play_arrow, "Listen"),
          _bottomNavItems(Icons.favorite, "Favorites")
        ],
        onTap: onTabTapped,
      ),
    ));
  }

  void onTabTapped(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }

  _bottomNavItems(IconData icon, String Title) {
    return BottomNavigationBarItem(
        icon: new Icon(icon, color: Colors.white),
        activeIcon: new Icon(icon, color: Colors.white),
        // ignore: deprecated_member_use
        title: new Text(
          Title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ));
  }
}
