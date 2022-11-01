import 'package:kafelelyatimee/Vue/addkid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:scan/scan.dart';
import 'package:images_picker/images_picker.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:kafelelyatimee/widget/topper_widget.dart';
import 'package:kafelelyatimee/Controller/Verifqr_controller.dart';

import '../Controller/check.dart';

String qrcode = 'Unknown';

var qr = Map<int?, String>();

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String _platformVersion = 'Unknown';
  ScanController controller = ScanController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
  var reviews;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    checkAuthentification(_auth, context);
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              topper(),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        child: Text("    Ouvrire Mode Torch    "),
                        style: ElevatedButton.styleFrom(
                          primary: myHexColor,
                        ),
                        onPressed: () {
                          controller.toggleTorchMode();
                        },
                      ),
                    ),
                    ElevatedButton(
                      child: Text("Pause Scan "),
                      onPressed: () {
                        controller.pause();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: myHexColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        child: Text("Resume Scan"),
                        onPressed: () {
                          controller.resume();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: myHexColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text("   Importer une Image   "),
                      onPressed: () async {
                        List<Media>? res = await ImagesPicker.pick();
                        if (res != null) {
                          String? str = await Scan.parse(res[0].path);
                          if (str != null) {
                            setState(() {
                              qr[cmmp] = str;
                              verifqr(qr, cmmp, context);
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: myHexColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 360,
                  height: 400,
                  child: ScanView(
                    controller: controller,
                    scanAreaScale: .7,
                    scanLineColor: Colors.green.shade400,
                    onCapture: (data) {
                      setState(() {
                        qr[cmmp] = data;
                        print(qr[cmmp]);
                        verifqr(qr, cmmp, context);
                      });
                    },
                  ),
                ),
              ),
              // Text('scan result is $qrcode'),
            ],
          ),
        ),
      ),
    );
  }
}
