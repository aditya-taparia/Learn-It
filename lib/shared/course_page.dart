import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/screens/Settings/setting.dart';
import 'package:learn_it/services/userdatabase.dart';
import 'package:learn_it/shared/course/calendar.dart';
import 'package:learn_it/shared/course/upload.dart';
import 'package:learn_it/shared/nofound.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'loading.dart';

class CoursePage extends StatefulWidget {
  final Course course;

  const CoursePage({Key? key, required this.course}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final gmeetcontroller = new TextEditingController();
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
              title: Text(widget.course.coursename
                  .substring(0, widget.course.coursename.length - 6)),
              backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0)),
                          color: Color.fromRGBO(0, 74, 140, 1),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text(
                              widget.course.teachername,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                            child: CircleAvatar(
                              radius: 65,
                              child: Text(
                                widget.course.coursename.substring(
                                    widget.course.coursename.length - 6),
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Registered : "),
                      Text(widget.course.students.length.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About Course",
                          style: TextStyle(
                            fontSize: 20,
                            // color: Color.fromRGBO(0, 75, 141, 1),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.course.description,
                          style: const TextStyle(
                            fontSize: 14,
                            // color: Color.fromRGBO(0, 75, 141, 1),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: InkWell(
                                  child: Container(
                                    height: 190,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Colors.blueAccent.withOpacity(0.8)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 10, 8, 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Professor",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            widget.course.teachername,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: InkWell(
                                  child: Container(
                                    height: 190,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Colors.blueAccent.withOpacity(0.9)),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                                      child: Text(
                                        "Course Preview",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: InkWell(
                                  child: Container(
                                    height: 190,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Colors.blueAccent.withOpacity(0.8)),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                                      child: Text(
                                        "Syllabus",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Nofound()));
                                  },
                                ),
                              ),
                              widget.course.teacherid == user.userid
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: InkWell(
                                        child: Container(
                                          height: 190,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blueAccent
                                                  .withOpacity(0.9)),
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8, 10, 8, 8),
                                            child: Text(
                                              "Registered Students",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (context) => Scaffold(
                                                            appBar: AppBar(
                                                              backgroundColor:
                                                                  const Color
                                                                          .fromRGBO(
                                                                      0,
                                                                      75,
                                                                      141,
                                                                      1),
                                                            ),
                                                            body: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                SizedBox(
                                                                  height: 500,
                                                                  child: ListView
                                                                      .builder(
                                                                          padding: const EdgeInsets.all(
                                                                              8),
                                                                          itemCount: widget
                                                                              .course
                                                                              .students
                                                                              .length,
                                                                          itemBuilder:
                                                                              (BuildContext context, int index) {
                                                                            return Text(
                                                                              widget.course.students[index],
                                                                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                                                                            );
                                                                          }),
                                                                )
                                                              ],
                                                            ),
                                                          )));
                                        },
                                      ),
                                    )
                                  : Container(
                                      width: 0,
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Course Rating",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.course.teacherid != user.userid
                                ? widget.course.students.contains(user.userid)
                                    ? const SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                            onPressed: null,
                                            child: Text("Enrolled")),
                                      )
                                    : SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                            onPressed: () => addcourseid(
                                                widget.course, user, userRole),
                                            child: const Text("Enroll")))
                                : SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Edit Description'),
                                    ),
                                  ),
                            widget.course.teacherid != user.userid
                                ? SizedBox(
                                    //student
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          gottourl(
                                              widget.course.url.toString());
                                        },
                                        child: const Text("Join Classroom")))
                                : SizedBox(
                                    //prof
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                      child: const Text("Add meet"),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Add Meet'),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text(
                                                        'Copy Paste your Gmeet link here'),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    TextField(
                                                      autofocus: false,
                                                      controller:
                                                          gmeetcontroller,
                                                      decoration:
                                                          InputDecoration(
                                                              prefixIcon: Icon(
                                                                  Icons.link),
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          15,
                                                                          20,
                                                                          15),
                                                              hintText:
                                                                  "Gmeet Link",
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              )),
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          updateurl(
                                                              gmeetcontroller,
                                                              widget.course);
                                                          gmeetcontroller
                                                              .clear();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("ADD")),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Upload()));
                                    },
                                    child: const Text("Upload"))),
                            widget.course.teacherid != user.userid
                                ? SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Nofound()));
                                        },
                                        child: const Text("Pending work")),
                                  )
                                : SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Add work")),
                                  )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.course.teacherid != user.userid
                                ? SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Calendar()));
                                        },
                                        child: const Text("Calendar")))
                                : SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Calendar()));
                                        },
                                        child: const Text("Add Event"))),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Setting()));
                                  },
                                  child: const Text("Settings")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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

addcourseid(Course course, Users user, UserRole? userRole) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  course.students.add(user.userid);
  var a = course.students;
  userRole!.courses.add(course.courseid);
  var b = userRole.courses;

  firebaseFirestore
      .collection('coursedata')
      .doc(course.courseid)
      .update({"enrolled_students": a});

  firebaseFirestore
      .collection('userdata')
      .doc(user.userid)
      .update({"courses": b});
}

updateurl(TextEditingController gmeetcontroller, Course course) {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String a = gmeetcontroller.text;
  firebaseFirestore
      .collection('coursedata')
      .doc(course.courseid)
      .update({"url": a});
}

void gottourl(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
