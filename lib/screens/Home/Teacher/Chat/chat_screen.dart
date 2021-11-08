import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/message.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/message_sent.dart';

class ChatScreen extends StatelessWidget {
  final String grpId;
  final String grpName;
  const ChatScreen({Key? key, required this.grpId, required this.grpName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(grpName),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: Messages(
              grpId: grpId,
            ),
          ),
          MessageSend(grpId)
        ],
      ),
    );
  }
}
