import 'package:kelotimaja/backend/api_requests/api_manager.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
// import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  var scanned = '';

  /// Initialization and disposal methods.

  bool? switchValue;

  ApiCallResponse? apiResult0e56789hi;
  void initState(BuildContext context) {}

  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
