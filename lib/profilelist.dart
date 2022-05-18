import 'package:flutter/material.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile list'),

      ),


    );
  }
}
