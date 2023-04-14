import 'package:flutter/material.dart';
import 'package:vezeeta_app/view/pages/Navigation/activity.dart';
import 'package:vezeeta_app/view/pages/Navigation/Profile.dart';

import 'Navigation/searching.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _currentIndex = 0;
  List<Widget> Pages = [
    Searching(),
    Activity(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue[600],
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'My Activity', icon: Icon(Icons.calendar_month)),
            BottomNavigationBarItem(
                label: 'My Profile', icon: Icon(Icons.person_3_outlined)),
          ]),
      appBar: AppBar(
          elevation: 0,
          title: Text(
            _currentIndex == 0
                ? 'Vezeeta'
                : _currentIndex == 1
                    ? 'My Activities'
                    : 'Welcome to Vezeeta ! ',
            style: TextStyle(
                fontSize: _currentIndex == 0
                    ? 40
                    : _currentIndex == 1
                        ? 20
                        : 16,
                color: _currentIndex == 0 ? Colors.blue[600] : Colors.white,
                fontWeight: _currentIndex == 0 || _currentIndex == 1
                    ? FontWeight.bold
                    : FontWeight.normal),
          )),
      body: Pages[_currentIndex],
    );
  }
}
