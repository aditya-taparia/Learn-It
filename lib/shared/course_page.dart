import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';

import 'package:learn_it/screens/Settings/setting.dart';
import 'package:learn_it/shared/course/calendar.dart';
import 'package:learn_it/shared/course/upload.dart';
import 'package:learn_it/shared/nofound.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  final Course course;

  const CoursePage({Key? key, required this.course}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.coursename),
        backgroundColor: Color.fromRGBO(0, 75, 141, 1),
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
                  decoration: BoxDecoration(
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
                        style: TextStyle(
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
                          widget.course.coursename
                              .substring(widget.course.coursename.length - 6),
                          style: TextStyle(fontSize: 30),
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
                Text("Registered : "),
                Text(widget.course.students.length.toString()),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Course",
                    style: TextStyle(
                      fontSize: 20,
                      // color: Color.fromRGBO(0, 75, 141, 1),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.course.description,
                    style: TextStyle(
                      fontSize: 14,
                      // color: Color.fromRGBO(0, 75, 141, 1),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: InkWell(
                            child: Container(
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Professor",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      widget.course.teachername,
                                      style: TextStyle(fontSize: 18),
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
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                      builder: (context) => const Nofound()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: InkWell(
                            child: Container(
                              height: 190,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                      builder: (context) => Scaffold(
                                            appBar: AppBar(
                                              backgroundColor:
                                                  Color.fromRGBO(0, 75, 141, 1),
                                            ),
                                            body: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  height: 500,
                                                  child: ListView.builder(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      itemCount: widget.course
                                                          .students.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Text(
                                                          widget.course
                                                              .students[index],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        );
                                                      }),
                                                )
                                              ],
                                            ),
                                          )));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Course Rating",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Row(
                          children: [
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.course.students.contains(user!.userid)
                          ? SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: null, child: Text("Enrolled")),
                            )
                          : SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text("Enrolled"))),
                      SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Join Classroom"))),
                    ],
                  ),
                  SizedBox(
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
                                        builder: (context) => const Upload()));
                              },
                              child: Text("Upload"))),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Nofound()));
                            },
                            child: Text("Pending work")),
                      ),
                    ],
                  ),
                  SizedBox(
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
                                            const Calendar()));
                              },
                              child: Text("Calendar"))),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Setting()));
                            },
                            child: Text("Settings")),
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
  }
}
