import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(this.message, this.uid, this.uname, this.role, {Key? key})
      : super(key: key);

  final String message;
  final String uid;
  final String uname;
  final String role;

  @override
  Widget build(BuildContext context) {
    var currUid = FirebaseAuth.instance.currentUser?.uid;
    return Row(
      mainAxisAlignment:
          (uid == currUid) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 300),
          decoration: BoxDecoration(
            color: uid == currUid ? Colors.blue[100] : Colors.teal[100],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomLeft:
                  uid == currUid ? const Radius.circular(15) : Radius.zero,
              bottomRight:
                  uid == currUid ? Radius.zero : const Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(13),
          margin: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: uname + "\n ",
                  style: TextStyle(
                    color: (role == 'teacher')
                        ? Colors.teal
                        : const Color.fromRGBO(0, 75, 141, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ), // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
