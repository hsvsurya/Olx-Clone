import 'package:flutter/material.dart';
import 'package:olx_clone/Models/chat_users.dart';
import 'package:olx_clone/screens/chat_detail_screen.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = 'chat-screen';

  @override
  Widget build(BuildContext context) {
    var chatMessage = Provider.of<ChatMessages>(context).chatMessages;
    return Scaffold(

      //NOTE - Displays chat rows

      body: ListView.builder(
        itemCount: chatMessage.length,
        itemBuilder: (BuildContext ctx, int ind) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return ChatDetailScreen(
                      index: ind,
                    );
                  },
                ),
              );
            },
            child: ListTile(
              title: Text('${chatMessage[ind].name}'),
              subtitle: Text('${chatMessage[ind].messageText}'),
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
