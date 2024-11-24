import 'package:flutter/material.dart';
import 'package:news_applications/view/news_screen/news_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  List screens = [
    NewsScreen(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selected],
      bottomNavigationBar: _buil_bottomnavbar(),
    );
  }

  BottomNavigationBar _buil_bottomnavbar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        currentIndex: selected,
        onTap: (value) {
          selected = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_outline,
              ),
              activeIcon: Icon(
                Icons.bookmark,
              ),
              label: "Subscriptions"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(
              Icons.person,
            ),
            label: "You",
          ),
        ]);
  }
}
