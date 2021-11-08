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
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Course Name:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Please add course as course name + course code ",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: coursenameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.book,
                            color: Colors.indigo,
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Course Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Teacher Name:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.book,
                          color: Colors.indigo,
                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Teacher Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      initialValue: userRole!.username,
                      enabled: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Description:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: desController,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.book_online,
                          color: Colors.indigo,
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () async {
                              // Adding data in coursedata db
                              addToDB(
                                  coursenameController,
                                  userRole.username,
                                  desController,
                                  user.userid,
                                  userRole.courses.length);

                              // Updating current user course list
                              await UserDatabaseService(uid: user.userid)
                                  .addCourseInUser(
                                      '${user.userid}-${userRole.courses.length}');

                              // Clearing text fields
                              coursenameController.clear();
                              desController.clear();

                              // Routing to home page
                              Navigator.pop(context);

                              // Showing success snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        ' Course Successfully Added',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(0, 75, 141, 1)),
                            ),
                            child: const Text(
                              "Add Course",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
  String teachernameController,
  TextEditingController desController,
  uid,
  int length,
) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> stu = [];
  String courseid = '$uid-$length';
  Course course = Course(
    coursename: coursenameController.text,
    teachername: teachernameController,
    description: desController.text,
    students: stu,
    teacherid: uid,
    courseid: courseid,
    url: "",
  );

  await firebaseFirestore
      .collection("coursedata")
      .doc(courseid)
      .set(course.toMap());
}
