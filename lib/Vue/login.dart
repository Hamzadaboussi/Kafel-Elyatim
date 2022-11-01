import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:kafelelyatimee/Vue/signup.dart';
import 'package:kafelelyatimee/Controller/logincontroller.dart';
import 'package:kafelelyatimee/widget/login_form_widget.dart';

class login extends StatefulWidget {
  logincontroller i = logincontroller();
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  logincontroller i = logincontroller();

  @override
  void initState() {
    super.initState();
    this.i.checkAuthentification(_auth, context);
  }

  logincontroller user = new logincontroller();

  navigateToSignUp() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  @override
  Widget build(BuildContext context) {
    theme:
    ThemeData(fontFamily: 'Gadugi');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 56, left: 56, top: 45),
                  child: Image.asset(
                    "assets/Logo.png",
                    width: 295,
                    height: 97,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 120, top: 22),
                  child: Text(
                    "Connection",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "fonts/Gadugi.ttf",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), //Log//logo
                form(user, context),
                SizedBox(
                  height: 10.0,
                ),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    child: Text('Create an Account?'),
                    onTap: navigateToSignUp,
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
