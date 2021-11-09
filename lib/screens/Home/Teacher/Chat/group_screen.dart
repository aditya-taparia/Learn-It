import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_widgets/group_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final _formKey = GlobalKey<FormState>();
  String grpName = "";
  final _db = FirebaseFirestore.instance.collection('groups');

  void addGrp(grpName) async {
    var id = Timestamp.now().toString();
    await _db.doc(id).set({
      'name': grpName,
      'id': id,
      'time': Timestamp.now(),
      'recent': "",
      'recent-time': Timestamp.now().toDate().hour.toString() +
          ":" +
          Timestamp.now().toDate().minute.toString()
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 75, 141, 1),
      appBar: AppBar(
        title: const Text("Chat Groups"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
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
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Center(
                  child: Text(
                    'Create New Group',
                    style: TextStyle(
                      fontSize: 22.5,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 75, 141, 1),
                    ),
                  ),
                ),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 0.0,
                        ),
                        child: TextFormField(
                          validator: (val) {
                            return val!.isEmpty ? 'Enter email Id' : null;
                          },
                          onChanged: (val) {
                            setState(() {
                              grpName = val;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Group Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                            prefixIcon: const Icon(
                              Icons.group_rounded,
                              color: Color.fromRGBO(0, 75, 141, 1),
                              size: 30.0,
                            ),
                            prefixIconColor:
                                const Color.fromRGBO(0, 75, 141, 1),
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 3.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      addGrp(grpName);
                    },
                    child: const Text(
                      'Add Group',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 75, 141, 1),
                      ),
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.blue.withOpacity(0.25)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.red[600],
                      ),
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red.withOpacity(0.25)),
                    ),
                  ),
                ],
                actionsAlignment: MainAxisAlignment.spaceEvenly,
              );
            },
          );
        },
        tooltip: 'Create Group',
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 32,
        ),
        backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
      ),
    );
  }
}
