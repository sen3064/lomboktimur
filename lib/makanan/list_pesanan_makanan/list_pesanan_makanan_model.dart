import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/alamat/pilih_alamat_antar_makanan/pilih_alamat_antar_makanan_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/makanan/home_makanan/home_makanan_widget.dart';
import '/pembayaran/konfirmasi_pembayaran_makanan/konfirmasi_pembayaran_makanan_widget.dart';
import '/pembayaran/metode_pembayaran/metode_pembayaran_widget.dart';
import '/signup_signin_setup/login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListPesananMakananModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;

  /// Initialization and disposal methods.
  FFLatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
