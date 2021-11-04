import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_it/models/course.dart';

class CourseDatabase {
  // Initiating the collection
  final CollectionReference courseCollection =
      FirebaseFirestore.instance.collection('coursedata');

  // Course List from the snapshot
  List<Course> _courseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Course(
        coursename: doc['coursename'],
        teachername: doc['teachername'],
        description: doc['description'],
        students: doc['enrolled_students'],
        teacherid: doc['teacherid'],
      );
    }).toList();
  }

  // Get course stream
  Stream<List<Course>> get courses {
    return courseCollection.snapshots().map(_courseListFromSnapshot);
  }
}
