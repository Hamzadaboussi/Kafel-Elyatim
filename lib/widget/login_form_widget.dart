import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Colors/colors.dart';

form(user, context) => Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black,
      child: Container(
        child: Form(
          key: user.formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 40),
                child: Container(
                  child: TextFormField(
                      validator: (input) {
                        if (input!.isEmpty) return 'Entrer Email';
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: ve,
                          )),
                      onSaved: (input) => user.email = input!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 10),
                child: Container(
                  child: TextFormField(
                      validator: (input) {
                        if (input!.isEmpty)
                          return 'Entrer Mot de pass';
                        else if (input.length < 6) return 'Minimum 6 Character';
                      },
                      decoration: InputDecoration(
                        labelText: 'Mot de pass',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: ve,
                        ),
                      ),
                      obscureText: true,
                      onSaved: (input) => user.password = input!),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: user.login(context),
                child: Text('Se Connecter',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: myHexColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
