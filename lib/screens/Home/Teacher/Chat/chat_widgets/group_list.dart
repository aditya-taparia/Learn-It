import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/screens/Home/Teacher/Chat/chat_screen.dart';
import 'package:learn_it/shared/loading_course.dart';

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
          return const Text("error occured");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCourse();
        }
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/group.png'),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  title: Text(data['name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          grpId: data['id'].toString(),
                          grpName: data['name'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
