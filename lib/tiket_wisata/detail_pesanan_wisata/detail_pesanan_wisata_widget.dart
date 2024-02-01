import 'package:kolaka/tiket_wisata/isi_data_wisata/isi_data_wisata_widget.dart';

import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'detail_pesanan_wisata_model.dart';
export 'detail_pesanan_wisata_model.dart';

class DetailPesananWisataWidget extends StatefulWidget {
  const DetailPesananWisataWidget({Key? key, this.startDate, this.dataTiket})
      : super(key: key);

  final String? startDate;
  final dynamic dataTiket;

  @override
  _DetailPesananWisataWidgetState createState() =>
      _DetailPesananWisataWidgetState();
}

class _DetailPesananWisataWidgetState extends State<DetailPesananWisataWidget> {
  late DetailPesananWisataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailPesananWisataModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    DateTime tanggal = DateTime.parse(widget.startDate!);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 54,
            icon: Icon(
              Icons.arrow_back_outlined,
              color: FlutterFlowTheme.of(context).primary,
              size: 24,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Detail Pesanan',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Poppins',
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleMediumFamily),
                ),
          ),
          actions: [],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4),
            child: Container(),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                thickness: 5,
                color: FlutterFlowTheme.of(context).tertiary,
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah Tiket',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Umum',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Text(
                                    formatNumber(
                                      double.parse(getJsonField(
                                        widget.dataTiket,
                                        r'''$.price''',
                                      ).toString()),
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                      currency: 'Rp ',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(30),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0x25000000),
                                    width: 1,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 10,
                                  ),
                                  incrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 10,
                                  ),
                                  countBuilder: (count) => Text(
                                    count.toString(),
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                  count: _model.countControllerValue1 ??= 1,
                                  updateCount: (count) => setState(() =>
                                      _model.countControllerValue1 = count),
                                  stepSize: 1,
                                  minimum: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Column(
                        //         mainAxisSize: MainAxisSize.max,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             'Anak-Anak',
                        //             style: FlutterFlowTheme.of(context)
                        //                 .bodyMedium
                        //                 .override(
                        //                   fontFamily:
                        //                       FlutterFlowTheme.of(context)
                        //                           .bodyMediumFamily,
                        //                   color: FlutterFlowTheme.of(context)
                        //                       .secondary,
                        //                   useGoogleFonts: GoogleFonts.asMap()
                        //                       .containsKey(
                        //                           FlutterFlowTheme.of(context)
                        //                               .bodyMediumFamily),
                        //                 ),
                        //           ),
                        //           Text(
                        //             'Rp. 20.000',
                        //             style: FlutterFlowTheme.of(context)
                        //                 .titleSmall
                        //                 .override(
                        //                   fontFamily:
                        //                       FlutterFlowTheme.of(context)
                        //                           .titleSmallFamily,
                        //                   color: FlutterFlowTheme.of(context)
                        //                       .error,
                        //                   useGoogleFonts: GoogleFonts.asMap()
                        //                       .containsKey(
                        //                           FlutterFlowTheme.of(context)
                        //                               .titleSmallFamily),
                        //                 ),
                        //           ),
                        //         ],
                        //       ),
                        //       Container(
                        //         width: 120,
                        //         height: 40,
                        //         decoration: BoxDecoration(
                        //           color: FlutterFlowTheme.of(context)
                        //               .primaryBackground,
                        //           borderRadius: BorderRadius.circular(30),
                        //           shape: BoxShape.rectangle,
                        //           border: Border.all(
                        //             color: Color(0x25000000),
                        //             width: 1,
                        //           ),
                        //         ),
                        //         child: FlutterFlowCountController(
                        //           decrementIconBuilder: (enabled) => FaIcon(
                        //             FontAwesomeIcons.minus,
                        //             color: enabled
                        //                 ? FlutterFlowTheme.of(context).primary
                        //                 : FlutterFlowTheme.of(context)
                        //                     .alternate,
                        //             size: 10,
                        //           ),
                        //           incrementIconBuilder: (enabled) => FaIcon(
                        //             FontAwesomeIcons.plus,
                        //             color: enabled
                        //                 ? FlutterFlowTheme.of(context).primary
                        //                 : FlutterFlowTheme.of(context)
                        //                     .alternate,
                        //             size: 10,
                        //           ),
                        //           countBuilder: (count) => Text(
                        //             count.toString(),
                        //             style:
                        //                 FlutterFlowTheme.of(context).titleSmall,
                        //           ),
                        //           count: _model.countControllerValue2 ??= 1,
                        //           updateCount: (count) => setState(() =>
                        //               _model.countControllerValue2 = count),
                        //           stepSize: 1,
                        //           minimum: 1,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 5,
                color: FlutterFlowTheme.of(context).tertiary,
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tanggal',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                functions.viewDate(
                                  functions.formatDate(
                                    dateTimeFormat('d/M/y', tanggal),
                                  ),
                                ),
                                'null',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Harga',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Text(
                                formatNumber(
                                  _model.countControllerValue1! *
                                      double.parse(widget.dataTiket['price']),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.commaDecimal,
                                  currency: 'Rp ',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IsiDataWisataWidget(
                                  tiketUmum: _model.countControllerValue1,
                                  // tiketAnak: _model.countControllerValue2,
                                  startDate: tanggal,
                                  dataTiket: widget.dataTiket,
                                  price: (_model.countControllerValue1! *
                                          double.parse(
                                              widget.dataTiket['price']))
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          text: 'Pesan',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(30),
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
    );
  }
}
