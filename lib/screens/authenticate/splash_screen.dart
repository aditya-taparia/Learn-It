import 'package:flutter/material.dart';
import 'package:learn_it/screens/authenticate/sign_in.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(AnimatedRoute(child: const SignIn()));
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

// Creating animation for route
class AnimatedRoute extends PageRouteBuilder {
  final Widget child;
  AnimatedRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: const Duration(seconds: 1),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
}
