import 'package:event_app/features/home/presentation/home_page.dart';
import 'package:event_app/features/profile/profile_page.dart';
import 'package:event_app/global/theme/theme.dart';
import 'package:event_app/global/views/page_under_construction.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // * Holds the index of the currently selected tab
  // in the bottom navigation bar
  int currentIndex = 0;

  // * List of screens that are displayed in the bottom navigation bar

  final tabs = const [
    HomePage(),
    Scaffold(backgroundColor: Colors.white, body: PageUnderConstruction()),
    Scaffold(backgroundColor: Colors.white, body: PageUnderConstruction()),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_outlined,
                color: appPrimaryColor,
                size: 26,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: descriptionGreyColor,
                size: 22,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.storefront,
                color: appPrimaryColor,
                size: 26,
              ),
              icon: Icon(
                Icons.calendar_today_outlined,
                color: descriptionGreyColor,
                size: 22,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: appPrimaryColor,
                size: 26,
              ),
              icon: Icon(
                Icons.favorite_outline_outlined,
                color: descriptionGreyColor,
                size: 22,
              ),
              label: 'Purchases',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person_outlined,
                color: appPrimaryColor,
                size: 26,
              ),
              icon: Icon(
                Icons.person_outlined,
                color: descriptionGreyColor,
                size: 22,
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabs,
        ),
      ),
    );
  }
}
