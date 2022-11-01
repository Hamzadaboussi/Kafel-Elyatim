import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/mainhome.dart';
import 'package:kafelelyatimee/models/user.dart';

class logincontroller {
  bool approuve = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String errormessage = "Restart and try again";

  login(context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                backgroundColor: Colors.white,
                content: Text("Bienvenu , Votre connection est reussite"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => mainhome()),
                        );
                      },
                      child: Text('Continuer'))
                ],
              );
            });
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('ERROR'),
                content: Text("Verifier votre Email ou Mot de pass"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              );
            });

        print(e);
      }
    }
  }

  Future<void> checkAuthentification(FirebaseAuth _auth, context) async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("home");
      }
    });
    return;
  }
}
