
import 'package:flutter/material.dart';

String docid='';

class ChatPage extends StatefulWidget {
  //const ChatPage({Key? key}) : super(key: key);
  final String d;

  ChatPage({required this.d});


  @override
  _ChatPageState createState(){
    docid = d;
    return _ChatPageState();

  }
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(docid)
      ),

    );
  }
}



