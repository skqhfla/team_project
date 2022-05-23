import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class MyDetailPage extends StatefulWidget {

  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}
//
class _MyDetailPageState extends State<MyDetailPage> {

  @override
  Widget build(BuildContext maincontext) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(maincontext);
          },
        ),
        title: Text('Edit'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('회원 탈퇴'),
                        actions: [
                          FlatButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                              await FirebaseAuth.instance.currentUser!.delete();
                              await FirebaseAuth.instance.signOut();
                            },
                            child: Text('예'),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('아니요'),
                          )
                        ],
                      );
                    }
                );
              },
              child: Text('회원 탈퇴'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[100],
                  onPrimary: Colors.black
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
              },
              child: Text('로그아웃'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[100],
                  onPrimary: Colors.black
              ),
            ),
          ),
        ],
      )
    );
  }
}