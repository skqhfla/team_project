import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_project/profilelist.dart';

import 'mainpage.dart';
import 'mypage.dart';
//
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [MainPage(), MyPage(),ProfileList()];
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