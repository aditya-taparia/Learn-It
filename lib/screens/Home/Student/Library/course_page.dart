import 'package:flutter/material.dart';
import 'package:learn_it/models/course.dart';

class CoursePage extends StatelessWidget {
  final Course course;
  const CoursePage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.coursename),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(course.coursename),
            Text(course.teachername),
            Text(course.description),
            Text(course.students.toString()),
          ],
        ),
      ),
    );
  }
}
