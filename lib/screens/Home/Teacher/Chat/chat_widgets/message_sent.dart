import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageSend extends StatefulWidget {
  final String grpId;
  @override
  _MessageSendState createState() => _MessageSendState();
  const MessageSend(this.grpId, {Key? key}) : super(key: key);
}

class _MessageSendState extends State<MessageSend> {
  final _uid = FirebaseAuth.instance.currentUser?.uid;
  var _enteredMessage = '';
  final _controller = TextEditingController();
  final _db = FirebaseFirestore.instance;

  void _sendMessage() async {
    _controller.clear();
    await _db
        .collection('groups')
        .doc(widget.grpId)
        .collection('chat')
        .add({'text': _enteredMessage, 'time': Timestamp.now(), 'uid': _uid});
    setState(() {
      _enteredMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter the message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.5),
              ),
            ),
            onChanged: (val) {
              setState(() {
                _enteredMessage = val;
              });
            },
          )),
          //This button sends message.
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
              shape: const CircleBorder(),
            ),
            child: const Padding(
              padding: EdgeInsets.all(3),
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 25,
              ),
            ),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
