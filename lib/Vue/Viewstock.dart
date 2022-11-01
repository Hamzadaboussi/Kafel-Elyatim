import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/ajouterarticle.dart';
import 'package:kafelelyatimee/Vue/home.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:kafelelyatimee/Vue/signup.dart';
import 'package:kafelelyatimee/Vue/gestiondustock.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kafelelyatimee/Controller/query.dart';
import 'package:kafelelyatimee/Vue/ajouterstock.dart';
import 'package:kafelelyatimee/Vue/ajouterarticle.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:kafelelyatimee/Vue/view.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/widget/autocompleate.dart';
import 'package:kafelelyatimee/models/datamodel.dart';
import 'package:kafelelyatimee/Controller/check.dart';
import 'package:kafelelyatimee/mainhome.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';

String ss = "";
String tt = "";
String dd = "";
data? yo;

class Viewstock extends StatefulWidget {
  const Viewstock({Key? key}) : super(key: key);

  @override
  _ViewstockState createState() => _ViewstockState();
}

class _ViewstockState extends State<Viewstock> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  bool postFlagg = false;

  TextEditingController _QuantiteController =
      TextEditingController(); //variable Quantité
  TextEditingController _PrixController =
      TextEditingController(); //variable prix

  bool _isVisible = false;
  bool _isVisible2 = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void shownumber() {
    setState(() {
      _isVisible2 = !_isVisible2;
    });
  }

  getUser() async {
    checkAuthentification(_auth, context);
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/home.dart': (BuildContext context) => home(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Kafel El Yatim',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background.jpg"), fit: BoxFit.cover)),
        child: !isloggedin
            ? CircularProgressIndicator()
            : Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        topper(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 35, left: 30),
                                child: Icon(
                                  Icons.bookmark_add,
                                  color: ve,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 35, left: 10),
                                child: Text(
                                  "Type d'article :",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 30, right: 30, bottom: 10),
                          child: Container(
                            child: AutocompleteB(),
                            color: Ge,
                          ),
                        ),
                        Visibility(
                            visible: !_isVisible,
                            child: TextButton(
                              child: Text('Show Niveau'),
                              onPressed: () {
                                showToast();
                              },
                            )), //f2
                        Visibility(
                          visible: _isVisible,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 30),
                                  child: Icon(
                                    Icons.bookmark_add,
                                    color: ve,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 10),
                                  child: Text(
                                    "Niveau d'etude :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _isVisible,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 0),
                            child: Container(
                              child: d2(),
                              color: Ge,
                            ),
                          ),
                        ), //f1
                        Visibility(
                            visible: !_isVisible2,
                            child: TextButton(
                              child: Text('Show Quantité'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => view()),
                                );
                              },
                            )),

                        //FloatingActionButton(onPressed: signOut)//Logo
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
