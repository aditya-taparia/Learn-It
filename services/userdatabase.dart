import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_it/models/user.dart';

class UserDatabaseService {
  final String uid;
  UserDatabaseService({required this.uid});

  // Collection Refrence
  final CollectionReference userdatacollection =
      FirebaseFirestore.instance.collection('userdata');

  // Update or add user data

  // Getting User role from database
  // User role from snapshot
  UserRole _userRoleFromSnapshot(DocumentSnapshot snapshot) {
    return UserRole(
      userid: uid,
      role: snapshot['roles'],
    );
  }

  // User data stream
  Stream<UserRole> get userRole {
    return userdatacollection.doc(uid).snapshots().map(_userRoleFromSnapshot);
  }
}
