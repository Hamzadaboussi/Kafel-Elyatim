import 'package:flutter/material.dart';
import 'package:kafelelyatimee/widget/fieldSignup.dart';
import 'package:kafelelyatimee/widget/Bottom_Signup_widget.dart';
import 'package:kafelelyatimee/widget/logowidget.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(right: 36, left: 36, top: 10),
              child: Container(
                height: mq.size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    logo(mq),
                    fields,
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: bottom(context, mq)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
