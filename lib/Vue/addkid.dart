import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/Distribution.dart';
import 'package:kafelelyatimee/Vue/home.dart';
import 'package:kafelelyatimee/Controller/query.dart';
import 'package:kafelelyatimee/Vue/qrscan.dart';
import 'package:kafelelyatimee/mainhome.dart';
import 'package:kafelelyatimee/Controller/check.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';
import 'package:kafelelyatimee/widget/autocompleate.dart';

int cmmp = 0;

var Nomp = Map<int?, String>();
var niveau = Map<int?, String>();
var age = Map<int?, String>();
var qrf = Map<int?, String>();
var qrl = Map<int?, String>();
var qrs = Map<int?, String>();

bool isVisible = false;
bool isVisible5 = false;
bool isVisible3 = false;
bool isVisible4 = false;
bool isVisible2 = false;
bool isVisible6 = false;
bool isVisible7 = false;

String ss = "";
String tt = "";
String dd = "";

class addkid extends StatefulWidget {
  const addkid({Key? key}) : super(key: key);

  @override
  _addkidState createState() => _addkidState();
}

class _addkidState extends State<addkid> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
  bool postFlag = false;
  var reviews;
  var reviews2;
  var reviews3;
  var reviews4;
  var id;
  var id1;
  var id2;
  bool postFlag2 = false;

  TextEditingController _BnompController = TextEditingController();
  TextEditingController _AgeController = TextEditingController();

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

  bool _li = false;
  bool _forni = false;
  bool _sacc = false;
  void visibleqr(int i) {
    setState(() {
      if (i == 1) {
        _li = !_li;
      }
      if (i == 2) {
        _forni = !_forni;
      }
      if (i == 3) {
        _sacc = !_sacc;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final BnompField = TextFormField(
      controller: _BnompController,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ve,
          ),
        ),
        hintText: "Foulen Ben foulen",
        prefixIcon: Icon(
          Icons.person,
          color: ve,
        ),
        labelText: "Nom et Prenom ",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final Age = TextFormField(
      controller: _AgeController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ve,
          ),
        ),
        hintText: "12",
        prefixIcon: Icon(
          Icons.date_range_rounded,
          color: ve,
        ),
        labelText: "Age",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10, right: 30, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BnompField,
          Age,
        ],
      ),
    );

    void rout(int i) {
      setState(() {
        cmmp = i;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScanPage()),
      );
    }

    void showcard() {
      setState(() {
        if (cmp == 1) {
          isVisible = true;
        }
        if (cmp == 2) {
          isVisible2 = true;
          isVisible = true;
        }
        if (cmp == 3) {
          isVisible3 = true;
          isVisible2 = true;
          isVisible = true;
        }
        if (cmp == 4) {
          isVisible4 = true;
          isVisible3 = true;
          isVisible2 = true;
          isVisible = true;
        }
        if (cmp == 5) {
          isVisible5 = true;
          isVisible4 = true;
          isVisible3 = true;
          isVisible2 = true;
          isVisible = true;
        }
        if (cmp == 6) {
          isVisible6 = true;
          isVisible5 = true;
          isVisible4 = true;
          isVisible3 = true;
          isVisible2 = true;
          isVisible = true;
        }
        if (cmp == 7) {
          isVisible7 = true;
          isVisible6 = true;
          isVisible5 = true;
          isVisible4 = true;
          isVisible3 = true;
          isVisible2 = true;
          isVisible = true;
        }
        print("asbaaaa");
        print(cmp);
      });
    }

    void ajouter() {
      setState(() {
        Nomp[cmp] = _BnompController.text;
        niveau[cmp] = ff1!;
        age[cmp] = _AgeController.text;
        qrl[cmp] = qr[1].toString();
        qrf[cmp] = qr[2].toString();
        qrs[cmp] = qr[3].toString();
        print(qrl[cmp]);
        showcard();

        Update().updateee(ff3, "Sac");

        Update().updateee(ff1, "Livre");

        Update().updateee(ff2, "Fourniture");

        selectindex = 1;
        qr[1] = "";
        qr[2] = "";
        qr[3] = "";
      });
      print(Nomp[cmp]);
      print(qrl[cmp]);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => mainhome()));
    }

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
                        topper(), //topbar
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "Ajouter un Enfant",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        fields,
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 30),
                                child: Icon(
                                  Icons.school,
                                  color: ve,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 10),
                                child: Text(
                                  "Niveau Scolaire",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), //niveautxt
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 30, right: 30, bottom: 10),
                          child: Container(
                            child: Autocompleteaddkid(),
                            color: Ge,
                          ),
                        ), //niveau
                        Visibility(
                            visible: !_li,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                              ),
                              onPressed: () {
                                visibleqr(1);
                              },
                              child: Text("Ajouter Des Livres ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                        Visibility(
                          visible: _li,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, left: 35),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          rout(1);
                                        },
                                        child: Text("Scan le Qr code du Livre ",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 5),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 2,
                                                bottom: 2),
                                            child: Text(qr[1].toString()),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                          ),
                        ), //QR
                        Visibility(
                            visible: !_forni,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                              ),
                              onPressed: () {
                                visibleqr(2);
                              },
                              child: Text("Ajouter Fourniture ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                        Visibility(
                          visible: _forni,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, left: 35),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          rout(2);
                                        },
                                        child: Text(
                                            "Scan le Qr code du Fourniture ",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 5),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 2,
                                                bottom: 2),
                                            child: Text(qr[2].toString()),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                          ),
                        ), //QR
                        Visibility(
                            visible: !_sacc,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                              ),
                              onPressed: () {
                                visibleqr(3);
                              },
                              child: Text("Ajouter un Sac ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                        Visibility(
                          visible: _sacc,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, left: 35),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          rout(3);
                                        },
                                        child: Text("Scan le Qr code du Sac ",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 5),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 2,
                                                bottom: 2),
                                            child: Text(qr[3].toString()),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                          ),
                        ), //QR
                        TextButton(
                          child: Text('Enregistrer'),
                          onPressed: () {
                            ajouter();
                          },
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
