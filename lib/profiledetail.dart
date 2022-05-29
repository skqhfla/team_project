import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'chatpage.dart';
import 'storage.dart';

int rice = 0;
String docid = '';
String name = '';
int age = 0;
String live = '';
int eat = 0;
String sex = '';
List<dynamic> imagelist = [];

class ProfileDetail extends StatefulWidget {
  final String d;

  ProfileDetail({required this.d});

  @override
  _ProfileDetailState createState() {
    docid = d;

    return _ProfileDetailState();
  }
}

class _ProfileDetailState extends State<ProfileDetail> {
  File? _image;
  final picker = ImagePicker();
  List? _outputs;
  String _fileName = 'logo.png';

  final CollectionReference animal =
      FirebaseFirestore.instance.collection('animal');

  final Stream<DocumentSnapshot> _stream =
      FirebaseFirestore.instance.collection('animal').doc(docid).snapshots();

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return StreamBuilder<DocumentSnapshot>(
      stream: _stream,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        imagelist = snapshot.data!['imagelist'];
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(docid),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                      future: storage.downloadURL(snapshot.data!['image']),
                      //snapshot.data!['name']
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Container(
                            // width:400,
                            height: 200,

                            child: Image.network(
                              snapshot.data!,
                              fit: BoxFit.fill,
                            ),
                          );
                        }
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        return Container();
                      }),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(snapshot.data!['name']),
                            Text(
                                '${snapshot.data!['sex']} / ${snapshot.data!['live']}'),
                            Text('eat ${snapshot.data!['eat'].toString()}')
                          ],
                        ),
                        SizedBox(
                          width: 170,
                        ),
                        IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                          d: docid,
                                        )));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.live_tv,
                              ),
                              onPressed: () {},
                            ),
                            Text('라이브톡')
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.rice_bowl,
                              ),
                              onPressed: () {
                                if (rice == 4) {
                                  rice = 0;
                                } else {
                                  rice = rice + 1;
                                }
                                animal.doc(docid).set({
                                  'Category': snapshot.data!['Category'],
                                  'age': snapshot.data!['age'],
                                  'desc': snapshot.data!['desc'],
                                  'eat': rice,
                                  'image': snapshot.data!['image'],
                                  'live': snapshot.data!['live'],
                                  'like': snapshot.data!['like'],
                                  'name': snapshot.data!['name'],
                                  'sex': snapshot.data!['sex'],
                                  'weight': snapshot.data!['weight'],
                                });
                              },
                            ),
                            Text('밥주기')
                          ],
                        ),
                        SizedBox(width: 35),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Container(
                                  color: rice >= 1
                                      ? Colors.red.shade400
                                      : Colors.grey,
                                  width: 50,
                                  height: 20,
                                ),
                                SizedBox(width: 1),
                                Container(
                                  color: rice >= 2
                                      ? Colors.red.shade400
                                      : Colors.grey,
                                  width: 50,
                                  height: 20,
                                ),
                                SizedBox(width: 1),
                                Container(
                                  color: rice >= 3
                                      ? Colors.red.shade400
                                      : Colors.grey,
                                  width: 50,
                                  height: 20,
                                ),
                                SizedBox(width: 1),
                                Container(
                                  color: rice >= 4
                                      ? Colors.red.shade400
                                      : Colors.grey,
                                  width: 50,
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      '오늘의 누렁이',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () async {
                          String f = await getImage(ImageSource.camera);
                          print('----file_name----');
                          print(f);
                          int listlength = imagelist.length;
                          String imagename =
                              '${snapshot.data!['name']}${listlength + 1}';
                          storage.uploadFile(_image!.path, imagename);
                          imagelist.add(imagename);
                          animal.doc(docid).set({
                            'Category': snapshot.data!['Category'],
                            'age': snapshot.data!['age'],
                            'desc': snapshot.data!['desc'],
                            'eat': rice,
                            'image': snapshot.data!['image'],
                            'live': snapshot.data!['live'],
                            'like': snapshot.data!['like'],
                            'name': snapshot.data!['name'],
                            'sex': snapshot.data!['sex'],
                            'weight': snapshot.data!['weight'],
                            'imagelist': imagelist,
                          });
                          setState(() {

                          });
                        },
                      ),
                    ),
                  ),
                  // Padding(padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 5.0),
                  //   child:  Row(
                  //     children: [
                  //       SizedBox(width:10),
                  //       Container(
                  //         width:100,
                  //         height:100 ,
                  //         child:_image == null
                  //             ? Text('No image selected.')
                  //             : ClipRRect(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           child: Image.file(File(_image!.path),
                  //             fit: BoxFit.fill,
                  //           ),
                  //         )
                  //
                  //       ),
                  //       SizedBox(width:10),
                  //       Container(
                  //         width:100,
                  //         height:100 ,
                  //         child:_image == null
                  //             ? Text('No image selected.')
                  //             : ClipRRect(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           child: Image.file(File(_image!.path),
                  //             fit: BoxFit.fill,
                  //           ),
                  //         )
                  //
                  //       ),
                  //       SizedBox(width:10),
                  //       Container(
                  //         width:100,
                  //         height:100 ,
                  //         child:_image == null
                  //             ? Text('No image selected.')
                  //             : ClipRRect(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           child: Image.file(File(_image!.path),
                  //             fit: BoxFit.fill,
                  //           ),
                  //         )
                  //
                  //       ),
                  //     ],
                  //
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 5.0),
                  //   child: Row(
                  //
                  //     children: [
                  //       SizedBox(width:10),
                  //       Container(
                  //         width:100,
                  //         height:100 ,
                  //         child:_image == null
                  //             ? Text('No image selected.')
                  //             : ClipRRect(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           child: Image.file(File(_image!.path),
                  //             fit: BoxFit.fill,
                  //           ),
                  //         )
                  //
                  //       ),
                  //       SizedBox(width:10),
                  //       Container(
                  //         width:100,
                  //         height:100 ,
                  //         child:_image == null
                  //             ? Text('No image selected.')
                  //             :ClipRRect(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           child: Image.file(File(_image!.path),
                  //             fit: BoxFit.fill,
                  //           ),
                  //         )
                  //
                  //       ),
                  //       SizedBox(width:10),
                  //       Container(
                  //         width:100,
                  //         height:100 ,
                  //         child:_image == null
                  //             ? Text('No image selected.')
                  //             : ClipRRect(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           child: Image.file(File(_image!.path),
                  //             fit: BoxFit.fill,
                  //           ),
                  //         )
                  //
                  //       ),
                  //     ],
                  //
                  //   ),
                  // )

                  SizedBox(
                   // height:900,
                    child: Expanded(child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 10, //수평 Padding
                        crossAxisSpacing: 10, //수직 Padding
                      ),
                      itemCount: imagelist.length,
                      itemBuilder: (BuildContext context, int index) {
                        //item 의 반목문 항목 형성
                        return Container(
                          child: Column(
                            children: [
                              FutureBuilder(
                                  future: storage.downloadURL(imagelist[index]),
                                  //snapshot.data!['name']
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                        snapshot.hasData) {
                                      return Container(
                                       width:180,
                                      height: 300,
                                        child: Image.network(
                                          snapshot.data!,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    }
                                    if (!snapshot.hasData) {
                                      return CircularProgressIndicator();
                                    }
                                    return Container();
                                  }),
                              // Container(
                              //   height: 50,
                              //   alignment: Alignment.center,
                              //   color: Colors.yellow,
                              //   child: Text(
                              //     '$index',
                              //     style: TextStyle(
                              //       fontSize: 20,
                              //     ),
                              //   ),
                              // ),
                              // Expanded(
                              //   child: Container(
                              //     color: Colors.lightGreenAccent,
                              //     alignment: Alignment.center,
                              //     child: Text(
                              //       imagelist[index].toString(),
                              //       style: TextStyle(
                              //         fontSize: 20,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      },
                    ),),
                      
                      
                    ),

                ],
              ),
            ));
      },
    );
  }

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
      _fileName = _image!.path; // 가져온 이미지를 _image에 저장
    });
    //await classifyImage(File(image!.path)); // 가져온 이미지를 분류 하기 위해 await을 사용
    return _fileName;
  }
}
