import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/group_list.dart';

class GroupScreenS extends StatefulWidget {
  const GroupScreenS({Key? key}) : super(key: key);

  @override
  State<GroupScreenS> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreenS> {
  String grpName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Groups"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
      ),
      body: Column(
        children: const [Expanded(child: GroupList())],
      ),
    );
  }
}
