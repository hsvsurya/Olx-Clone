import 'package:flutter/material.dart';

class ChatUsers {
  final String name;
  final String messageText;
  final String time;

  ChatUsers({
    @required this.name,
    @required this.messageText,
    @required this.time,
  });
}

class ChatMessages extends ChangeNotifier{
  List<ChatUsers> chatMessages = [
    ChatUsers(name: 'Ravi', messageText: 'Hello', time: '1:23'),
    ChatUsers(name: 'Siva', messageText: 'Hello', time: '1:23'),
    ChatUsers(name: 'Ram', messageText: 'Hello', time: '1:23'),
    ChatUsers(name: 'Dave', messageText: 'Hello', time: '1:23'),
    ChatUsers(name: 'Will', messageText: 'Hello', time: '1:23'),
    ChatUsers(name: 'Joe', messageText: 'Hello', time: '1:23'),
  ];
}


