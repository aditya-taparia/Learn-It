import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/services/userdatabase.dart';
import 'package:learn_it/shared/loading_course.dart';
import 'package:provider/provider.dart';

class Addcourse extends StatefulWidget {
  const Addcourse({
    Key? key,
  }) : super(key: key);

  @override
  _AddcourseState createState() => _AddcourseState();
}

class _AddcourseState extends State<Addcourse> {
  final coursenameController = TextEditingController();
  final teachernameController = TextEditingController();
  final desController = TextEditingController();
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
              title: const Text("Add Course"),
              backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Add Course"),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Course Name:"),
                  const Text(
                    "Please add course as course name + course code ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: coursenameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.book),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Course Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Teacher Name:"),
                  TextFormField(
                    controller: teachernameController,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.book),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Teacher Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Description:"),
                  TextFormField(
                    controller: desController,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.book_online),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Adding data in coursedata db
                            addToDB(
                                coursenameController,
                                teachernameController,
                                desController,
                                user.userid,
                                userRole!.courses.length);

                            // Updating current user course list
                            await UserDatabaseService(uid: user.userid)
                                .addCourseInUser(
                                    '${user.userid}-${userRole.courses.length}');

                            // Clearing text fields
                            coursenameController.clear();
                            teachernameController.clear();
                            desController.clear();

                            // Routing to home page
                            Navigator.pop(context);

                            // Showing success snackbar
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Course Added"),
                              backgroundColor: Colors.green,
                            ));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(0, 75, 141, 1)),
                          ),
                          child: const Text("ADD"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const LoadingCourse();
        }
      },
    );
  }
}

// ignore: non_constant_identifier_names
addToDB(
  TextEditingController coursenameController,
  TextEditingController teachernameController,
  TextEditingController desController,
  uid,
  int length,
) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> stu = [];
  String courseid = '$uid-$length';
  Course course = Course(
      coursename: coursenameController.text,
      teachername: teachernameController.text,
      description: desController.text,
      students: stu,
      teacherid: uid,
      courseid: courseid);

  await firebaseFirestore
      .collection("coursedata")
      .doc(courseid)
      .set(course.toMap());
}
