import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/Controller/distribution_controller.dart';
import 'package:kafelelyatimee/models/article.dart';

final numberField = TextFormField(
  controller: p.getnumber(),
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
    hintText: "+216********",
    prefixIcon: Icon(
      Icons.phone,
      color: ve,
    ),
    labelText: "Numero du Telephone",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final BnompField = TextFormField(
  controller: p.getbnp(),
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

final CinField = TextFormField(
  controller: p.getcin(),
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
    hintText: "06587***",
    prefixIcon: Icon(
      Icons.credit_card,
      color: ve,
    ),
    labelText: "CIN",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final GouverneraField = TextFormField(
  obscureText: false,
  controller: p.getgou(),
  style: TextStyle(
    color: Colors.black,
  ),
  cursorColor: Colors.black,
  decoration: InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: ve,
      ),
    ),
    hintText: "Ariana",
    prefixIcon: Icon(
      Icons.home,
      color: ve,
    ),
    labelText: "Gouvernera",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final DelegationField = TextFormField(
  obscureText: false,
  controller: p.getdel(),
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
    hintText: "Sokra",
    prefixIcon: Icon(
      Icons.home_filled,
      color: ve,
    ),
    labelText: "Delegation",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final fields = Padding(
  padding: EdgeInsets.only(top: 15, right: 30, left: 30),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      BnompField,
      CinField,
      numberField,
      GouverneraField,
      DelegationField,
    ],
  ),
);

TextEditingController _QuantiteController =
    TextEditingController(); //variable Quantité
TextEditingController _PrixController = TextEditingController(); //variable prix

final QuantiteField = TextFormField(
  controller: _QuantiteController,
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
    hintText: "20",
    prefixIcon: Icon(
      Icons.format_list_numbered_sharp,
      color: ve,
    ),
    labelText: "Quantité",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);
final PrixField = TextFormField(
  controller: _PrixController,
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
    hintText: "20 Dinar ",
    prefixIcon: Icon(
      Icons.price_change,
      color: ve,
    ),
    labelText: "Prix",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

article a = article("", "", "", _QuantiteController.text, _PrixController.text);

TextEditingController _BnompController = TextEditingController();
TextEditingController _AgeController = TextEditingController();

final BnompFieldk = TextFormField(
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

final fieldsk = Padding(
  padding: EdgeInsets.only(top: 10, right: 30, left: 30),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      BnompFieldk,
      Age,
    ],
  ),
);
