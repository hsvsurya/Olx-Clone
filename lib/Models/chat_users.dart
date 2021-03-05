import 'package:flutter/material.dart';

class ChatUsers {
  final String name;
  final List<Message> message;
  final String time;

  ChatUsers({
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
      name: 'Ravi',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
        Message(messageText: 'hello', sender: false),
      ],
    ),
    ChatUsers(
      name: 'Siva',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
      name: 'Ram',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
      name: 'Dave',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
      name: 'Will',
      time: '1:23',
      message: [
        Message(messageText: 'hello', sender: true),
      ],
    ),
    ChatUsers(
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
