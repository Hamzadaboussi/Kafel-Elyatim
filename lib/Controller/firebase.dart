import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kafelelyatimee/models/enfant.dart';
import 'package:kafelelyatimee/models/article.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/home.dart';

signOut(context) async {
  FirebaseAuth.instance.signOut();
  Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
}

Future<void> userSetup(String displayName, String post) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  String number = auth.currentUser!.phoneNumber.toString();
  String Email = auth.currentUser!.email.toString();
  users.add({
    'displayName': displayName,
    'uid': uid,
    'phoneNumber': number,
    'Post': post,
    "Email": Email
  });

  return;
}

Future<void> Ajoutarticle(article a) async {
  CollectionReference Articles =
      FirebaseFirestore.instance.collection('Articles');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  String number = auth.currentUser!.phoneNumber.toString();
  String Email = auth.currentUser!.email.toString();
  Articles.add({
    'Qr Code': a.Code,
    'Type': a.type,
    'Niveau': a.niveau,
    'Quantité': a.quantite,
    "Prix": a.prix,
    'uid': uid,
  });

  return;
}

Future<void> Ajouterenfant(enfant e) async {
  CollectionReference Benificier =
      FirebaseFirestore.instance.collection('Benificier');
  FirebaseAuth auth = FirebaseAuth.instance;
  Benificier.add({
    'Nom du parrain': e.nomP,
    'Cin': e.cin,
    'Gouvernorat': e.gouvernorat,
    'delegation': e.delegation,
    "Nom du l'enfant": e.nomE,
    'niveau': e.niveau,
    'Qr code du livre': e.qrll,
    'Qr code du livre': e.qrff,
    'Qr code du sac': e.qrsc,
  });

  return;
}
