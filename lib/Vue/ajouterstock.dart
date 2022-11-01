import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kafelelyatimee/Controller/firebase.dart';
import 'package:kafelelyatimee/Vue/gestiondustock.dart';
import 'package:kafelelyatimee/Vue/qrscan.dart';
import 'package:kafelelyatimee/models/article.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/widget/autocompleate.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';
import 'package:kafelelyatimee/Controller/check.dart';
import 'package:kafelelyatimee/widget/distributionfields_widget.dart';

String code = qrcode; //uid

class ajouterstock extends StatefulWidget {
  const ajouterstock({Key? key}) : super(key: key);

  @override
  _ajouterstockState createState() => _ajouterstockState();
}

class _ajouterstockState extends State<ajouterstock> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Ajouter un Article",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 35),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ScanPage()),
                                      );
                                    },
                                    child: Text("Scan le code a barre (QR) ",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 0, top: 5),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 2,
                                            bottom: 2),
                                        child: Text(qrcode),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: myHexColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ), //scan
                            Image.asset(
                              "assets/barcode.jpg",
                            ),
                          ],
                        ),
                      ), //QR

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
                          child: AutocompleajoutStock(),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 0),
                        child: Container(
                          child: f2(),
                          color: Ge,
                        ),
                      ), //f1
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 20),
                              child: Container(
                                child: QuantiteField,
                                width: 160,
                              ),
                            ),
                            Container(
                              child: PrixField,
                              width: 160,
                            ),
                          ],
                        ),
                      ), //prix Quntite
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            article a1 = article(
                                qrcode.toString(),
                                ff1.toString(),
                                ff2.toString(),
                                a.quantite!,
                                a.prix!);
                            Ajoutarticle(a1);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => gestiondustock()));
                          },
                          child: Text('Ajouter au Stock',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                            backgroundColor: myHexColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
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
