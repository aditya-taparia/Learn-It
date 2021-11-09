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

  // function that executes when we click button.
  var _uname, _role;
  // ignore: prefer_typing_uninitialized_variables
  void getUname() async {
    await FirebaseFirestore.instance
        .collection('userdata')
        .doc(_uid)
        .get()
        .then((value) {
      _uname = value.data()?["username"];
      _role = value.data()?["roles"];
    });
    print(_uname);
    _sendMessage();
  }

  void _sendMessage() async {
    _controller.clear();
    await _db.collection('groups').doc(widget.grpId).collection('chat').add({
      'text': _enteredMessage.trim(),
      'time': Timestamp.now(),
      'uid': _uid,
      'uname': _uname,
      'role': _role
    });
    await _db.collection('groups').doc(widget.grpId).update({
      'time': Timestamp.now(),
      'recent': _enteredMessage.trim(),
      'recent-time': Timestamp.now().toDate().hour.toString() +
          ":" +
          Timestamp.now().toDate().minute.toString()
    });
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
            maxLines: null,
            keyboardType: TextInputType.multiline,
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
            onPressed: _enteredMessage.trim().isEmpty ? null : getUname,
          ),
        ],
      ),
    );
  }
}
