import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/widget/registration_button_widget.dart';
import 'package:kafelelyatimee/Vue/login.dart';

bottom(context, mq) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton(context, mq),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "J'ai deja un compt",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: myHexColor,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
              child: Text(
                "Se connecter",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: myHexColor,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
