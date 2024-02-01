import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transaksi_copy_model.dart';
export 'transaksi_copy_model.dart';

class TransaksiCopyWidget extends StatefulWidget {
  const TransaksiCopyWidget({Key? key}) : super(key: key);

  @override
  _TransaksiCopyWidgetState createState() => _TransaksiCopyWidgetState();
}

class _TransaksiCopyWidgetState extends State<TransaksiCopyWidget> {
  late TransaksiCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransaksiCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 80.0,
                  height: 30.0,
                  child: custom_widgets.Countstepper004(
                    width: 80.0,
                    height: 30.0,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 200.0,
                    child: custom_widgets.Timepickersheet0021(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 200.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
