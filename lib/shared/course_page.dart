import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
  final gmeetcontroller = TextEditingController();
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
              centerTitle: true,
              title: Text(widget.course.coursename),
              backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CustomPaint(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        painter: HeaderCurvedContainer(),
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
                              backgroundImage: AssetImage('assets/teacher.png'),
                              radius: 75,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[200],
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        child:Row(
                            children:  <Widget>[
                            Text("Registered : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ) ,),
                              Text(widget.course.students.length.toString(),
                                style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ) ,),

                            ],

                        )

                      ),
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
                            fontWeight: FontWeight.w600,
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
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            const Text(
                            "CourseID:  ",
                            style: TextStyle(
                              fontSize: 20,
                              // color: Color.fromRGBO(0, 75, 141, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                            Container(
                                decoration: BoxDecoration(
                                  color: Color
                                      .fromRGBO(
                                      0,
                                      75,
                                      141,
                                      1),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 10.0,
                                ),
                                child:Row(
                                  children:  <Widget>[

                                    Text(
                                      widget.course.coursename.substring(widget.course.coursename.length - 6),
                                      style: TextStyle(
                                        color:Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ) ,),

                                  ],

                                )

                            ),
                        ]),
                        const SizedBox(
                          height: 8,
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
                                    width: 250,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF009ffd),
                                            const Color(0xff5b5bc9),
                                          ],),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Professor",
                                            textAlign: TextAlign.center,

                                            style: TextStyle(
                                                fontSize: 20,
                                              color: Colors.white,
                                            ),

                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            widget.course.teachername,
                                            style:
                                                const TextStyle(
                                                    fontSize: 18,
                                                color:Colors.white,
                                                ),
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
                                    width: 250,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFF009ffd),
                                          const Color(0xff5b5bc9),
                                        ],),
                                        borderRadius: BorderRadius.circular(20),
                                        ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                                      child: Text(
                                        "Course Preview",
                                        style: TextStyle(
                                            fontSize: 20,
                                          color:Colors.white,
                                        ),
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
                                    width: 250,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFF009ffd),
                                          const Color(0xff5b5bc9),
                                        ],),
                                        borderRadius: BorderRadius.circular(20),
                                       ),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                                      child: Text(
                                        "Syllabus",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                          color:Colors.white,
                                        ),
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
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Course Rating",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
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
                          height: 40,
                        ),
                         Text('Class Room Options',
                             style:TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.w500,
                             )
                         ),
                        const SizedBox(
                          height: 15,
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
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Center(
                                                child: Text(
                                                  "Add Meet",
                                                  style: TextStyle(
                                                    fontSize: 22.5,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        0, 75, 141, 1),
                                                  ),
                                                ),
                                              ),
                                              content: Form(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 2.0,
                                                        horizontal: 0.0,
                                                      ),
                                                      child: TextFormField(
                                                        validator: (val) {
                                                          return val!.isEmpty
                                                              ? 'Enter Link'
                                                              : null;
                                                        },
                                                        autofocus: false,
                                                        controller:
                                                            gmeetcontroller,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter Gmeet Link',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.5),
                                                          ),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons
                                                                .add_link_outlined,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    75,
                                                                    141,
                                                                    1),
                                                            size: 30.0,
                                                          ),
                                                          prefixIconColor:
                                                              const Color
                                                                      .fromRGBO(
                                                                  0,
                                                                  75,
                                                                  141,
                                                                  1),
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      3.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    updateurl(gmeetcontroller,
                                                        widget.course);
                                                    gmeetcontroller.clear();
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Icon(
                                                              Icons
                                                                  .check_circle_outline_rounded,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Text(
                                                              ' Gmeet Link Added',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        backgroundColor:
                                                            Colors.green,
                                                      ),
                                                    );
                                                  },
                                                  child: const Text(
                                                    'Add Gmeet Link',
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          0, 75, 141, 1),
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        MaterialStateColor
                                                            .resolveWith(
                                                                (states) => Colors
                                                                    .blue
                                                                    .withOpacity(
                                                                        0.25)),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Close',
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red[600],
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        MaterialStateColor
                                                            .resolveWith(
                                                                (states) => Colors
                                                                    .red
                                                                    .withOpacity(
                                                                        0.25)),
                                                  ),
                                                ),
                                              ],
                                              actionsAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              /* 
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    
                                                    TextField(
                                                      autofocus: false,
                                                      controller:
                                                          gmeetcontroller,
                                                      decoration:
                                                          InputDecoration(
                                                              prefixIcon:
                                                                  const Icon(
                                                                      Icons
                                                                          .link),
                                                              contentPadding:
                                                                  const EdgeInsets
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
                                                          
                                                        },
                                                        child:
                                                            const Text("ADD")),
                                                  ],
                                                ),
                                              ), */
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

