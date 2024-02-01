import 'package:kelotimaja/transportasi/list_kendaraan_motor/list_kendaraan_motor_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'tombol_lihat_semua_model.dart';
export 'tombol_lihat_semua_model.dart';

class TombolLihatSemuaWidget extends StatefulWidget {
  const TombolLihatSemuaWidget({Key? key}) : super(key: key);

  @override
  _TombolLihatSemuaWidgetState createState() => _TombolLihatSemuaWidgetState();
}

class _TombolLihatSemuaWidgetState extends State<TombolLihatSemuaWidget> {
  late TombolLihatSemuaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TombolLihatSemuaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FFButtonWidget(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListKendaraanMotorWidget(
              typeVec: 'mobil',
            ),
          ),
        );
      },
      text: 'Lihat Semua',
      options: FFButtonOptions(
        width: double.infinity,
        height: 40,
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: Color(0xFFE0EFF6),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: FlutterFlowTheme.of(context).accent1,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(21),
      ),
      showLoadingIndicator: false,
    );
  }
}
