import 'package:flutter/material.dart';

class Parent {
  TextEditingController _bnompController = TextEditingController();
  TextEditingController _cinController = TextEditingController();
  TextEditingController _gouverneratController = TextEditingController();
  TextEditingController _delegationController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  Parent(
    TextEditingController u,
    TextEditingController e,
    TextEditingController p,
    TextEditingController r,
    TextEditingController n,
  ) {
    _bnompController = u;
    _cinController = e;
    _gouverneratController = p;
    _delegationController = r;
    _numberController = n;
  }
  TextEditingController getbnp() {
    return _bnompController;
  }

  TextEditingController getcin() {
    return _cinController;
  }

  TextEditingController getgou() {
    return _gouverneratController;
  }

  TextEditingController getdel() {
    return _delegationController;
  }

  TextEditingController getnumber() {
    return _numberController;
  }

  TextEditingController getpost() {
    return _numberController;
  }
}
