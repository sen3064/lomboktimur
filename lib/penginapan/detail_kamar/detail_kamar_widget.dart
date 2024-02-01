import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/penginapan/isi_data/isi_data_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'detail_kamar_model.dart';
export 'detail_kamar_model.dart';

class DetailKamarWidget extends StatefulWidget {
  const DetailKamarWidget({
    Key? key,
    required this.rid,
    required this.roomData,
    required this.startDate,
    required this.endDate,
    String? rooms,
    String? guests,
    required this.termsRoom,
    required this.homestayData,
  })  : this.rooms = rooms ?? '1',
        this.guests = guests ?? '2',
        super(key: key);

  final String? rid;
  final dynamic roomData;
  final String? startDate;
  final String? endDate;
  final String rooms;
  final String guests;
  final dynamic termsRoom;
  final dynamic homestayData;

  @override
  _DetailKamarWidgetState createState() => _DetailKamarWidgetState();
}

class _DetailKamarWidgetState extends State<DetailKamarWidget> {
  late DetailKamarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailKamarModel());
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
            'Detail Kamar',
            style: FlutterFlowTheme.of(context).bodyLarge,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 216.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final galleryData =
                                getJsonField(widget.roomData, r'''$.gallery''');
                            final gallery = galleryData != null
                                ? galleryData.toList()
                                : <dynamic>[];

                            // Jika 'gallery' masih kosong, berikan nilai default
                            if (gallery.isEmpty) {
                              gallery.add(
                                  'https://cdn4.iconfinder.com/data/icons/picture-sharing-sites/32/No_Image-1024.png');
                              // Anda dapat menambahkan lebih banyak nilai default jika diperlukan
                            }
                            return Container(
                              width: double.infinity,
                              height: 478,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage:
                                                min(0, gallery.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: gallery.length,
                                    itemBuilder: (context, galleryIndex) {
                                      final galleryItem = gallery[galleryIndex];
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
                                                    galleryItem,
                                                    r'$..["400x350"]',
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: getJsonField(
                                                  galleryItem,
                                                  r'$..["400x350"]',
                                                ),
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: getJsonField(
                                            galleryItem,
                                            r'$..["400x350"]',
                                          ),
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.network(
                                              getJsonField(
                                                galleryItem,
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
                                    alignment: AlignmentDirectional(-1, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 16),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage:
                                                    min(0, gallery.length - 1)),
                                        count: gallery.length,
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
                                        effect:
                                            smooth_page_indicator.SlideEffect(
                                          spacing: 8,
                                          radius: 16,
                                          dotWidth: 8,
                                          dotHeight: 8,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
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
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      widget.roomData,
                                      r'''$.title''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.people_outlined,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tamu',
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
                                    Text(
                                      valueOrDefault<String>(
                                        '${getJsonField(
                                          widget.roomData,
                                          r'''$.max_guests''',
                                        ).toString()} tamu/kamar',
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.single_bed,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tipe Ranjang',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                    if (getJsonField(
                                          widget.roomData,
                                          r'''$.single_bed''',
                                        ) !=
                                        FFAppState().zeroVal)
                                      Text(
                                        'Single bed',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    if (getJsonField(
                                          widget.roomData,
                                          r'''$.double_bed''',
                                        ) !=
                                        FFAppState().zeroVal)
                                      Text(
                                        'Double bed',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    if (getJsonField(
                                          widget.roomData,
                                          r'''$.twin_bed''',
                                        ) !=
                                        FFAppState().zeroVal)
                                      Text(
                                        'Twin bed',
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 22.0, 22.0, 22.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fasilitas Kamar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final termsRoom = widget.termsRoom!.toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(termsRoom.length,
                                      (termsRoomIndex) {
                                    final termsRoomItem =
                                        termsRoom[termsRoomIndex];
                                    return Text(
                                      getJsonField(
                                        termsRoomItem,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    );
                                  }),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Rincian Harga',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tanggal',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        '${valueOrDefault<String>(
                                          functions.viewDate(widget.startDate),
                                          'null',
                                        )} - ${valueOrDefault<String>(
                                          functions.viewDate(widget.endDate),
                                          'null',
                                        )}',
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jumlah Kamar',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${widget.rooms} Kamar',
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Harga per Malam',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                    Text(
                                      // formatNumber(
                                      //   ((double.parse(widget.rooms) *
                                      //               double.parse(getJsonField(
                                      //                 widget.roomData,
                                      //                 r'''$.price_final''',
                                      //               ).toString())) *
                                      //           double.parse(
                                      //               FFAppState().taxAdmin)) +
                                      //       (double.parse(widget.rooms) *
                                      //           double.parse(getJsonField(
                                      //             widget.roomData,
                                      //             r'''$.price_final''',
                                      //           ).toString())),
                                      //   formatType: FormatType.decimal,
                                      //   decimalType: DecimalType.commaDecimal,
                                      //   currency: 'Rp ',
                                      // ),
                                      formatNumber(
                                        ((double.parse(widget.rooms) *
                                            double.parse(getJsonField(
                                                  widget.roomData,
                                                  r'''$.price_final''',
                                                )?.toString() ??
                                                '0'))),
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
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       0.0, 0.0, 0.0, 10.0),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Pajak dan Biaya',
                                //         style: FlutterFlowTheme.of(context)
                                //             .titleSmall,
                                //       ),
                                //       Text(
                                //         formatNumber(
                                //           double.parse(FFAppState().taxAdmin) *
                                //               (double.parse(getJsonField(
                                //                     widget.roomData,
                                //                     r'''$.price_final''',
                                //                   ).toString()) *
                                //                   double.parse(widget.rooms)),
                                //           formatType: FormatType.decimal,
                                //           decimalType: DecimalType.commaDecimal,
                                //           currency: 'Rp ',
                                //         ),
                                //         style: FlutterFlowTheme.of(context)
                                //             .titleSmall,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       0.0, 10.0, 0.0, 0.0),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Text(
                                //         'Total Harga',
                                //         style: FlutterFlowTheme.of(context)
                                //             .titleMedium,
                                //       ),
                                //       Text(
                                //         formatNumber(
                                //           ((double.parse(widget.rooms) *
                                //                       double.parse(getJsonField(
                                //                         widget.roomData,
                                //                         r'''$.price_final''',
                                //                       ).toString())) *
                                //                   double.parse(
                                //                       FFAppState().taxAdmin)) +
                                //               (double.parse(widget.rooms) *
                                //                   double.parse(getJsonField(
                                //                     widget.roomData,
                                //                     r'''$.price_final''',
                                //                   ).toString())),
                                //           formatType: FormatType.decimal,
                                //           decimalType: DecimalType.commaDecimal,
                                //           currency: 'Rp ',
                                //         ),
                                //         style: FlutterFlowTheme.of(context)
                                //             .titleMedium,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IsiDataWidget(
                                      homestayData: widget.homestayData!,
                                      startDate: widget.startDate!,
                                      endDate: widget.endDate!,
                                      accessToken: FFAppState().accessToken,
                                      rooms: widget.rooms,
                                      guests: widget.guests,
                                      roomData: widget.roomData!,
                                      userData: FFAppState().userData,
                                      termsRoom: widget.termsRoom!,
                                    ),
                                  ),
                                );
                              },
                              text: 'Pilih',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).accent1,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
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
    );
  }
}
