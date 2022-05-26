import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

int rice = 0;
String docid='';
String name='';

class ProfileDetail extends StatefulWidget {

  final String d;

  ProfileDetail(
      {required this.d}
      );

  @override
  _ProfileDetailState createState() {
    docid = d;
    return _ProfileDetailState();
  }
}

class _ProfileDetailState extends State<ProfileDetail> {

  final CollectionReference animal =
  FirebaseFirestore.instance.collection('animal');





  @override
  Widget build(BuildContext context) {
    animal.doc(docid).get().then(
            (DocumentSnapshot ds){
              print('------------');
          print(ds);
          //print(title);
        });
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
                  children: [Text(''), Text('3살 수컷 / 장량')],
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
                          color: rice >= 1 ? Colors.red.shade400 : Colors.grey,
                          width: 50,
                          height: 20,
                        ),
                        SizedBox(width: 1),
                        Container(
                          color: rice >= 2 ? Colors.red.shade400 : Colors.grey,
                          width: 50,
                          height: 20,
                        ),
                        SizedBox(width: 1),
                        Container(
                          color: rice >= 3 ? Colors.red.shade400 : Colors.grey,
                          width: 50,
                          height: 20,
                        ),
                        SizedBox(width: 1),
                        Container(
                          color: rice >= 4 ? Colors.red.shade400 : Colors.grey,
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
  }
}
