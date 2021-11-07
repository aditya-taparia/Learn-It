import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_screen.dart';

class GroupList extends StatefulWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  GroupListState createState() => GroupListState();
}

class GroupListState extends State<GroupList> {
  final Stream<QuerySnapshot> _groupStream =
      FirebaseFirestore.instance.collection('groups').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _groupStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("error occured");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['name']),
              onTap: () {
                print("ontap ${data['name']}");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(grpId: data['id'].toString())));
              },
            );
          }).toList(),
        );
      },
    );
  }
}
