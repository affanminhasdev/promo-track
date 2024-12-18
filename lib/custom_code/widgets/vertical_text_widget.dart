// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

class VerticalTextWidget extends StatelessWidget {
  const VerticalTextWidget({
    Key? key,
    this.width,
    this.height,
    required this.text,
    required this.degree,
    required this.padding,
    required this.textColor,
    required this.fontSize,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String text;
  final int degree;
  final double padding;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: degree, // Angle de rotation (1 quart de tour = 90 degrés)
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
    );
  }
}
