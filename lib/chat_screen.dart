import 'package:flutter/material.dart';
import 'package:learn_it/chat_widgets/message.dart';
import 'package:learn_it/chat_widgets/message_sent.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Expanded(child: Messages()), MessageSend()],
        ),
      ),
    );
  }
}
