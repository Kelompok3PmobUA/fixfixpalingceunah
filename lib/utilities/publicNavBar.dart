import 'package:flutter/material.dart';
import 'package:project/screens/editprofilepage.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/social_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/calenderpage.dart';

class NavBar extends StatefulWidget {
  int currentIndex = 0;
  List pages = [
    HomePage(),
    CalenderPage(items: []),
    SocialPage(),
    SettingsUI()
  ];

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.pages[widget.currentIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: GNav(
            backgroundColor: Color(0xFF),
            activeColor: Color(0xFF2585DE),
            iconSize: 25,
            selectedIndex: 0,
            gap: 8,
            tabBackgroundColor: Color.fromARGB(255, 224, 224, 224),
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                widget.currentIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.calendar_today,
                text: 'Calender',
              ),
              GButton(
                icon: Icons.group_rounded,
                text: 'Social',
              ),
              GButton(
                icon: Icons.person_rounded,
                text: 'Profile',
              )
            ],
          ),
        ));
  }
}
