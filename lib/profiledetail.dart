import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile detail'),

      ),


    );
  }
}
