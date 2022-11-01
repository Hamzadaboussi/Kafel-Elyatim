import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Colors/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
import 'autocompleate.dart';
import '../Controller/createqr.dart';

String qri = ff1! + ff2! + ff3!;
createqrShare(context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            String path = await createQrPicture(qri);

            await Share.shareFiles([path],
                mimeTypes: ["image/png"],
                subject: 'My QR code',
                text: 'Please scan me');
          },
          child: Text("Envoyer L'image",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: ve,
            padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        Container(
          width: ((MediaQuery.of(context).size.width) / 2) - 45,
          height: 60,
          child: QrImage(
            data: "$ff2 $ff3 $ff4",
            version: QrVersions.auto,
            size: 250.0,
            gapless: false,
          ),
        ),
      ],
    );
