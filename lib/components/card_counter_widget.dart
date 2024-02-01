import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_counter_model.dart';
export 'card_counter_model.dart';

class CardCounterWidget extends StatefulWidget {
  const CardCounterWidget({Key? key}) : super(key: key);

  @override
  _CardCounterWidgetState createState() => _CardCounterWidgetState();
}

class _CardCounterWidgetState extends State<CardCounterWidget> {
  late CardCounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardCounterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().CountController =
                      FFAppState().CountController + -1;
                },
                child: Icon(
                  FFIcons.kminusCirlceCopy,
                  color: FlutterFlowTheme.of(context).accent1,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    FFAppState().CountController.toString(),
                    'null',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyLargeFamily,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyLargeFamily),
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    FFAppState().CountController =
                        FFAppState().CountController + 1;
                  });
                },
                child: Icon(
                  FFIcons.kaddCircleCopy,
                  color: FlutterFlowTheme.of(context).accent1,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
