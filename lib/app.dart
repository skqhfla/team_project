import 'package:flutter/material.dart';

import 'login.dart';
import 'main.dart';

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: const MyHomePage(
        title: 'hello',
      ),
      initialRoute: '/main',
      routes: {
        '/main': (BuildContext context) => MyHomePage(
              title: 'hello',
            ),
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
