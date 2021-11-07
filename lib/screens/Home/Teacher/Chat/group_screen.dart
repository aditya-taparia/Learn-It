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
  final _db = FirebaseFirestore.instance.collection('groups');

  void addGrp(grpName) {
    var id = Timestamp.now().toString();
    _db.doc(id).set({'name': grpName, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Groups"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Show Snackbar',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Container(
                      height: 200,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return val!.isEmpty ? 'Enter email Id' : null;
                            },
                            onChanged: (val) {
                              setState(() {
                                grpName = val;
                              });
                            },
                          ),
                          IconButton(
                              onPressed: () {
                                addGrp(grpName);
                              },
                              icon: Icon(Icons.add))
                        ],
                      ),
                    ));
                  });
            },
          ),
        ],
      ),
      body: Column(
        children: [Expanded(child: GroupList())],
      ),
    );
  }
}
