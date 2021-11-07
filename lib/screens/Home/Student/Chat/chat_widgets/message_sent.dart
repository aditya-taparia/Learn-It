import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/message_bubble.dart';

class MessageSend extends StatefulWidget {
  final String grpId;
  @override
  _MessageSendState createState() => _MessageSendState();
  MessageSend(this.grpId);
}

class _MessageSendState extends State<MessageSend> {
  final _uid = FirebaseAuth.instance.currentUser?.uid;
  var _enteredMessage = '';
  var _controller = new TextEditingController();
  final _db = FirebaseFirestore.instance;
  //function that executes when we click button.
  // void getUname() {
  //   final _uname = FirebaseFirestore.instance
  //       .collection('userdata')
  //       .doc(_uid)
  //       .get().then((value) => print(value))
  // }

  void _sendMessage() async {
    _controller.clear();

    print("is empty-----${_enteredMessage.isEmpty}");
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
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter the message'),
            onChanged: (val) {
              setState(() {
                _enteredMessage = val;
              });
            },
          )),
          //This button sends message.
          IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage),
        ],
      ),
    );
  }
}
