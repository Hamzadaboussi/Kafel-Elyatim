import 'package:flutter/material.dart';

class SigModel {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _postController = TextEditingController();
  SigModel(
      TextEditingController u,
      TextEditingController e,
      TextEditingController p,
      TextEditingController r,
      TextEditingController n,
      TextEditingController po) {
    _usernameController = u;
    _emailController = e;
    _passwordController = p;
    _repasswordController = r;
    _numberController = n;
    _postController = po;
  }
  TextEditingController getusern() {
    return _usernameController;
  }

  TextEditingController getemail() {
    return _emailController;
  }

  TextEditingController getpass() {
    return _passwordController;
  }

  TextEditingController geturepass() {
    return _repasswordController;
  }

  TextEditingController getnumber() {
    return _numberController;
  }

  TextEditingController getpost() {
    return _postController;
  }
}
