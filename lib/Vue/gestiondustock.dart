import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/ajouterarticle.dart';
import 'package:kafelelyatimee/Vue/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kafelelyatimee/Vue/ajouterstock.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/Controller/firebase.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';

final db = FirebaseFirestore.instance;

class gestiondustock extends StatefulWidget {
  const gestiondustock({Key? key}) : super(key: key);

  @override
  @override
  _gestiondustockState createState() => _gestiondustockState();
}

class _gestiondustockState extends State<gestiondustock> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
  bool postFlag = false;
  var reviews;
  int selectindex = 0;
  final screen = [home(), ajouterarticle(), ajouterstock()];

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("home");
      }
    });
  }

  getUser() async {
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
    this.checkAuthentification();
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
                          padding: const EdgeInsets.only(left: 20, top: 80),
                          child: Row(
                            children: [
                              Image.asset("assets/entre.jpg"),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 30),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: ve,
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0))),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ajouterstock()),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, bottom: 5),
                                        child: Text(
                                          "  Ajouter au Stock  ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Gadugi",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Image.asset("assets/add.jpg"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 80),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 00, right: 20),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: ve,
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0))),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ajouterarticle()),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, bottom: 5),
                                        child: Text(
                                          " Identifier un Article ",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Gadugi",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 25, top: 10),
                                    child: Image.asset("assets/qr.jpg"),
                                  )
                                ],
                              ),
                              Image.asset("assets/sortie.jpg"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 120, left: 0),
                          child: TextButton(
                            onPressed: () {
                              signOut(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              child: Text(
                                "Se deconnecter",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontFamily: "Gadugi",
                                ),
                              ),
                            ),
                            style: TextButton.styleFrom(
                                foregroundColor: ve,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))),
                          ),
                        ),

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
