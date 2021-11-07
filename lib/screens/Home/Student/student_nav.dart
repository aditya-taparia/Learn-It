import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Student/Chat/chat_screen.dart';
import 'package:learn_it/screens/Home/Student/Chat/group_screen.dart';

import 'package:learn_it/screens/Home/Student/Library/library.dart';
import 'package:learn_it/screens/Settings/setting.dart';

class StudentNav extends StatefulWidget {
  const StudentNav({Key? key}) : super(key: key);

  @override
  _StudentNavState createState() => _StudentNavState();
}

class _StudentNavState extends State<StudentNav> {
  int index = 0;
  // screens to be displayed on screen
  final screens = [
    const Center(
      child: Text('Student Dashboard'),
    ),
    const Library(),
    const Center(
      child: GroupScreen(),
    ),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color.fromRGBO(0, 75, 141, 1),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(0, 75, 141, 1),
            ),
          ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          animationDuration: const Duration(seconds: 1),
          backgroundColor: const Color(0xFFf1f5fb),
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.dashboard_outlined,
                color: Color.fromRGBO(0, 75, 141, 1),
              ),
              selectedIcon: Icon(
                Icons.dashboard_rounded,
                color: Colors.white,
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.category_outlined,
                color: Color.fromRGBO(0, 75, 141, 1),
              ),
              selectedIcon: Icon(
                Icons.category_rounded,
                color: Colors.white,
              ),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.chat_outlined,
                color: Color.fromRGBO(0, 75, 141, 1),
              ),
              selectedIcon: Icon(
                Icons.chat_bubble_rounded,
                color: Colors.white,
              ),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_rounded,
                color: Color.fromRGBO(0, 75, 141, 1),
              ),
              selectedIcon: Icon(
                Icons.settings_rounded,
                color: Colors.white,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
