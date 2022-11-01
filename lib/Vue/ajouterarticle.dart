import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/widget/autocompleate.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';
import 'package:kafelelyatimee/Controller/Verifqr_controller.dart';
import 'package:kafelelyatimee/Controller/check.dart';
import 'package:kafelelyatimee/widget/cretaeshareqrcode_Ajouarticle.dart';

class ajouterarticle extends StatefulWidget {
  @override
  _ajouterarticleState createState() => _ajouterarticleState();
}

TextEditingController mycontroller = new TextEditingController();

class _ajouterarticleState extends State<ajouterarticle> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
  GlobalKey globalKey = new GlobalKey();

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
    checkAuthentification(_auth, context);
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background.jpg"), fit: BoxFit.cover)),
        child: !isloggedin
            ? CircularProgressIndicator()
            : Scaffold(
                body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      topper(), //top bar
                      //bar
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Identifier un Paquet",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35, left: 30),
                              child: Icon(
                                Icons.bookmark_add,
                                color: ve,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35, left: 10),
                              child: Text(
                                "Niveau d'étude",
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
                          child: f3(),
                          color: Ge,
                        ),
                      ), //f2
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 30),
                              child: Icon(
                                Icons.bookmark_add,
                                color: ve,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                "Type : ",
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
                            top: 10, left: 20, right: 20, bottom: 0),
                        child: Container(
                          child: f4(),
                          color: Ge,
                        ),
                      ), //f3
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 30),
                              child: Icon(
                                Icons.bookmark_add,
                                color: ve,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Text(
                                "Section :",
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
                            top: 10, left: 20, right: 20, bottom: 0),
                        child: Container(
                          child: f5(),
                          color: Ge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            verif(context);
                          },
                          child: Text('Generer Le code',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: myHexColor,
                            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 2),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 2, bottom: 2),
                            child: Text(
                              "$ff2 $ff3 $ff4",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Ge,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 50),
                          child: createqrShare(context)),
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}
