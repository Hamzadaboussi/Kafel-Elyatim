import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Controller/firebase.dart';
import 'package:kafelelyatimee/Vue/home.dart';
import 'package:kafelelyatimee/Vue/addkid.dart';
import 'package:kafelelyatimee/Controller/pdf_api.dart';
import 'package:kafelelyatimee/widget/button_widget.dart';
import 'package:kafelelyatimee/models/enfant.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';
import 'package:kafelelyatimee/widget/distributionfields_widget.dart';
import 'package:kafelelyatimee/Controller/distribution_controller.dart';
import 'package:kafelelyatimee/widget/Invoice_widget.dart';
import 'package:kafelelyatimee/widget/Kidscard_widget.dart';
import 'package:kafelelyatimee/Controller/check.dart';

String ss = "";
String tt = "";
String dd = "";
int cmp = 0;

var datas = Map<int?, int>();
var datat = Map<int?, int>();
var datad = Map<int?, int>();

var bl = Map<int?, String>();
var bf = Map<int?, String>();
var bs = Map<int?, String>();

class Distribution extends StatefulWidget {
  const Distribution({Key? key}) : super(key: key);

  @override
  _DistributionState createState() => _DistributionState();
}

class _DistributionState extends State<Distribution> {
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
    void ajouterfamille() {
      for (int ctr = 1; ctr <= cmp; ctr++) {
        enfant e1 = enfant(
            p.getbnp().text,
            p.getcin().text,
            p.getgou().text,
            p.getdel().text,
            Nomp[ctr].toString(),
            age[ctr].toString(),
            niveau[ctr].toString(),
            qrl[ctr].toString(),
            qrf[ctr].toString(),
            qrs[ctr].toString());
        Ajouterenfant(e1);
      }
      setState(() {
        cmp = 0;
        isVisible7 = false;
        isVisible6 = false;
        isVisible5 = false;
        isVisible4 = false;
        isVisible3 = false;
        isVisible2 = false;
        isVisible = false;
      });
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
                            "Gestion Du distribution",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        fields,
                        TextButton(
                          child: Text('Ajouer un enfant'),
                          onPressed: () {
                            ajouterenfant(cmp, context);
                          },
                        ),
                        Buildcards(context),
                        TextButton(
                          child: Text('Enregistrer'),
                          onPressed: () {
                            ajouterfamille();
                          },
                        ),
                        ButtonWidget(
                          text: 'Recu PDF',
                          onClicked: () async {
                            setState(() {
                              for (int ctr = 1; ctr <= cmp; ctr++) {
                                bl[ctr] = "non";
                                bf[ctr] = "non";
                                bs[ctr] = "non";
                                if (qrl[ctr] != "" && qrl[ctr] != "null") {
                                  bl[ctr] = "oui";
                                  print(bl[ctr]);
                                }
                                if (qrf[ctr] != "" && qrf[ctr] != "null") {
                                  bf[ctr] = "oui";
                                }
                                if (qrs[ctr] != "" && qrs[ctr] != "null") {
                                  bs[ctr] = "oui";
                                }
                              }
                            });
                            final pdfFile =
                                await PdfInvoiceApi.generate(invoice);
                            PdfApi.openFile(pdfFile);
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
