import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/Viewstock.dart';
import 'package:kafelelyatimee/Vue/gestiondustock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kafelelyatimee/Controller/query.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:kafelelyatimee/Vue/Distribution.dart';

var postn;
var usern;

int selectindex = 0;
var postFlag;
var reviews;

class mainhome extends StatefulWidget {
  const mainhome({Key? key}) : super(key: key);

  @override
  _mainhomeState createState() => _mainhomeState();
}

class _mainhomeState extends State<mainhome> {
  final screen = [gestiondustock(), Distribution(), Viewstock()];
  @override
  void initState() {
    super.initState();
    Post()
        .getpost(FirebaseAuth.instance.currentUser!.uid.toString())
        .then((QuerySnapshot docs) {
      if (docs.docs.isNotEmpty) {
        postFlag = true;
        reviews = docs.docs[0].data();
        usern = reviews?["displayName"] != null
            ? reviews["displayName"]
            : 'username';
        postn = reviews?["Post"] != null ? reviews["Post"] : 'Post';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color myHexColor = Color(0xffFEB819);
    Color Ge = Color(0x66EFEFEF);
    Color ve = Color(0xff5ABD8C);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: selectindex,
        height: 48.0,
        color: myHexColor,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        items: [
          Icon(Icons.device_hub_rounded, size: 30),
          Icon(Icons.add_to_photos_rounded, size: 30),
          Icon(Icons.visibility_rounded, size: 30),
        ],
        onTap: (index) {
          setState(() {
            selectindex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(microseconds: 300),
      ),
      body: screen[selectindex],
    );
  }
}
