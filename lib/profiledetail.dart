import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

int rice = 0;
String docid = '';
String name = '';
int age = 0;
String live = '';
int eat = 0;
String sex = '';

class ProfileDetail extends StatefulWidget {
  final String d;

  ProfileDetail({required this.d});

  @override
  _ProfileDetailState createState() {
    docid = d;


    //
    // animal.doc(docid).get().then((DocumentSnapshot ds) {
    //   name = ds.get('name');
    //   live = ds.get('live');
    //   eat = ds.get('eat');
    //   age = ds.get('age');
    //   sex = ds.get('sex');
    //   print(ds);
    // });

    return _ProfileDetailState();
  }
}

class _ProfileDetailState extends State<ProfileDetail> {

  final CollectionReference animal =
  FirebaseFirestore.instance.collection('animal');

  final Stream<DocumentSnapshot> _stream =
      FirebaseFirestore.instance.collection('animal').doc(docid).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _stream,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(docid),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 400,
                height: 300,
                child: Image.asset("assets/dog1.png"),
              ),
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
                      onPressed: () {},
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
                            setState(() {
                              if (rice == 4) {
                                rice = 0;
                              } else {
                                rice = rice + 1;
                              }
                              animal.doc(docid).set( {
                                'Category':snapshot.data!['Category'],
                                'age':snapshot.data!['age'],
                                'desc': snapshot.data!['desc'],
                                'eat': rice,
                                'image': snapshot.data!['image'],
                                'live': snapshot.data!['live'],
                                'like': snapshot.data!['like'],
                                'name':snapshot.data!['name'],
                                'sex': snapshot.data!['sex'],
                                'weight': snapshot.data!['weight'],
                              });
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
                              color:
                                  rice >= 1 ? Colors.red.shade400 : Colors.grey,
                              width: 50,
                              height: 20,
                            ),
                            SizedBox(width: 1),
                            Container(
                              color:
                                  rice >= 2 ? Colors.red.shade400 : Colors.grey,
                              width: 50,
                              height: 20,
                            ),
                            SizedBox(width: 1),
                            Container(
                              color:
                                  rice >= 3 ? Colors.red.shade400 : Colors.grey,
                              width: 50,
                              height: 20,
                            ),
                            SizedBox(width: 1),
                            Container(
                              color:
                                  rice >= 4 ? Colors.red.shade400 : Colors.grey,
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
            ],
          ),
        );
      },
    );
  }
}
