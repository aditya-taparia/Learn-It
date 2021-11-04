import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCourse extends StatelessWidget {
  const LoadingCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: SpinKitChasingDots(
          color: Color.fromRGBO(0, 74, 140, 1),
          size: 50.0,
        ),
      ),
    );
  }
}
