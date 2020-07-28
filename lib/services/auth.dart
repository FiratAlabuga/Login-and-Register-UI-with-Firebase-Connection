import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String pass);
  Future<String> createUserWithEmailAndPassword(String email, String pass);
  Future<String> currentUser();
}

class Auth implements BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String pass) async {
    FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: pass)) as FirebaseUser;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String pass) async {
    FirebaseUser user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass))
        as FirebaseUser;
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user != null ? user.uid : null;
  }
}
