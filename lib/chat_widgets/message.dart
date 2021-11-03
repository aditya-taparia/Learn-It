import 'package:flutter/material.dart';
import 'package:learn_it/chat_widgets/message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return MessageBubble();
          }),
    );
  }
}
