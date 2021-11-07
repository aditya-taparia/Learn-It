import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/group_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  String grpName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Groups"),
      ),
      body: Column(
        children: [Expanded(child: GroupList())],
      ),
    );
  }
}
