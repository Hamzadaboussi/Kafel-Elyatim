import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> checkAuthentification(FirebaseAuth _auth, context) async {
  _auth.authStateChanges().listen((user) {
    if (user == null) {
      Navigator.of(context).pushReplacementNamed("home");
    }
  });
  return;
}
