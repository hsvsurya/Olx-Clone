import 'package:flutter/material.dart';
import 'package:olx_clone/Models/chat_users.dart';
import 'package:provider/provider.dart';

class ChatDetailScreen extends StatefulWidget {
  final int index;

  ChatDetailScreen({this.index});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var chatMessage = Provider.of<ChatMessages>(context).chatMessages;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(right: 4),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                '${chatMessage[widget.index].name}',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        // padding: EdgeInsets.all(20),
        reverse: true,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Message...',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[800]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber,
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  color: Colors.orange,
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5,bottom: 15),
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.6,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal,
                  ),
                  margin: EdgeInsets.only(bottom: 15,left: 10, right: 20),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${chatMessage[widget.index].messageText}'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
