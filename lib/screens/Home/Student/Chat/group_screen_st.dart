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
      backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
      appBar: AppBar(
        title: const Text("Chat Groups"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                )),
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
              child: GroupList(),
            ),
          ))
        ],
      ),
    );
  }
}
