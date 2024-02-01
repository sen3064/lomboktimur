import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class CustomMakananModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.

  Map<dynamic, bool>? checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems => checkboxValueMap!.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for RadioButton widget.
  FormFieldController<Map<dynamic, String>>? radioButtonValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Map<dynamic, String>? get radioButtonValue =>
      radioButtonValueController?.value;
}
