// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_bar_code/code/code.dart';
import 'package:qr_bar_code/qr/qr.dart';

class QrCode extends StatefulWidget {
  const QrCode({
    super.key,
    this.width,
    this.height,
    required this.parkinRef,
  });

  final double? width;
  final double? height;
  final String parkinRef;

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        QRCode(data: widget.parkinRef),
      ],
    );
  }
}
