import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';
import 'package:learn_it/models/user.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Course"),
        backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Course"),
              SizedBox(
                height: 30,
              ),
              Text("Course Name"),
              Text(
                "Please add course as course name + course code ",
                style: TextStyle(color: Colors.grey),
              ),
              TextFormField(
                autofocus: false,
                controller: coursenameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.book),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Course Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Teacher Name"),
              TextFormField(
                controller: teachernameController,
                autofocus: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.book),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Teacher Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Description"),
              TextFormField(
                controller: desController,
                autofocus: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.book_online),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () => Addtodb(
                              coursenameController,
                              teachernameController,
                              desController,
                              user!.userid),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(0, 75, 141, 1)),
                          ),
                          child: Text("ADD"))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Addtodb(
    TextEditingController coursenameController,
    TextEditingController teachernameController,
    TextEditingController desController,
    uid) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> stu = [];
  Course course = Course(
      coursename: coursenameController.text,
      teachername: teachernameController.text,
      description: desController.text,
      students: stu,
      teacherid: uid);

  print(uid);
  print(coursenameController.text);
  await firebaseFirestore
      .collection("coursedata")
      .doc(coursenameController.text
          .substring(0, coursenameController.text.length - 6))
      .set(course.toMap());
}
