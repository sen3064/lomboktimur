import 'package:get/get.dart';
import 'package:kolaka/backend/api_requests/api_manager.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/penginapan/detail_penginapan/detail_penginapan_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchProdukModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    // Trigger a rebuild of the UI when the loading state changes
    if (textController != null) {
      textController!.text = textController!.text;
    }
  }
  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  ApiCallResponse? apiResultija;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
