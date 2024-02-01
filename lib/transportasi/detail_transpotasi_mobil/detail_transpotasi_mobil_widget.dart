import 'dart:convert';

import 'package:get/get.dart';
import 'package:kolaka/Styles/button.dart';
import 'package:kolaka/home/chat/chat_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme.dart';
import '/components/pilih_tanggal_pesan_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/transportasi/pesan_kendaraan_mobil/pesan_kendaraan_mobil_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/gestures.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'detail_transpotasi_mobil_model.dart';
export 'detail_transpotasi_mobil_model.dart';

class DetailTranspotasiMobilWidget extends StatefulWidget {
  const DetailTranspotasiMobilWidget({
    Key? key,
    this.rentData,
  }) : super(key: key);

  final dynamic rentData;

  @override
  _DetailTranspotasiMobilWidgetState createState() =>
      _DetailTranspotasiMobilWidgetState();
}

class _DetailTranspotasiMobilWidgetState
    extends State<DetailTranspotasiMobilWidget> {
  late DetailTranspotasiMobilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailTranspotasiMobilModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    dynamic prices = json.decode(widget.rentData['prices']);
    // print(widget.rentData['seller']['review']);
    var time = DateTime.now();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            final galeriRent = getJsonField(
                              widget.rentData,
                              r'''$.gallery''',
                            ).toList();
                            // print(getJsonField(
                            //     widget.rentData, r'''$.gallery'''));
                            return Container(
                              width: double.infinity,
                              height: 500,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage:
                                                min(0, galeriRent.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: galeriRent.length,
                                    itemBuilder: (context, galeriRentIndex) {
                                      final galeriRentItem =
                                          galeriRent[galeriRentIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: Image.network(
                                                  getJsonField(
                                                    galeriRentItem,
                                                    r'$..["400x350"]',
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: getJsonField(
                                                  galeriRentItem,
                                                  // r'$..["400x350"]',
                                                  // r'''$.400x350''',
                                                  r'$..["400x350"]',
                                                ),
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: getJsonField(
                                            galeriRentItem,
                                            r'$..["400x350"]',
                                          ),
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              getJsonField(
                                                galeriRentItem,
                                                r'$..["400x350"]',
                                              ),
                                              width: 300,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 16),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: min(
                                                    0, galeriRent.length - 1)),
                                        count: galeriRent.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 3,
                                          spacing: 8,
                                          radius: 30,
                                          dotWidth: 8,
                                          dotHeight: 8,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .accent1,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
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
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                getJsonField(widget.rentData, r'''$.title'''),
                                style: bold16.copyWith(color: dark1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Expanded(
                      //       child: Padding(
                      //         padding: EdgeInsetsDirectional.fromSTEB(
                      //             0, 0, 0, 10),
                      //         child: Text(
                      //           getJsonField(widget.rentData,
                      //                   r'''$.address''')
                      //               .toString(),
                      //           style: FlutterFlowTheme.of(context)
                      //               .bodyMedium,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: FlutterFlowTheme.of(context).warning,
                              size: 20,
                            ),
                            if (getJsonField(
                                    widget.rentData, r'''$.review_score''') ==
                                null)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  '0',
                                  style: regular10.copyWith(color: dark2),
                                ),
                              ),
                            if (getJsonField(
                                    widget.rentData, r'''$.review_score''') !=
                                null)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  getJsonField(widget.rentData,
                                          r'''$.review_score''')
                                      .toString(),
                                  style: regular10.copyWith(color: dark2),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Icon(
                                Icons.location_on,
                                color: const Color.fromARGB(255, 65, 64, 64),
                                size: 10.0,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${(getJsonField(widget.rentData, r'''$.seller.address''') ?? '').toString()}',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 65, 64, 64),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Column(
                      //   mainAxisSize: MainAxisSize.max,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(
                      //           0, 0, 5, 0),
                      //       child: Text(
                      //         'Harga Mulai Dari',
                      //         style: semibold14.copyWith(color: red1),
                      //       ),
                      //     ),
                      //     Row(
                      //       children: [
                      //         if (prices['nodriver'] != null)
                      //           Padding(
                      //             padding:
                      //                 EdgeInsetsDirectional.fromSTEB(
                      //                     0, 0, 5, 0),
                      //             child: Text(
                      //               (formatNumber(
                      //                   double.parse(
                      //                       prices['nodriver']
                      //                           .toString()),
                      //                   formatType:
                      //                       FormatType.decimal,
                      //                   decimalType:
                      //                       DecimalType.commaDecimal,
                      //                   currency: 'Rp ')),
                      //               style: semibold14.copyWith(
                      //                   color: red1),
                      //             ),
                      //           ),
                      //         if (prices['nodriver'] != null &&
                      //             prices['driver'] != null)
                      //           if (prices['driver'] != null)
                      //             Padding(
                      //               padding: EdgeInsetsDirectional
                      //                   .fromSTEB(0, 0, 5, 0),
                      //               child: Text(
                      //                 (formatNumber(
                      //                     double.parse(
                      //                         prices['driver']
                      //                             .toString()),
                      //                     formatType:
                      //                         FormatType.decimal,
                      //                     decimalType: DecimalType
                      //                         .commaDecimal,
                      //                     currency: 'Rp ')),
                      //                 style:
                      //                     FlutterFlowTheme.of(context)
                      //                         .headlineSmall
                      //                         .override(
                      //                           fontFamily:
                      //                               FlutterFlowTheme.of(
                      //                                       context)
                      //                                   .headlineSmallFamily,
                      //                           color: FlutterFlowTheme
                      //                                   .of(context)
                      //                               .accent1,
                      //                           fontSize: 15,
                      //                           useGoogleFonts: GoogleFonts
                      //                                   .asMap()
                      //                               .containsKey(
                      //                                   FlutterFlowTheme.of(
                      //                                           context)
                      //                                       .headlineSmallFamily),
                      //                         ),
                      //               ),
                      //             ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Periode Pemesanan',
                      style: bold16.copyWith(color: dark1),
                    ),
                    if (FFAppState().startDate == null)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pilih tanggal',
                                style: semibold12_5.copyWith(color: dark2),
                              ),
                              // Text(
                              //   '12:30 WIB',
                              //   style: FlutterFlowTheme.of(context)
                              //       .bodyMedium,
                              // ),
                            ],
                          ),
                          Icon(
                            FFIcons.karrowRight1Copy,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 24,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pilih Tanggal',
                                style: semibold12_5.copyWith(color: dark2),
                              ),
                              // Text(
                              //   '12:30 WIB',
                              //   style: FlutterFlowTheme.of(context)
                              //       .bodyMedium,
                              // ),
                            ],
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PilihTanggalPesanWidget(
                                        rentData: widget.rentData!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: 'Pilih',
                            options: FFButtonOptions(
                              height: 40,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: semibold12_5.copyWith(color: red1),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    if (FFAppState().startDate != null)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.viewDate(functions.formatDate(
                                      dateTimeFormat(
                                          'd/M/y', FFAppState().startDate))),
                                  'null',
                                ),
                                style: regular12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                          Icon(
                            FFIcons.karrowRight1Copy,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 24,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.viewDate(functions.formatDate(
                                      dateTimeFormat(
                                          'd/M/y', FFAppState().endDate))),
                                  'null',
                                ),
                                style: regular12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PilihTanggalPesanWidget(
                                        rentData: widget.rentData!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: 'Ganti',
                            options: FFButtonOptions(
                              height: 40,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            FFIcons.kseats,
                            color: red1,
                            size: 24,
                          ),
                        ),
                        Text(
                          '${getJsonField(widget.rentData, r'''$.passenger''')} Seat',
                          style: regular12_5.copyWith(color: dark2),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            FFIcons.ktransmission,
                            color: red1,
                            size: 24,
                          ),
                        ),
                        Text(
                          getJsonField(widget.rentData, r'''$.gear'''),
                          textAlign: TextAlign.center,
                          style: regular12_5.copyWith(color: dark2),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            FFIcons.ksuitcaseRolling,
                            color: red1,
                            size: 24,
                          ),
                        ),
                        Text(
                          '${getJsonField(widget.rentData, r'''$.baggage''')} Kg',
                          style: regular12_5.copyWith(color: dark2),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            FFIcons.kfuel,
                            color: red1,
                            size: 24,
                          ),
                        ),
                        Text(
                          'Premium',
                          style: regular12_5.copyWith(color: dark2),
                        ),
                      ],
                    ),
                    if (prices['driver'] != null)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.person_add_disabled,
                              color: red1,
                              size: 24,
                            ),
                          ),
                          Text(
                            'Driver',
                            style: regular12_5.copyWith(color: dark2),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jarak Tempuh',
                            style: bold16.copyWith(color: dark1),
                          ),
                          Icon(
                            Icons.error_outline,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Jarak tempuh maksimal yang diperbolehkan adalah 400km per hari. Penggunaan yang melebihi batas tersebut akan dikenakan sebebesar Rp. 1.500 per km',
                            style: regular14.copyWith(color: dark2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Deskripsi',
                            style: bold16.copyWith(color: dark1),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            getJsonField(widget.rentData, r'''$.content'''),
                            style: regular14.copyWith(color: dark2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rental Partner",
                      style: bold16.copyWith(color: dark1),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            getJsonField(
                                widget.rentData, r'''$.seller.banner'''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getJsonField(
                                      widget.rentData, r'''$.seller.name'''),
                                  style: semibold12_5.copyWith(color: dark2),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Terakhir update ',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '${time.hour}:${time.minute}',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                    style: regular10.copyWith(color: dark2),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (FFAppState().accessToken.isNotEmpty)
                          FlutterFlowIconButton(
                            borderRadius: 25,
                            borderWidth: 0,
                            buttonSize: 50,
                            fillColor: dark3.withOpacity(0.1),
                            icon: Icon(
                              Icons.wechat_outlined,
                              color: red1,
                              size: 24,
                            ),
                            onPressed: () {
                              String lastName =
                                  widget.rentData['seller']['last_name'] ?? '';
                              Get.to(() => const ChatWidget(), arguments: {
                                'to_username':
                                    '${widget.rentData['seller']['first_name']}.${lastName.replaceAll(" ", "-")}',
                                'not_navbar': true
                              });
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        bottomSheet: Container(
          height: 90,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Text(
                          'Harga Mulai Dari',
                          style: regular14.copyWith(color: dark2),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          if (prices['nodriver'] != null ||
                              prices['driver'] != null)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: Text(
                                (formatNumber(
                                  double.parse(
                                    (prices['nodriver'] ?? prices['driver'])
                                        .toString(),
                                  ),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.commaDecimal,
                                  currency: 'Rp ',
                                )),
                                style: semibold14.copyWith(color: red1),
                              ),
                            ),
                          Text(
                            "/Hari",
                            style: regular14.copyWith(color: dark3),
                          )
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (FFAppState().startDate != null ||
                          FFAppState().endDate != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PesanKendaraanMobilWidget(
                              rentData: widget.rentData,
                            ),
                          ),
                        );
                      } else {
                        // Tampilkan pesan atau tindakan lain jika startDate atau endDate tidak ada
                        // Contoh: menampilkan snackbar atau dialog
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Harap masukkan tanggal mulai dan tanggal selesai.'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: red1,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            child: Text(
                              "Pesan Sekarang",
                              style: semibold14.copyWith(color: white),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


// 





                                          // Row(
                                          //   mainAxisSize: MainAxisSize.max,
                                          //   children: [
                                          //     if (getJsonField(widget.rentData,
                                          //             r'''$.seller.review''') ==
                                          //         null)
                                          //       Text(
                                          //         '0',
                                          //         style: regular10.copyWith(
                                          //             color: dark2),
                                          //       ),
                                          //     if (getJsonField(widget.rentData,
                                          //             r'''$.seller.review''') !=
                                          //         null)
                                          //       Text(
                                          //         getJsonField(widget.rentData,
                                          //                 r'''$.seller.review''')
                                          //             .toString(),
                                          //         style: regular10.copyWith(
                                          //             color: dark2),
                                          //       ),
                                          //     Icon(
                                          //       Icons.star_rounded,
                                          //       color:
                                          //           FlutterFlowTheme.of(context)
                                          //               .warning,
                                          //       size: 20,
                                          //     ),
                                          //     // Column(
                                          //     //   mainAxisSize: MainAxisSize.max,
                                          //     //   children: [
                                          //     //     Text(
                                          //     //       'Rata-rata ulasan',
                                          //     //       style: regular10.copyWith(
                                          //     //           color: dark2),
                                          //     //     ),
                                          //     //     if (responsiveVisibility(
                                          //     //       context: context,
                                          //     //       phone: false,
                                          //     //       tablet: false,
                                          //     //       tabletLandscape: false,
                                          //     //       desktop: false,
                                          //     //     ))
                                          //     //       Padding(
                                          //     //         padding:
                                          //     //             EdgeInsetsDirectional
                                          //     //                 .fromSTEB(
                                          //     //                     0, 5, 0, 0),
                                          //     //         child: FFButtonWidget(
                                          //     //           onPressed: () {
                                          //     //             print(
                                          //     //                 'Button pressed ...');
                                          //     //           },
                                          //     //           text: 'Follow',
                                          //     //           options:
                                          //     //               FFButtonOptions(
                                          //     //             width: 100,
                                          //     //             height: 35,
                                          //     //             padding:
                                          //     //                 EdgeInsetsDirectional
                                          //     //                     .fromSTEB(0,
                                          //     //                         0, 0, 0),
                                          //     //             iconPadding:
                                          //     //                 EdgeInsetsDirectional
                                          //     //                     .fromSTEB(0,
                                          //     //                         0, 0, 0),
                                          //     //             color: Colors
                                          //     //                 .transparent,
                                          //     //             textStyle:
                                          //     //                 FlutterFlowTheme.of(
                                          //     //                         context)
                                          //     //                     .bodySmall
                                          //     //                     .override(
                                          //     //                       fontFamily:
                                          //     //                           FlutterFlowTheme.of(context)
                                          //     //                               .bodySmallFamily,
                                          //     //                       color: FlutterFlowTheme.of(
                                          //     //                               context)
                                          //     //                           .accent1,
                                          //     //                       fontWeight:
                                          //     //                           FontWeight
                                          //     //                               .w600,
                                          //     //                       useGoogleFonts: GoogleFonts
                                          //     //                               .asMap()
                                          //     //                           .containsKey(
                                          //     //                               FlutterFlowTheme.of(context).bodySmallFamily),
                                          //     //                     ),
                                          //     //             borderSide:
                                          //     //                 BorderSide(
                                          //     //               color: FlutterFlowTheme
                                          //     //                       .of(context)
                                          //     //                   .accent1,
                                          //     //               width: 1,
                                          //     //             ),
                                          //     //             borderRadius:
                                          //     //                 BorderRadius
                                          //     //                     .circular(16),
                                          //     //           ),
                                          //     //         ),
                                          //     //       ),
                                          //     //   ],
                                          //     // ),

                                          //   ],
                                          // ),