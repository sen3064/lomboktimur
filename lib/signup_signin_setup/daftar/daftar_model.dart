import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forgot_reset_password/forgot_password/forgot_password_widget.dart';
import '/forgot_reset_password/verify_code/verify_code_widget.dart';
import '/main.dart';
import '/onboarding/onboarding/onboarding_widget.dart';
import '/signup_signin_setup/login_page/login_page_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DaftarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for firstName widget.
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for Confpassword widget.
  TextEditingController? confpasswordController;
  late bool confpasswordVisibility;
  String? Function(BuildContext, String?)? confpasswordControllerValidator;
  // Stores action output result for [Backend Call - API (User Register)] action in Button widget.
  ApiCallResponse? apiResultu52;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    confpasswordVisibility = false;
  }

  void dispose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    phoneNumberController?.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    confpasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
