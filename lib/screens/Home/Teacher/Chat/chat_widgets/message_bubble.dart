import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, this.uid, this.uname, {Key? key})
      : super(key: key);

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
            color: uid == currUid ? Colors.blue[100] : Colors.teal[100],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft:
                  uid == currUid ? const Radius.circular(20) : Radius.zero,
              bottomRight:
                  uid == currUid ? Radius.zero : const Radius.circular(20),
            ),
          ),
          width: 180,
          padding: const EdgeInsets.all(12.5),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            children: [
              Text(
                uname,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
