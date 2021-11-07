import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_it/models/chat.dart';

class ChatService {
  final CollectionReference _chatCollection =
      FirebaseFirestore.instance.collection('chat');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('group');

  List<Group> _groupListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Group(
        groupName: doc['name'],
      );
    }).toList();
  }

  Stream<List<Group>> get groups {
    return groupCollection.snapshots().map(_groupListFromSnapshot);
  }
}
