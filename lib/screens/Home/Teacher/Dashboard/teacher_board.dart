import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/services/coursedatabase.dart';
import 'package:learn_it/services/userdatabase.dart';
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
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    CustomPaint(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      painter: HeaderCurvedContainer(),
                    ),
                    Container(
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(userRole.role),
                Codata(usercourse: userRole.courses)
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

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color.fromRGBO(0, 75, 141, 1);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
