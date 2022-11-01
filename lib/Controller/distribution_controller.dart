import 'package:kafelelyatimee/models/Parent.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/addkid.dart';

TextEditingController _bnompController = TextEditingController();
TextEditingController _cinController = TextEditingController();
TextEditingController _gouverneratController = TextEditingController();
TextEditingController _delegationController = TextEditingController();
TextEditingController _numberController = TextEditingController();

Parent p = Parent(_bnompController, _cinController, _gouverneratController,
    _delegationController, _numberController);

affichefacture(int i, int comp, var obj) {
  if (i < comp + 2) {
    return obj;
  } else
    return "";
}

void ajouterenfant(cmp, context) {
  if (cmp == 7) {
    cmp = 0;
  }
  cmp = cmp + 1;

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => addkid()),
  );
}
