import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_it/models/user.dart';

class UserDatabaseService {
  final String uid;
  UserDatabaseService({required this.uid});

  // Collection Refrence
  final CollectionReference userdatacollection =
      FirebaseFirestore.instance.collection('userdata');

  // Update or add user data
  Future updateUserData(String role, String username) async {
    return await userdatacollection.doc(uid).set({
      'username': username,
      'roles': role,
      'courses': [],
    });
  }

  // Add course to user data
  Future addCourseInUser(String courseid) async {
    return await userdatacollection.doc(uid).update({
      'courses': FieldValue.arrayUnion([courseid])
    });
  }

  // Getting User role from database
  // User role from snapshot
  UserRole _userRoleFromSnapshot(DocumentSnapshot snapshot) {
    return UserRole(
      userid: uid,
      role: snapshot['roles'],
      username: snapshot['username'],
      courses: snapshot['courses'],
    );
  }

  // User data stream
  Stream<UserRole> get userRole {
    return userdatacollection.doc(uid).snapshots().map(_userRoleFromSnapshot);
  }
}
