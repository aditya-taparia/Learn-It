import 'package:flutter/material.dart';

class Nofound extends StatefulWidget {
  const Nofound({Key? key}) : super(key: key);

  @override
  _NofoundState createState() => _NofoundState();
}

class _NofoundState extends State<Nofound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 75, 141, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Not Found",
              style: TextStyle(fontSize: 20),
            ),
            Image.asset(
              'assets/No Result.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
