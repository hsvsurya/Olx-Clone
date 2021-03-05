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
  TextEditingController _messageController = TextEditingController();
  int _numOfMsgs = 0;

  @override
  Widget build(BuildContext context) {
    var chatMessage = Provider.of<ChatMessages>(context).chatMessage;
    _numOfMsgs = chatMessage[widget.index].message.length;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // NOTE - Message bubbles

          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.2,
              // width: MediaQuery.of(context).size.width / 1.2,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 15),
                shrinkWrap: true,
                itemCount: _numOfMsgs,
                itemBuilder: (_, int ind) {
                  return Column(
                    children: [
                      Row(
                        /**NOTE - The message bubble align to right or left based on the sender 
                         * If you are the sender then the msessaged you send will be on right side
                       */

                        mainAxisAlignment:
                            chatMessage[widget.index].message[ind].sender
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Align(
                                // NOTE - The message in the message bubble aligns to the direction of the message bubble

                                alignment: (chatMessage[widget.index]
                                        .message[ind]
                                        .sender
                                    ? Alignment.topRight
                                    : Alignment.topLeft),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),

                                    /** NOTE - The color of message bubble changes based on sender
                                     *  grey color if you are sender and blue if your are receiver
                                     */

                                    color: (chatMessage[widget.index]
                                            .message[ind]
                                            .sender
                                        ? Colors.grey.shade200
                                        : Colors.blue[200]),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    chatMessage[widget.index]
                                        .message[ind]
                                        .messageText,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // NOTE - Send Functionality

          Row(
            children: [
              // NOTE - Text Field

              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  controller: _messageController,
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

              // NOTE - Send Button

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
                  onPressed: () {
                    String msg = _messageController.text.toString();
                    setState(() {
                      chatMessage[widget.index].message.add(
                            Message(
                              messageText: msg.toString(),
                              sender: true,
                            ),
                          );
                      _numOfMsgs++;
                      _messageController.clear();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
