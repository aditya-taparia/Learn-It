import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_it/models/user.dart';
import 'package:learn_it/services/userdatabase.dart';

class AuthService {
  // private variable
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create Users object based on firebase user (User)
  Users? _userFromFirebase(User? user) {
    return user != null ? Users(userid: user.uid) : null;
  }

  // Changing stream on auth change
  Stream<Users?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // SignIn with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String role, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // Adding data in db for the new user
      await UserDatabaseService(uid: user!.uid).updateUserData(role, username);

      return _userFromFirebase(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  // Signout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
