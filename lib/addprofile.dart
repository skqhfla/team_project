import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'storage.dart';

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
  final Storage storage = Storage();
  String _fileName = 'logo.png';

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
      body: ListView(
        children: <Widget>[
          FutureBuilder(
              future: storage.downloadURL(_fileName),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  url = snapshot.data;
                  return Container(
                      width: 600,
                      height: 240,
                      child: Image.network(
                        url!,
                        fit: BoxFit.fill,
                      ));
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                return Container();
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () async {
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    // type: FileType.custom,
                  );

                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No File selected.'),
                      ),
                    );
                    return;
                  } else {
                    final path = results.files.single.path;
                    final fileName = results.files.single.name;
                    setState(() {
                      storage.uploadFile(path!, fileName);
                      url = path;
                    });

                    _fileName = fileName;
                  }
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text('이름'),
                      TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                      children: [
                        Text('나이'),
                        TextFormField(
                          controller: _age,
                          decoration: const InputDecoration(
                            filled: true,
                          ),
                        ),
                        ],
                  ),
                  Row(
                    children: [
                      Text('성별'),
                      TextFormField(
                        controller: _sex,
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('몸무게'),
                      TextFormField(
                        controller: _weight,
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('특이사항'),
                      TextFormField(
                        controller: _desc,
                        decoration: const InputDecoration(
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
