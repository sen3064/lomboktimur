import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/alamat/pilih_alamat_kendaraan/pilih_alamat_kendaraan_widget.dart';
import '/components/pilih_tanggal_pesan_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/transportasi/list_pesanan_transportasi/list_pesanan_transportasi_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PesanKendaraanMobilModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  TextEditingController? textController1;
  FocusNode? textFieldFocusNode1;
  FFLatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  String? Function(BuildContext, String?)? textController1Validator;
  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
