import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tambah_model.dart';
export 'tambah_model.dart';

class TambahWidget extends StatefulWidget {
  const TambahWidget({Key? key}) : super(key: key);

  @override
  _TambahWidgetState createState() => _TambahWidgetState();
}

class _TambahWidgetState extends State<TambahWidget> {
  late TambahModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TambahModel());
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Tambah',
            icon: Icon(
              Icons.add,
              size: 15.0,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).accent1,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Container(
              width: 120.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).accent1,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.minus,
                  color: enabled
                      ? FlutterFlowTheme.of(context).accent1
                      : FlutterFlowTheme.of(context).alternate,
                  size: 15.0,
                ),
                incrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.plus,
                  color: enabled
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).alternate,
                  size: 15.0,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
                count: _model.countControllerValue ??= 1,
                updateCount: (count) =>
                    setState(() => _model.countControllerValue = count),
                stepSize: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
