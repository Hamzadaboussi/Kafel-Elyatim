import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/login.dart';
import 'package:kafelelyatimee/Vue/signup.dart';
import 'package:kafelelyatimee/Vue/signup.dart';
import 'package:kafelelyatimee/Vue/gestiondustock.dart';
import 'package:kafelelyatimee/mainhome.dart';
import 'package:kafelelyatimee/Colors/colors.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/login.dart': (BuildContext context) => mainhome(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Kafel El Yatim',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(56.0),
                child: Image.asset(
                  "assets/Logo.png",
                  width: 295,
                  height: 97,
                ),
              ), //Logo
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.asset("assets/hey.jpg"),
              ), //Marhaba
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset("assets/Bienvenu.jpg"),
              ), //Bienvenu
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    foregroundColor: myHexColor,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 5),
                    child: Text(
                      "      Se connecter      ",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Gadugi",
                      ),
                    ),
                  ),
                ),
              ), //Button1
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: myHexColor,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 5),
                    child: Text(
                      "          S'inscrire         ",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Gadugi",
                      ),
                    ),
                  ),
                ),
              ), //Button2
            ],
          ),
        ),
      ),
    );
  }
}
