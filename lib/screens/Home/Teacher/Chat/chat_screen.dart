import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/message.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/message_sent.dart';

class ChatScreen extends StatelessWidget {
  final String grpId;
  const ChatScreen({Key? key, required this.grpId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Name"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages(
              grpId: grpId,
            )),
            MessageSend(grpId)
          ],
        ),
      ),
    );
  }
}
