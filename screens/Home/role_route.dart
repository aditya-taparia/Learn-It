import 'package:flutter/material.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/screens/Home/Student/student_nav.dart';
import 'package:learn_it/screens/Home/Teacher/teacher_nav.dart';
import 'package:learn_it/services/userdatabase.dart';
import 'package:provider/provider.dart';

class Roles extends StatefulWidget {
  const Roles({Key? key}) : super(key: key);

  @override
  _RolesState createState() => _RolesState();
}

class _RolesState extends State<Roles> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return StreamBuilder<UserRole?>(
      stream: UserDatabaseService(uid: user!.userid).userRole,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserRole? userRole = snapshot.data;
          if (userRole!.role == "student") {
            return const StudentNav();
          } else {
            return const TeacherNav();
          }
        } else {
          // Change it with Loading widget
          return const Text('Error');
        }
      },
    );
  }
}
