// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<IconData> termIconGenerator(String term) async {
  // generate icon based on terms

  IconData icon;
  switch (term) {
    case "Parkir":
      icon = Icons.local_parking;
      break;
    case "Laundry":
      icon = Icons.local_laundry_service;
      break;
    case "Wifi":
      icon = Icons.wifi;
      break;
    case "Restaurant / Cafe":
      icon = Icons.restaurant;
      break;
    case "Playground":
      icon = Icons.play_circle_outline;
      break;
    default:
      icon = Icons.ac_unit;
  }
  return icon;
}
