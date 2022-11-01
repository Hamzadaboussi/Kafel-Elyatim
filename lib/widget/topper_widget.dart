import 'package:flutter/material.dart';
import 'package:kafelelyatimee/mainhome.dart';

topper() => Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            children: [
              Image.asset("assets/Logo.png", width: 190),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 30,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0),
                    child: Text(
                      usern,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "fonts/Gadugi.ttf",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0, top: 0),
                    child: Text(
                      postn,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "fonts/Gadugi.ttf",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
