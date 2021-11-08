import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.uid, this.uname);
  final String message;
  final String uid;
  final String uname;

  @override
  Widget build(BuildContext context) {
    var currUid = FirebaseAuth.instance.currentUser?.uid;
    return Row(
        mainAxisAlignment:
            (uid == currUid) ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            width: 200,
            height: 60,
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              children: [
                Text(uname),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ]);
  }
}
