import 'package:flutter/material.dart';
import 'package:learn_it/screens/wrapper.dart';
import 'package:learn_it/services/auth.dart';
import 'package:learn_it/shared/constant.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // For Auth Connection
  final AuthService _authService = AuthService();
  // For validation
  final _formKey = GlobalKey<FormState>();

  // For textfield
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Disable back button on appbar
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                // Email Field
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) {
                    return val!.isEmpty ? 'Enter email Id' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // Email Field
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) {
                    return val!.length < 6 ? 'Enter long password' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = _authService
                            .signInWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'could not sign in with those credentials';
                          });
                        } else {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Wrapper()));
                        }
                      }
                    }),
                const SizedBox(height: 12),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
