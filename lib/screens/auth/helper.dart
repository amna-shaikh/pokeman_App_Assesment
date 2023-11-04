import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokeman_app/screens/mainpage.dart';
import 'package:pokeman_app/screens/splashscreen.dart';

Future Login(String email, String pass, BuildContext context) async {
  try {
    final UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => mainpage()),
      );
    }
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text(
                  "Username does not exist",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
                ),
              ),
            );
          });
    } else if (e.code == 'invalid-email') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text('INVALID USERNAME'),
              ),
            );
          });
    } else if (e.code == 'wrong-password') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text('WRONG PASSWORD'),
              ),
            );
          });
    }
  }
}

class MainPage {}

Future AccountCreate(String email, String pass, BuildContext context) async {
  try {
    final UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => mainpage()),
      );
    }

    //await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text('Email Already exist'),
              ),
            );
          });
    }
  }
}
