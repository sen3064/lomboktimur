import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String? newCustomFunction(String? phone) {
  if (phone == null) {
    return '';
  }
  if (phone!.substring(0, 1) == '0') {
    return phone.substring(1);
  } else if (phone.substring(0, 2) == '62') {
    return phone.substring(2);
  }
}

String? formatDate(String? date) {
  // final parsedDate = DateFormat('d/M/y').parse(date!);
  final parsedDate = DateFormat('d/M/y', 'id').parse(date!);
  final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  return formattedDate;
}

String? viewDate(String? date) {
  final parsedDate = DateFormat('yyyy-MM-dd').parse(date!);
  final formattedDate = DateFormat('MMMEd', 'id_ID').format(parsedDate);
  return formattedDate;
}

String formatDDateTimes(String startDate) {
  final parsedDate = DateTime.parse(startDate);
  final formattedDate =
      DateFormat('E, MMM d HH:mm:ss', 'id_ID').format(parsedDate);
  return formattedDate;
}

FFLatLng? locationLatLng(
  double? mapLat,
  double? mapLng,
) {
  return FFLatLng(mapLat as double, mapLng as double);
}

List<dynamic>? convertJsonToListOfJson(dynamic jsonData) {
  List<dynamic> jsonList = jsonData as List<dynamic>;

  List<dynamic> listOfJson = jsonList.map((jsonItem) {
    return jsonItem as Map<String, dynamic>;
  }).toList();

  return listOfJson;
}
