import '/alamat/pilih_alamat_antar/pilih_alamat_antar_widget.dart';
import '/alamat/ubah_alamat_antar/ubah_alamat_antar_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PilihLokasiModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (user address delete)] action in Text widget.
  ApiCallResponse? apiResultftf;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
