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
        courseid: doc['courseid'],
      );
    }).toList();
  }

  // Get course stream
  Stream<List<Course>> get courses {
    return courseCollection.snapshots().map(_courseListFromSnapshot);
  }
}

// Filter Class
class Filter {
  final String searchText;
  final String searchBy;

  Filter({required this.searchText, required this.searchBy});

  // Initiating the collection
  final CollectionReference filtercourseCollection =
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
        courseid: doc['courseid'],
      );
    }).toList();
  }

  // Get course stream
  Stream<List<Course>> get filtercourses {
    return filtercourseCollection
        .where(searchBy, isEqualTo: searchText)
        .snapshots()
        .map(_courseListFromSnapshot);
  }
}
