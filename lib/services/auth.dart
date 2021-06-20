import 'package:brew/models/myUser.dart';
import 'package:brew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  USER GETTERS

  //  GETTER 1
  //User? get user => _auth.currentUser;

  //  GETTER 2
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_myUserFromFireBaseUser);
    // .map((User? user) => _myUserFromFireBaseUser(user));
  }

  MyUser? _myUserFromFireBaseUser([User? user]) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //  PLAN B
  bool get hasUser => FirebaseAuth.instance.currentUser != null;

  //  Sign in as ANONYMOUS
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _myUserFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //  Sign in with EMAIL && PASSWORD
  Future signInEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _myUserFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //  Register with EMAIL && PASSWORD
  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData('0', 'New Sushi Crew', 100);

      return _myUserFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //  SIGN OUT
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
