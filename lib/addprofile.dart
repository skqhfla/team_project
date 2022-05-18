import 'package:flutter/material.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _sex = TextEditingController();
  final _weight = TextEditingController();
  final _desc = TextEditingController();

  final _formKey = GlobalKey<FormState>(debugLabel: '_AddProfileState');

  @override
  Widget build(BuildContext context) {
    String? url = "late";
    return Scaffold(
      appBar: AppBar(
        title: Text('add profile'),
        actions: [
          TextButton(
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.add, size: 80), onPressed: () {}),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  filled: true,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _age,
                decoration: const InputDecoration(
                  filled: true,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _sex,
                decoration: const InputDecoration(
                  filled: true,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _weight,
                decoration: const InputDecoration(
                  filled: true,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _desc,
                decoration: const InputDecoration(
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
