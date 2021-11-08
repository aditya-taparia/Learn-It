import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/screens/authenticate/sign_in.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 250.0,
                  child: TextLiquidFill(
                    text: 'LearnIt',
                    waveColor: const Color.fromRGBO(0, 75, 141, 1),
                    boxBackgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                    boxHeight: 100.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "Welcome to Learnit, Where anyone can follow their passion to Study, Learn, Teach from anyplace at anytime",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/Learn It Logo.png',
              height: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(0, 75, 141, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(AnimatedRoute(child: const SignIn()));
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
          child: Text("Made by team Aviat'O"),
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
          transitionDuration: const Duration(milliseconds: 1000),
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
