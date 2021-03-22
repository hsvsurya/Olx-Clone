import 'package:flutter/material.dart';

class ChatUsers {
  final int id;
  final String name;
  final List<Message> message;
  final String time;

  ChatUsers({
    @required this.id,
    @required this.name,
    @required this.message,
    @required this.time,
  });
}

class Message {
  final String messageText;
  final bool sender;
  Message({this.messageText, this.sender});
}

class ChatMessages extends ChangeNotifier {
  List<ChatUsers> _chatMessages = [
    ChatUsers(
      id: 0,
      name: 'Ravi',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
        Message(messageText: 'hello', sender: false),
      ],
    ),
    ChatUsers(
      id: 1,
      name: 'Siva',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
      id: 2,
      name: 'Ram',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
      id: 3,
      name: 'Dave',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
      id: 4,
      name: 'Will',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
      id: 5,
      name: 'Joe',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
  ];

  List<ChatUsers> get chatMessage {
    return _chatMessages;
  }
}
