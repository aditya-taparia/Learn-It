import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  final String grpId;
  Messages({Key? key, required this.grpId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance
        .collection('groups')
        .doc(grpId)
        .collection('chat')
        .orderBy('time', descending: true)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _chatStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          reverse: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return MessageBubble(data['text'], data['uid'], data['uname']);
          }).toList(),
        );
      },
    );
  }
}
