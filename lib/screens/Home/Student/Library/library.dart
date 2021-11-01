import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/services/auth.dart';
import 'package:learn_it/services/coursedatabase.dart';
import 'package:provider/provider.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Course>?>.value(
      value: CourseDatabase().courses,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Library'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                await _auth.signout();
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 32,
              ),
            )
          ],
          backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
        ),
        body: const CourseList(),
      ),
    );
  }
}

// Course List
class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<List<Course>?>(context);
    if (courses == null) {
      return const Center(
        child: Loading(),
      );
    }
    if (courses.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/No Result.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          const Center(
            child: Text(
              'No Course Found',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseTile(course: courses[index]);
        },
      );
    }
  }
}

// CourseTile
class CourseTile extends StatelessWidget {
  final Course course;
  const CourseTile({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(course.coursename),
          subtitle: Text('Taught by ${course.teachername}'),
        ),
      ),
    );
  }
}
