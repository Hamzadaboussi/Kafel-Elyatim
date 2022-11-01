import 'package:kafelelyatimee/Vue/addkid.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:kafelelyatimee/widget/autocompleate.dart';

verifqr(qr, cmmp, context) async {
  var code = qr[cmmp];
  if (qr[cmmp].toString() != "Unknown") {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            backgroundColor: Colors.white,
            content: Text("Votre Qr code est $code"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => addkid()),
                    );
                  },
                  child: Text('Continuer'))
            ],
          );
        });
  }
}

verif(context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          backgroundColor: Colors.white,
          content: Container(
            width: ((MediaQuery.of(context).size.width) / 2) - 45,
            height: 400,
            child: QrImage(
              data: "$ff2 $ff3 $ff4",
              version: QrVersions.auto,
              size: 250.0,
              gapless: false,
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Continuer'))
          ],
        );
      });
}
