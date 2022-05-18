import 'package:flutter/material.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add profile'),

      ),


    );
  }
}
