import 'package:flutter/material.dart';
import 'package:learn_it/services/auth.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signout();
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: const Text('logout'),
          ),
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
