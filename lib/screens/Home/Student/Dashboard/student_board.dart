import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/services/coursedatabase.dart';
import 'package:learn_it/services/userdatabase.dart';
import 'package:learn_it/shared/loading.dart';
import 'package:learn_it/shared/loading_course.dart';
import 'package:provider/provider.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return StreamBuilder<UserRole?>(
      stream: UserDatabaseService(uid: user!.userid).userRole,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserRole? userRole = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Student Dashboard'),
              backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(userRole!.username),
                  Text(userRole.role),
                  Codata(usercourse: userRole.courses)
                ],
              ),
            ),
          );
        } else {
          return const Loading();
        }
      },
    );
  }
}

class Codata extends StatefulWidget {
  List usercourse;
  Codata({Key? key, required this.usercourse}) : super(key: key);

  @override
  _CodataState createState() => _CodataState();
}

class _CodataState extends State<Codata> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Course>?>.value(
        value: CourseDatabase().courses,
        initialData: null,
        child: Comp(usercourse: widget.usercourse));
  }
}

class Comp extends StatefulWidget {
  final List usercourse;
  const Comp({Key? key, required this.usercourse}) : super(key: key);

  @override
  _CompState createState() => _CompState();
}

class _CompState extends State<Comp> {
  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<List<Course>?>(context);
    return Container(child: cou(widget.usercourse, courses));
  }
}

cou(List usercourse, List<Course>? courses) {
  List sub = [];
  if (courses == null) {
    return const Center(
      child: Text("Loading"),
    );
  }
  if (courses.isEmpty) {
    return const Center(
      child: Text("Empty"),
    );
  } else {
    for (int i = 0; i < courses.length; i++) {
      for (int x = 0; x < usercourse.length; x++) {
        if (courses[i].courseid == usercourse[x]) {
          sub.add(courses[i].coursename);
        }
      }
    }
  }
  return Text(sub.toString());
}
