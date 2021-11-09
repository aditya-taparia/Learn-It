import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/services/coursedatabase.dart';
import 'package:learn_it/services/userdatabase.dart';
import 'package:learn_it/shared/course_page.dart';
import 'package:learn_it/shared/loading.dart';
import 'package:provider/provider.dart';

class ProfDashboard extends StatelessWidget {
  const ProfDashboard({Key? key}) : super(key: key);

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
              title: const Text('Professor Dashboard'),
              backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
              elevation: 0,
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    CustomPaint(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      painter: HeaderCurvedContainer(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 65,
                            child: Image.asset('assets/teacher.png'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userRole!.username,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent[100],
                  ),
                  child: Text(
                      '√ Verified ${userRole.role.toString()[0].toUpperCase()}${userRole.role.toString().substring(1)}',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Your Courses",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Codata(usercourse: userRole.courses),
                )
              ],
            ),
          );
        } else {
          return const Loading();
        }
      },
    );
  }
}

// ignore: must_be_immutable
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
      child: CircularProgressIndicator(
        color: Color.fromRGBO(0, 75, 141, 1),
      ),
    );
  }
  if (courses.isEmpty) {
    return const Center(
      child: Text(
        "No Course Created",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
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
  return ListView.builder(
      itemCount: sub.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoursePage(course: courses[index]),
                ),
              );
            },
            leading: const Icon(
              Icons.book,
              color: Colors.indigo,
            ),
            title: Text(
              sub[index],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent[100],
                borderRadius: BorderRadius.circular(100.0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: const Text("Owner"),
            ),
          ),
        );
      });
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color.fromRGBO(0, 75, 141, 1);
    Path path = Path()
      ..relativeLineTo(0, 90)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 90)
      ..relativeLineTo(0, -90)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
