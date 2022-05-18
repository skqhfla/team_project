import 'package:flutter/material.dart';

import 'login.dart';
import 'main.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/main',
      routes: {
        '/main': (BuildContext context) =>  MyHomePage(title: 'hello',),
        '/login': (BuildContext context) =>  LoginPage(),

      },
    );
  }
}

