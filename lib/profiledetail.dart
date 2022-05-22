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
        title: Text('프로필'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            height:300 ,
            child: Image.asset("assets/dog1.png"),
          ),
         Container(
           padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
           child:  Row(
             children: [
               Column(
                 children: [
                   Text('누룽지'),
                   Text('3살 수컷 / 장량')
                 ],
               ),
               SizedBox(
                 width: 170,
               ),
               IconButton(
                 icon: Icon(Icons.chat),
                 onPressed: (){},
               ),
               IconButton(
                 icon: Icon(Icons.favorite),
                 onPressed: (){},
               )

             ],

           ),
           
         ),
         Container(
           padding:EdgeInsets.all(20),
           child: Divider(
             color: Colors.black,
             thickness: 1,

           ),
         )

        ],
      ),
    );
  }
}
