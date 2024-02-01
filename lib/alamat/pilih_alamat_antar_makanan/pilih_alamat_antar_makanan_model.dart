import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/makanan/home_makanan/home_makanan_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PilihAlamatAntarMakananModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
