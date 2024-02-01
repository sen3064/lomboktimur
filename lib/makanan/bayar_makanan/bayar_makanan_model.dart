// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/main.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class BayarMakananModel extends FlutterFlowModel {
//   ///  State fields for stateful widgets in this page.

//   final unfocusNode = FocusNode();

//   get timerController => null;

//   get timerMilliseconds => null;

//   set timerValue(String timerValue) {}

//   /// Initialization and disposal methods.

//   void initState(BuildContext context) {}

//   void dispose() {
//     unfocusNode.dispose();
//   }

//   /// Action blocks are added here.

//   /// Additional helper methods are added here.

// }

import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class BayarMakananModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer widget.
  int timerMilliseconds = 3600000;
  String timerValue = StopWatchTimer.getDisplayTime(
    3600000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
