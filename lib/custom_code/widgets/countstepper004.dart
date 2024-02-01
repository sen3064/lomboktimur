// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Import FlutterFlow packages
import 'package:count_stepper/count_stepper.dart';

class Countstepper004 extends StatefulWidget {
  const Countstepper004({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _Countstepper004State createState() => _Countstepper004State();
}

class _Countstepper004State extends State<Countstepper004> {
  int count = 1; // Variable to store the count value

  @override
  Widget build(BuildContext context) {
    return CountStepper(
      iconColor: Theme.of(context).primaryColor,
      defaultValue: count,
      max: 10,
      min: 1,
      iconDecrementColor: Colors.red,
      splashRadius: 100,
      onPressed: (value) {
        setState(() {
          count = value; // Update the count value
        });
      },
    );
  }
}
