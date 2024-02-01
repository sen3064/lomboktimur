import 'package:kolaka/backend/api_requests/api_manager.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forgot_reset_password/successfully/successfully_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for password widget.
  TextEditingController? mailController;
  String? Function(BuildContext, String?)? mailControllerValidator;
  TextEditingController? passwordController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordController1Validator;
  // State field(s) for password widget.
  TextEditingController? passwordController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordController2Validator;
  // Stores action output result for [Backend Call - API (User Verify OTP)] action in Button widget.
  ApiCallResponse? apiResult0e6789;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    passwordController1?.dispose();
    passwordController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
