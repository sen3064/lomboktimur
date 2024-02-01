import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/makanan/custom_makanan/custom_makanan_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'makanan_sheet_model.dart';
export 'makanan_sheet_model.dart';

class MakananSheetWidget extends StatefulWidget {
  const MakananSheetWidget({
    Key? key,
    required this.makananJson,
  }) : super(key: key);

  final dynamic makananJson;

  @override
  _MakananSheetWidgetState createState() => _MakananSheetWidgetState();
}

class _MakananSheetWidgetState extends State<MakananSheetWidget> {
  late MakananSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakananSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                getJsonField(
                  widget.makananJson,
                  r'''$.banner''',
                )['200x150'],
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Text(
              getJsonField(
                widget.makananJson,
                r'''$.name''',
              ).toString(),
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineSmallFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineSmallFamily),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
            child: Text(
              getJsonField(
                widget.makananJson,
                r'''$.description''',
              ).toString(),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                    color: FlutterFlowTheme.of(context).secondary,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodySmallFamily),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Text(
              formatNumber(
                double.parse(getJsonField(
                  widget.makananJson,
                  r'''$.price''',
                ).toString()),
                formatType: FormatType.decimal,
                decimalType: DecimalType.commaDecimal,
                currency: 'Rp ',
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleLargeFamily),
                  ),
            ),
          ),
          if (getJsonField(
                widget.makananJson,
                r'''$.variants[:]''',
              ) !=
              null)
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomMakananWidget(
                            makananJson: widget.makananJson!,
                          ),
                        ),
                      );
                    },
                    text: 'Tambah',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
              ),
            ),
          if (getJsonField(
                widget.makananJson,
                r'''$.variants[:]''',
              ) ==
              null)
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().addMakananToJson ??=
                            []; // Inisialisasi jika null

                        bool isAdd = true;
                        for (int i = 0;
                            i < FFAppState().addMakananToJson.length;
                            i++) {
                          if (FFAppState().addMakananToJson[i]['id'] ==
                              widget.makananJson!['id']) {
                            setState(() {
                              // Jika item sudah ada dalam keranjang, tambahkan jumlahnya
                              FFAppState().addMakananToJson[i]['quantity'] =
                                  (FFAppState().addMakananToJson[i]
                                              ['quantity'] ??
                                          0) +
                                      1;
                              isAdd = false;
                            });
                            break;
                          }
                        }

                        if (isAdd) {
                          Map<String, dynamic> newCartSheetItem =
                              Map.from(widget.makananJson!);
                          newCartSheetItem['quantity'] = 1;
                          FFAppState().addMakananToJson.add(newCartSheetItem);
                        }
                        // FFAppState().addToAddMakananToJson(widget.makananJson!);
                      });
                      await Future.delayed(const Duration(milliseconds: 1000));
                      Navigator.pop(context);
                    },
                    text: 'Tambah',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
