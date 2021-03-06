import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/screens/Home/Teacher/Library/addcourse.dart';
import 'package:learn_it/shared/course_page.dart';
import 'package:learn_it/services/coursedatabase.dart';
import 'package:learn_it/shared/loading_course.dart';
import 'package:provider/provider.dart';

class Tlibrary extends StatefulWidget {
  const Tlibrary({Key? key}) : super(key: key);

  @override
  _TlibraryState createState() => _TlibraryState();
}

class _TlibraryState extends State<Tlibrary> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Course>?>.value(
      value: CourseDatabase().courses,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Courses'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
          automaticallyImplyLeading: false,
        ),
        body: const CourseList(),
        backgroundColor: const Color(0x00CCCCCC),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.5),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Addcourse()));
          },
          backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
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
        child: LoadingCourse(),
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
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
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
    // Add this to use user db
    final user = Provider.of<Users?>(context);

    return course.teacherid == user!.userid
        ? Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursePage(course: course),
                    ),
                  );
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/student.png'),
                ),
                title: Text(course.coursename),
                subtitle: Text('Students Enrolled : ${course.students.length}'),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                  color: Color.fromRGBO(0, 75, 141, 1),
                ),
              ),
            ),
          )
        : Container(height: 0);
  }
}
