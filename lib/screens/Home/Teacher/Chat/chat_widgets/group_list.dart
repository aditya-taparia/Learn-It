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
  final Stream<QuerySnapshot> _groupStream = FirebaseFirestore.instance
      .collection('groups')
      .orderBy('time', descending: true)
      .snapshots();

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
            return GestureDetector(
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
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, bottom: 0, left: 10, right: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage('assets/group.png'),
                          ),
                          const SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(data['name'],
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 75, 141, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(height: 5.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  data['recent'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            data['recent-time'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
            // return Padding(
            //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            //   child: Card(
            //     elevation: 2,
            // child: ListTile(
            //   leading: const CircleAvatar(
            //     backgroundImage: AssetImage('assets/group.png'),
            //   ),
            //   trailing: const Icon(Icons.keyboard_arrow_right),
            //   title: Text(data['name']),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ChatScreen(
            //           grpId: data['id'].toString(),
            //           grpName: data['name'],
            //         ),
            //       ),
            //     );
            //   },
            // ),
            //   ),
            // );
          }).toList(),
        );
      },
    );
  }
}
