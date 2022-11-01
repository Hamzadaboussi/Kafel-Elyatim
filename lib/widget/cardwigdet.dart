import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/Vue/Viewstock.dart';

Widget buildImageInteractionCard2() => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/attette.jpg"),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Nombre en attente : ",
                  style: TextStyle(
                    fontSize: 18,
                    color: myHexColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  tt.toString() != null ? tt.toString() : '0',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget buildImageInteractionCard() => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/stock.jpg"),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Nombre en stock : ",
                  style: TextStyle(
                    fontSize: 18,
                    color: myHexColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  ss.toString() != null ? ss.toString() : '0',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget buildImageInteractionCard3() => Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/distrib.jpg"),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Nombre distribuer : ",
                  style: TextStyle(
                    fontSize: 18,
                    color: myHexColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  dd.toString() != null ? dd.toString() : '0',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
