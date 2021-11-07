import 'package:learn_it/models/user.dart';
import 'package:learn_it/screens/Home/role_route.dart';
import 'package:learn_it/screens/authenticate/start_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    if (user == null) {
      return const Center(
        child: StartScreen(),
      );
    } else {
      return const Roles();
    }
  }
}
