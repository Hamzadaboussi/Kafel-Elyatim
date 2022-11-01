import 'dart:io';
import 'Dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'Dart:async';

Future<void> writeToFile(ByteData data, String path) async {
  final buffer = data.buffer;
  await File(path)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

Future<String> createQrPicture(String qr) async {
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final ts = DateTime.now().millisecondsSinceEpoch.toString();
  String path = '$tempPath/$ts.png';

  final qrValidationResult = QrValidator.validate(
    data: qr,
    version: QrVersions.auto,
    errorCorrectionLevel: QrErrorCorrectLevel.L,
  );
  if (qrValidationResult.status == QrValidationStatus.valid) {
    final qrCode = qrValidationResult.qrCode;
    final painter = QrPainter.withQr(
      qr: qrCode!,
      color: const Color(0xFF000000),
      gapless: true,
      embeddedImageStyle: null,
      embeddedImage: null,
    );

    final picData =
        await painter.toImageData(2048, format: ui.ImageByteFormat.png);
    await writeToFile(picData!, path);
  }

  return path;
}
