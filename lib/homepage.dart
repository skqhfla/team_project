import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_project/profilelist.dart';

import 'mainpage.dart';
import 'mypage.dart';

double currentLatitude = 0;
double currentLongitude = 0;

class HomePage extends StatefulWidget {
  HomePage({required this.mycurrentLatitude, required this.mycurrentLongitude});

  double mycurrentLatitude;
  double mycurrentLongitude;

  @override
  _HomePageState createState() {
    currentLatitude = mycurrentLatitude;
    currentLongitude = mycurrentLongitude;
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [MainPage(Latitude: currentLatitude, Longitude: currentLongitude,), MyPage(), ProfileList()];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Page',
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'list',
              )
            ]
        )
    );
  }
}