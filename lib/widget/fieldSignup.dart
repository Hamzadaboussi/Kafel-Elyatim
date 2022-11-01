import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/Controller/signuncontroller.dart';

final numberField = TextFormField(
  controller: (s.getnumber()),
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

final postField = TextFormField(
  controller: s.getpost(),
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
    hintText: "Directeur,Secretair,Employer...",
    prefixIcon: Icon(
      Icons.account_circle,
      color: ve,
    ),
    labelText: "Post",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final usernameField = TextFormField(
  controller: s.getusern(),
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
    hintText: "Foulen",
    prefixIcon: Icon(
      Icons.person,
      color: ve,
    ),
    labelText: "Username",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final emailField = TextFormField(
  controller: s.getemail(),
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
    hintText: "Foulen@example.com",
    prefixIcon: Icon(
      Icons.email,
      color: ve,
    ),
    labelText: "Email",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final passwordField = TextFormField(
  obscureText: true,
  controller: s.getpass(),
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
    hintText: "Mot de pass",
    prefixIcon: Icon(
      Icons.lock,
      color: ve,
    ),
    labelText: "Mot de pass",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final repasswordField = TextFormField(
  obscureText: true,
  controller: s.geturepass(),
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
    hintText: "Mot de pass",
    prefixIcon: Icon(
      Icons.lock,
      color: ve,
    ),
    labelText: "Re-entrer Mot de pass",
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    hintStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

final fields = Padding(
  padding: EdgeInsets.only(top: 0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      usernameField,
      emailField,
      numberField,
      postField,
      passwordField,
      repasswordField,
    ],
  ),
);
