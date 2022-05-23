import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'mainpage.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPagePageState createState() => _SignUpPagePageState();
}

class _SignUpPagePageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _emailaddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset : false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(50),
                child: Container(
                  height: 600,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return '이름을 입력하세요';
                          }
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _emailaddressController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value){
                          RegExp regExp = new RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                            caseSensitive: false,
                            multiLine: false,
                          );
                          if (value == null || value.isEmpty)
                            return '이메일을 입력하세요';
                          else if (!regExp.hasMatch(value)) {
                            return '이메일 형식이 일치하지 않습니다';
                          }
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        obscureText: true,
                        validator: (value){
                          if (value == null || value.isEmpty)
                            return '비밀번호를 입력하세요';
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _confirmpasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        obscureText: true,
                        validator: (value){
                          if (value == null || value.isEmpty)
                            return '비밀번호가 일치하지 않습니다';
                          else if (value != _passwordController.text)
                            return '비밀번호가 일치하지 않습니다';
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: _emailaddressController.text,
                                password: _passwordController.text
                            );
                            FirebaseFirestore.instance
                                .collection('user').
                            doc(FirebaseAuth.instance.currentUser!.uid).set({
                              'name' : _usernameController.text,
                              'favorite' : [],
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow[100],
                          onPrimary: Colors.black,
                          fixedSize: Size(100, 50),
                        ),
                      )
                    ],
                  ),
                )
            )
          ),
        ),
    );
  }
}
