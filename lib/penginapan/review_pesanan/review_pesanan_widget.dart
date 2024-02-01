import 'package:kolaka/backend/api_requests/api_calls.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pembayaran/konfirmasi_pembayaran_homestay/konfirmasi_pembayaran_homestay_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_pesanan_model.dart';
export 'review_pesanan_model.dart';

class ReviewPesananWidget extends StatefulWidget {
  const ReviewPesananWidget({
    Key? key,
    required this.homestayData,
    required this.startDate,
    required this.endDate,
    required this.accessToken,
    required this.rooms,
    required this.guests,
    required this.roomData,
    required this.userData,
    required this.countCntrler,
    required this.termsRoom,
    this.totPrice,
  }) : super(key: key);

  final dynamic homestayData;
  final String? startDate;
  final String? endDate;
  final String? accessToken;
  final String? rooms;
  final String? guests;
  final dynamic roomData;
  final dynamic userData;
  final int? countCntrler;
  final dynamic termsRoom;
  final double? totPrice;

  @override
  _ReviewPesananWidgetState createState() => _ReviewPesananWidgetState();
}

class _ReviewPesananWidgetState extends State<ReviewPesananWidget> {
  late ReviewPesananModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewPesananModel());
    _model.textController1 ??= TextEditingController(
        text:
            (((widget.countCntrler! *
                        (getJsonField(
                              widget.roomData,
                              r'''$.tmp_nights''',
                            ) *
                            double.parse(getJsonField(
                              widget.roomData,
                              r'''$.price_final''',
                            ).toString().toString()))) +
                    double.parse(FFAppState().taxAdmin)))
                .toString());
                
    _model.textController2 ??= TextEditingController(
        text: (((widget.countCntrler! *
                        double.parse(getJsonField(
                          widget.roomData,
                          r'''$.price_final''',
                        ).toString().toString())) *
                    double.parse(FFAppState().taxAdmin)) +
                (widget.countCntrler! *
                    double.parse(getJsonField(
                      widget.roomData,
                      r'''$.price_final''',
                    ).toString().toString())))
            .toString());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    print(_model.textController1);
    // String totLah = widget.totPrice!.toStringAsFixed(0);
    // print(_model.textController1.text.replaceAll('.0', ''));
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
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Review Pesanan',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyLargeFamily),
                ),
          ),
          actions: [],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: '1',
                      options: FFButtonOptions(
                        width: 20.0,
                        height: 20.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFD1ECF4),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              fontSize: 9.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Pesan',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    Icon(
                      Icons.horizontal_rule_rounded,
                      color: Color(0x1F000000),
                      size: 20.0,
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: '2',
                      options: FFButtonOptions(
                        width: 20.0,
                        height: 20.0,
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
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 10.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Review',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    Icon(
                      Icons.horizontal_rule_rounded,
                      color: Color(0x1F000000),
                      size: 20.0,
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: '3',
                      options: FFButtonOptions(
                        width: 20.0,
                        height: 20.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 10.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Bayar',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                'Mohon periksa kembali pesanan Anda sebelum melanjutkan ke pembayaran',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelSmallFamily,
                                      color: FlutterFlowTheme.of(context).info,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getJsonField(
                                      widget.homestayData,
                                      r'''$.title''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                ],
                              ),
                            ),
                            StyledDivider(
                              thickness: 1.0,
                              color: Color(0x35000000),
                              lineStyle: DividerLineStyle.dotted,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          'Check in',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          functions.viewDate(widget.startDate),
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        getJsonField(
                                          widget.homestayData,
                                          r'''$.check_in_time''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        getJsonField(
                                          widget.roomData,
                                          r'''$.tmp_nights''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                            ),
                                      ),
                                      Text(
                                        'Malam',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          'Check Out',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          functions.viewDate(widget.endDate),
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        getJsonField(
                                          widget.homestayData,
                                          r'''$.check_out_time''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            StyledDivider(
                              thickness: 1.0,
                              color: Color(0x35000000),
                              lineStyle: DividerLineStyle.dotted,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '(${widget.countCntrler?.toString()}x) ${getJsonField(
                                        widget.roomData,
                                        r'''$.title''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${widget.guests} Tamu',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (getJsonField(
                                        widget.roomData,
                                        r'''$.single_bed''',
                                      ) !=
                                      FFAppState().zeroVal)
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Single Bed',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (getJsonField(
                                        widget.roomData,
                                        r'''$.double_bed''',
                                      ) !=
                                      FFAppState().zeroVal)
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Double Bed',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (getJsonField(
                                        widget.roomData,
                                        r'''$.twin_bed''',
                                      ) !=
                                      FFAppState().zeroVal)
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Twin Bed',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 5.0),
                                child: Builder(
                                  builder: (context) {
                                    final listFacility = getJsonField(
                                      widget.homestayData,
                                      r'''$.terms_by_attribute_in_listing_page''',
                                    ).toList();
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(listFacility.length,
                                              (listFacilityIndex) {
                                        final listFacilityItem =
                                            listFacility[listFacilityIndex];
                                        return Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                widget.homestayData,
                                                r'''$.name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            StyledDivider(
                              thickness: 1.0,
                              color: Color(0x35000000),
                              lineStyle: DividerLineStyle.dotted,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rincian Tamu',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        widget.userData,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Text(
                                    getJsonField(
                                      widget.userData,
                                      r'''$.phone''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  Text(
                                    getJsonField(
                                      widget.userData,
                                      r'''$.email''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        StyledDivider(
                          thickness: 1.0,
                          color: Color(0x35000000),
                          lineStyle: DividerLineStyle.dotted,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(2.0, 2.0),
                            spreadRadius: 4.0,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(21.0),
                          topRight: Radius.circular(21.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Text(
                                      'Rincian Harga',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                              ],
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pajak & Biaya',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    Text(
                                      formatNumber(
                                        (widget.countCntrler! *
                                                double.parse(getJsonField(
                                                  widget.roomData,
                                                  r'''$.price_final''',
                                                ).toString())) *
                                            double.parse(FFAppState().taxAdmin),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'Rp ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    Text(
                                      // formatNumber(
                                      //   ((widget.countCntrler! *
                                      //               (getJsonField(
                                      //                     widget.roomData,
                                      //                     r'''$.tmp_nights''',
                                      //                   ) *
                                      //                   double.parse(getJsonField(
                                      //                     widget.roomData,
                                      //                     r'''$.price_final''',
                                      //                   ).toString()))) *
                                      //           double.parse(
                                      //               FFAppState().taxAdmin)) +
                                      //       (widget.countCntrler! *
                                      //           (getJsonField(
                                      //                 widget.roomData,
                                      //                 r'''$.tmp_nights''',
                                      //               ) *
                                      //               double.parse(getJsonField(
                                      //                 widget.roomData,
                                      //                 r'''$.price_final''',
                                      //               ).toString()))),
                                      //   formatType: FormatType.decimal,
                                      //   decimalType: DecimalType.commaDecimal,
                                      //   currency: 'Rp ',
                                      // ),
                                      formatNumber(
                                        (widget.countCntrler! *
                                            double.parse(getJsonField(
                                              widget.roomData,
                                              r'''$.price_final''',
                                            ).toString())),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'Rp ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                if (widget.userData['user_wallet'] != null)
                                
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Dana Wallet',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    Text(
                                      // formatNumber(
                                      //   ((widget.countCntrler! *
                                      //               (getJsonField(
                                      //                     widget.roomData,
                                      //                     r'''$.tmp_nights''',
                                      //                   ) *
                                      //                   double.parse(getJsonField(
                                      //                     widget.roomData,
                                      //                     r'''$.price_final''',
                                      //                   ).toString()))) *
                                      //           double.parse(
                                      //               FFAppState().taxAdmin)) +
                                      //       (widget.countCntrler! *
                                      //           (getJsonField(
                                      //                 widget.roomData,
                                      //                 r'''$.tmp_nights''',
                                      //               ) *
                                      //               double.parse(getJsonField(
                                      //                 widget.roomData,
                                      //                 r'''$.price_final''',
                                      //               ).toString()))),
                                      //   formatType: FormatType.decimal,
                                      //   decimalType: DecimalType.commaDecimal,
                                      //   currency: 'Rp ',
                                      // ),
                                      '-${formatNumber(
                                        
                                            double.parse(widget.userData['user_wallet']
                                                          ['balance'].toString()),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'Rp ',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                if (widget.userData['user_wallet'] != null)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                      Text(
                                        // formatNumber(
                                        //   ((widget.countCntrler! *
                                        //               (getJsonField(
                                        //                     widget.roomData,
                                        //                     r'''$.tmp_nights''',
                                        //                   ) *
                                        //                   double.parse(getJsonField(
                                        //                     widget.roomData,
                                        //                     r'''$.price_final''',
                                        //                   ).toString()))) *
                                        //           double.parse(
                                        //               FFAppState().taxAdmin)) +
                                        //       (widget.countCntrler! *
                                        //           (getJsonField(
                                        //                 widget.roomData,
                                        //                 r'''$.tmp_nights''',
                                        //               ) *
                                        //               double.parse(getJsonField(
                                        //                 widget.roomData,
                                        //                 r'''$.price_final''',
                                        //               ).toString()))),
                                        //   formatType: FormatType.decimal,
                                        //   decimalType: DecimalType.commaDecimal,
                                        //   currency: 'Rp ',
                                        // ),
                                        formatNumber(
                                          ((widget.countCntrler! *
                                                  double.parse(getJsonField(
                                                    widget.roomData,
                                                    r'''$.price_final''',
                                                  ).toString())) -
                                              double.parse(
                                                  widget.userData['user_wallet']
                                                          ['balance'] ??
                                                      '0')),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                          currency: 'Rp ',
                                        ),

                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sudah termasuk pajak',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ],
                            ),
                            // Generated code for this Button Widget...
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.bookingRes =
                                        await BookingHandlerGroup.homestayCall
                                            .call(
                                      accessToken: FFAppState().accessToken,
                                      hotelId: getJsonField(
                                        widget.homestayData,
                                        r'''$.id''',
                                      ).toString(),
                                      roomId: getJsonField(
                                        widget.roomData,
                                        r'''$.id''',
                                      ).toString(),
                                      totalRoom: widget.rooms,
                                      checkin: widget.startDate,
                                      checkout: widget.endDate,
                                      price: getJsonField(
                                        widget.roomData,
                                        r'''$.price''',
                                      ).toString(),
                                      balance: widget.userData['user_wallet']['balance'],
                                      totalPrice: _model.textController1.text
                                          .replaceAll('.0', ''),
                                      firstName: getJsonField(
                                        widget.userData,
                                        r'''$.first_name''',
                                      ).toString(),
                                      lastName: getJsonField(
                                        widget.userData,
                                        r'''$.last_name''',
                                      ).toString(),
                                      phone: getJsonField(
                                        widget.userData,
                                        r'''$.phone''',
                                      ).toString(),
                                    );
                                    // print(_model.bookingRes!.);
                                    // if ((_model.bookingRes?.jsonBody ?? '')) {
                                    if (_model.bookingRes != null &&
                                        _model.bookingRes!.jsonBody != null &&
                                        _model
                                            .bookingRes!.jsonBody.isNotEmpty) {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              KonfirmasiPembayaranHomestayWidget(
                                            homestayData: widget.homestayData!,
                                            startDate: widget.startDate!,
                                            endDate: widget.endDate!,
                                            accessToken:
                                                FFAppState().accessToken,
                                            rooms: widget.rooms!,
                                            guests: widget.guests!,
                                            roomData: widget.roomData!,
                                            userData: widget.userData!,
                                            countCntrler: widget.countCntrler!,
                                            totPrice: double.parse(
                                                _model.textController1.text),
                                            dataBooking: getJsonField(
                                              (_model.bookingRes?.jsonBody ??
                                                  ''),
                                              r'''$.booking_data''',
                                            ),
                                            dataBooking2: getJsonField(
                                              (_model.bookingRes?.jsonBody ??
                                                  ''),
                                              r'''$.payment_data''',
                                            ),
                                          ),
                                        ),
                                      );
                                      print( _model.bookingRes!.jsonBody);
                                    }
                                    setState(() {});
                                  },
                                  text: 'Lanjut ke Pembayaran ',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).accent1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
