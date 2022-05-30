import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_project/homepage.dart';
import 'package:team_project/signup.dart';
import 'package:geolocator/geolocator.dart';

import 'mainpage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _id = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Container(
          height: 600,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.yellow[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: '아이디',
                  hintStyle: TextStyle(
                      fontSize: 15
                  ),
                ),
                controller: _id,
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.yellow[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: '비밀번호',
                  hintStyle: TextStyle(
                      fontSize: 15
                  ),
                ),
                controller: _password,
                obscureText: true,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 125,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text('로그인', style: TextStyle(color: Colors.black),),
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _id.text,
                            password: _password.text,
                          );
                          LocationPermission permission = await Geolocator.requestPermission();
                          Position position = await Geolocator.getCurrentPosition();
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (context) =>
                              new HomePage(mycurrentLatitude: position.latitude, mycurrentLongitude: position.longitude,))
                          );
                        } on FirebaseAuthException catch (e) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('로그인 오류'),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('확인')
                                    )
                                  ],
                                );
                              }
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 50),
                  Container(
                    width: 125,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text('회원가입', style: TextStyle(color: Colors.black),),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                            builder: (context) => new SignUpPage()));
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }
}
