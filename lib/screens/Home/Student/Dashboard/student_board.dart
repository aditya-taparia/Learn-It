import 'package:flutter/material.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/services/userdatabase.dart';
import 'package:learn_it/shared/loading.dart';
import 'package:provider/provider.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({Key? key}) : super(key: key);

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
              title: const Text('Student Dashboard'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(userRole!.username),
                  Text(userRole.role),
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
