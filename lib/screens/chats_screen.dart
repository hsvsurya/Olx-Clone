import 'package:flutter/material.dart';
import 'package:olx_clone/Models/chat_users.dart';
import 'package:olx_clone/screens/chat_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = 'chat-screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // NOTE - This variable is used to update the message in the chat screen everytime a new message is sent

  List<int> _numOfmsgs = List.generate(6, (index) => 0);

  @override
  Widget build(BuildContext context) {
    var chatMessage = Provider.of<ChatMessages>(context).chatMessage;
    return Scaffold(
      //NOTE - Displays chat lists

      body: ListView.builder(
        itemCount: chatMessage.length,
        itemBuilder: (BuildContext ctx, int ind) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: ChatDetailScreen(index: ind),
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 300),
                ),
              ).then((value) {
                setState(() {
                  _numOfmsgs[ind] = chatMessage[ind].message.length;
                });
              });
            },
            child: ListTile(
              title: Text('${chatMessage[ind].name}'),
              subtitle: Text(
                _numOfmsgs[ind] == 0
                    ? '${chatMessage[ind].message[_numOfmsgs[ind]].messageText}'
                    : '${chatMessage[ind].message[_numOfmsgs[ind] - 1].messageText}',
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              trailing: Text('${chatMessage[ind].time}'),
            ),
          );
        },
      ),
    );
  }
}
