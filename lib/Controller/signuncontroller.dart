import 'package:kafelelyatimee/Controller/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kafelelyatimee/Vue/home.dart';
import 'package:kafelelyatimee/widget/fieldSignup.dart';
import 'package:kafelelyatimee/models/SignupModel.dart';

TextEditingController _usernameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _repasswordController = TextEditingController();
TextEditingController _numberController = TextEditingController();
TextEditingController _postController = TextEditingController();

SigModel s = SigModel(
    _usernameController,
    _emailController,
    _passwordController,
    _repasswordController,
    _numberController,
    _postController);

Signup(context) async {
  try {
    await Firebase.initializeApp();
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    User? updateUser = FirebaseAuth.instance.currentUser;
    updateUser!.updateProfile(displayName: _usernameController.text);
    userSetup(_usernameController.text, _postController.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e.toString());
  }
}
