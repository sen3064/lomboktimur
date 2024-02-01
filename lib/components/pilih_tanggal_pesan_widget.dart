import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/transportasi/pesan_kendaraan_mobil/pesan_kendaraan_mobil_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pilih_tanggal_pesan_model.dart';
export 'pilih_tanggal_pesan_model.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PilihTanggalPesanWidget extends StatefulWidget {
  const PilihTanggalPesanWidget({
    Key? key,
    this.rentData,
  }) : super(key: key);

  final dynamic rentData;

  @override
  _PilihTanggalPesanWidgetState createState() =>
      _PilihTanggalPesanWidgetState();
}

class _PilihTanggalPesanWidgetState extends State<PilihTanggalPesanWidget> {
  var hour = 0;
  var minute = 0;
  late PilihTanggalPesanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PilihTanggalPesanModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    // String formattedTime = '$hour:$minute';

    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    String formattedTime = '$formattedHour:$formattedMinute';

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 750.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 8.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 3.0,
                                  indent: 150.0,
                                  endIndent: 150.0,
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 16.0, 0.0),
                                          child: Text(
                                            'Pilih Tanggal',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 350.0,
                                  child: custom_widgets.SfCalendar(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 350.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Waktu Penjemputan $formattedTime",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                            // color: Colors.black87,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              NumberPicker(
                                                minValue: 0,
                                                maxValue: 23,
                                                value: hour,
                                                zeroPad: true,
                                                // infiniteLoop: true,
                                                // itemWidth: 80,
                                                // itemHeight: 60,
                                                onChanged: (value) {
                                                  setState(() {
                                                    hour = value;
                                                  });
                                                },
                                                textStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                                selectedTextStyle:
                                                    const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 20),
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        top: BorderSide(
                                                          color: Colors.black87,
                                                        ),
                                                        bottom: BorderSide(
                                                            color: Colors
                                                                .black87))),
                                              ),
                                              NumberPicker(
                                                minValue: 0,
                                                maxValue: 59,
                                                value: minute,
                                                zeroPad: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    minute = value;
                                                  });
                                                },
                                                textStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                                selectedTextStyle:
                                                    const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 20),
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                        top: BorderSide(
                                                          color: Colors.black87,
                                                        ),
                                                        bottom: BorderSide(
                                                            color: Colors
                                                                .black87))),
                                              )
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setState(() {
                          FFAppState().startDate;
                          FFAppState().endDate;
                          FFAppState().formatedTime = formattedTime;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PesanKendaraanMobilWidget(
                              rentData: widget.rentData,
                            ),
                          ),
                        );
                      },
                      text: 'Simpan',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).accent1,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(21.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
