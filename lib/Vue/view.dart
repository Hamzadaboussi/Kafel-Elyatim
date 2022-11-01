import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Controller/check.dart';
import 'package:kafelelyatimee/Vue/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kafelelyatimee/Controller/query.dart';
import 'package:kafelelyatimee/widget/cardwigdet.dart';
import 'package:kafelelyatimee/widget/autocompleate.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  _viewState createState() => _viewState();
}

class _viewState extends State<view> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
  bool postFlag = false;

  var reviews;

  bool postFlagg = false;
  var nbrstock;
  var dd;
  var tt;
  var dataa;

  getUser() async {
    checkAuthentification(_auth, context);
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();

    //this.checkAuthentification();
    this.getUser();
    if (ff2 != "") {
      Nbstock().getnbstock(ff1!, ff2!).then((QuerySnapshot dos) {
        if (dos.docs.isNotEmpty) {
          postFlagg = true;
          dataa = dos.docs[0].data();
          nbrstock = dataa["Nombre en stock"];
          tt = dataa["Nombre en attente"];
          dd = dataa["Nombre distribuer"];
        }
      });
    }
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
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            ff1!,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            ff2!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: buildImageInteractionCard(),
                        ),
                        Visibility(
                          visible: true,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: buildImageInteractionCard2(),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: buildImageInteractionCard3(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
