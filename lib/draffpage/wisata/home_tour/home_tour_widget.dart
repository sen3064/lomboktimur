import '/backend/api_requests/api_calls.dart';
import '/draffpage/wisata/detail_wisata/detail_wisata_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tour/detail_paket_tour/detail_paket_tour_widget.dart';
import '/tour/list_tour/list_tour_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_tour_model.dart';
export 'home_tour_model.dart';

class HomeTourWidget extends StatefulWidget {
  const HomeTourWidget({Key? key}) : super(key: key);

  @override
  _HomeTourWidgetState createState() => _HomeTourWidgetState();
}

class _HomeTourWidgetState extends State<HomeTourWidget>
    with TickerProviderStateMixin {
  late HomeTourModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeTourModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        endDrawer: Drawer(
          elevation: 16.0,
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.notifications,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFF96F30),
                          size: 24.0,
                        ),
                        Text(
                          'Jelajahi Tempat Lainnya',
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                color: Color(0xFFF96F30),
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Explore the',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Beautiful',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeFamily),
                                            ),
                                      ),
                                      TextSpan(
                                        text: ' world!',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily,
                                              color: Color(0xFFF96F30),
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeFamily),
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.35, 0.95),
                              child: Container(
                                width: 100.0,
                                height: 20.0,
                                decoration: BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Vector_2524.png',
                                    width: 100.0,
                                    height: 20.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xB5EEEEEE),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Cari tempat bermain',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmallFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tur Popular Labuan Bajo',
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListTourWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'Lihat Semua',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
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
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jelajah labuan bajo dengan cara terbaik',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 20.0,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 220.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      // child: FutureBuilder<ApiCallResponse>(
                      //   future: TourGroup.tourListCall.call(
                      //     accessToken: FFAppState().accessToken,
                      //   ),
                      //   builder: (context, snapshot) {
                      //     // Customize what your widget looks like when it's loading.
                      //     if (!snapshot.hasData) {
                      //       return Center(
                      //         child: SizedBox(
                      //           width: 50.0,
                      //           height: 50.0,
                      //           child: CircularProgressIndicator(
                      //             color:
                      //                 FlutterFlowTheme.of(context).tertiary400,
                      //           ),
                      //         ),
                      //       );
                      //     }
                      //     final listViewTourListResponse = snapshot.data!;
                      //     return Builder(
                      //       builder: (context) {
                      //         final tourData = TourGroup.tourListCall
                      //                 .dataTour(
                      //                   listViewTourListResponse.jsonBody,
                      //                 )
                      //                 ?.toList() ??
                      //             [];
                      //         return ListView.builder(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.horizontal,
                      //           itemCount: tourData.length,
                      //           itemBuilder: (context, tourDataIndex) {
                      //             final tourDataItem = tourData[tourDataIndex];
                      //             return Card(
                      //               clipBehavior: Clip.antiAliasWithSaveLayer,
                      //               color: FlutterFlowTheme.of(context)
                      //                   .primaryBackground,
                      //               elevation: 3.0,
                      //               child: Container(
                      //                 width: 154.0,
                      //                 height: 210.0,
                      //                 decoration: BoxDecoration(
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .primaryBackground,
                      //                   boxShadow: [
                      //                     BoxShadow(
                      //                       blurRadius: 4.0,
                      //                       color: Color(0x33000000),
                      //                       offset: Offset(0.0, 2.0),
                      //                     )
                      //                   ],
                      //                   borderRadius:
                      //                       BorderRadius.circular(6.0),
                      //                 ),
                      //                 child: Stack(
                      //                   children: [
                      //                     Stack(
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(
                      //                                   1.0, 0.0, 0.0, 0.0),
                      //                           child: InkWell(
                      //                             splashColor:
                      //                                 Colors.transparent,
                      //                             focusColor:
                      //                                 Colors.transparent,
                      //                             hoverColor:
                      //                                 Colors.transparent,
                      //                             highlightColor:
                      //                                 Colors.transparent,
                      //                             onTap: () async {
                      //                               await Navigator.push(
                      //                                 context,
                      //                                 MaterialPageRoute(
                      //                                   builder: (context) =>
                      //                                       DetailPaketTourWidget(
                      //                                     tourData:
                      //                                         tourDataItem,
                      //                                     tourListData:
                      //                                         getJsonField(
                      //                                       tourDataItem,
                      //                                       r'''$.itinerary[0]''',
                      //                                     ),
                      //                                     tourID: getJsonField(
                      //                                       tourDataItem,
                      //                                       r'''$.id''',
                      //                                     ).toString(),
                      //                                   ),
                      //                                 ),
                      //                               );
                      //                             },
                      //                             child: Column(
                      //                               mainAxisSize:
                      //                                   MainAxisSize.max,
                      //                               crossAxisAlignment:
                      //                                   CrossAxisAlignment
                      //                                       .start,
                      //                               children: [
                      //                                 ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(0.0),
                      //                                   child: Image.network(
                      //                                     valueOrDefault<
                      //                                         String>(
                      //                                       getJsonField(
                      //                                         tourDataItem,
                      //                                         r'''$.banner''',
                      //                                       )['200x150'],
                      //                                       'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ficon-library.com%2Fimages%2Fno-image-icon%2Fno-image-icon-0.jpg&f=1&nofb=1&ipt=f388316d296938a2377a4cc1b9a6eac7aa33361d39e99830b941d7a5e6ad6423&ipo=images',
                      //                                     ),
                      //                                     width:
                      //                                         double.infinity,
                      //                                     height: 113.0,
                      //                                     fit: BoxFit.cover,
                      //                                   ),
                      //                                 ),
                      //                                 Expanded(
                      //                                   child: Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(
                      //                                                 5.0,
                      //                                                 5.0,
                      //                                                 5.0,
                      //                                                 0.0),
                      //                                     child: Text(
                      //                                       valueOrDefault<
                      //                                           String>(
                      //                                         getJsonField(
                      //                                           tourDataItem,
                      //                                           r'''$.title''',
                      //                                         ).toString(),
                      //                                         '0',
                      //                                       ),
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodyMedium
                      //                                           .override(
                      //                                             fontFamily: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .bodyMediumFamily,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w500,
                      //                                             useGoogleFonts: GoogleFonts
                      //                                                     .asMap()
                      //                                                 .containsKey(
                      //                                                     FlutterFlowTheme.of(context)
                      //                                                         .bodyMediumFamily),
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                                 if (responsiveVisibility(
                      //                                   context: context,
                      //                                   phone: false,
                      //                                   tablet: false,
                      //                                   tabletLandscape: false,
                      //                                   desktop: false,
                      //                                 ))
                      //                                   Padding(
                      //                                     padding:
                      //                                         EdgeInsetsDirectional
                      //                                             .fromSTEB(
                      //                                                 5.0,
                      //                                                 5.0,
                      //                                                 0.0,
                      //                                                 0.0),
                      //                                     child: Text(
                      //                                       'Rp. 1.23.123',
                      //                                       style: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .bodySmall
                      //                                           .override(
                      //                                             fontFamily: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .bodySmallFamily,
                      //                                             color: FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .secondary,
                      //                                             fontSize:
                      //                                                 11.0,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .normal,
                      //                                             decoration:
                      //                                                 TextDecoration
                      //                                                     .lineThrough,
                      //                                             useGoogleFonts: GoogleFonts
                      //                                                     .asMap()
                      //                                                 .containsKey(
                      //                                                     FlutterFlowTheme.of(context)
                      //                                                         .bodySmallFamily),
                      //                                           ),
                      //                                     ),
                      //                                   ),
                      //                                 Padding(
                      //                                   padding:
                      //                                       EdgeInsetsDirectional
                      //                                           .fromSTEB(
                      //                                               5.0,
                      //                                               0.0,
                      //                                               0.0,
                      //                                               10.0),
                      //                                   child: Text(
                      //                                     formatNumber(
                      //                                       double.parse(
                      //                                           getJsonField(
                      //                                         tourDataItem,
                      //                                         r'''$.price''',
                      //                                       ).toString()),
                      //                                       formatType:
                      //                                           FormatType
                      //                                               .decimal,
                      //                                       decimalType:
                      //                                           DecimalType
                      //                                               .commaDecimal,
                      //                                       currency: 'Rp ',
                      //                                     ),
                      //                                     style: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .bodySmall
                      //                                         .override(
                      //                                           fontFamily: FlutterFlowTheme.of(
                      //                                                   context)
                      //                                               .bodySmallFamily,
                      //                                           color: FlutterFlowTheme.of(
                      //                                                   context)
                      //                                               .error,
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .w600,
                      //                                           useGoogleFonts: GoogleFonts
                      //                                                   .asMap()
                      //                                               .containsKey(
                      //                                                   FlutterFlowTheme.of(context)
                      //                                                       .bodySmallFamily),
                      //                                         ),
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           width: 100.0,
                      //                           height: 20.0,
                      //                           decoration: BoxDecoration(
                      //                             color: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .accent4,
                      //                           ),
                      //                           child: Padding(
                      //                             padding: EdgeInsetsDirectional
                      //                                 .fromSTEB(
                      //                                     5.0, 0.0, 0.0, 0.0),
                      //                             child: Row(
                      //                               mainAxisSize:
                      //                                   MainAxisSize.max,
                      //                               children: [
                      //                                 Padding(
                      //                                   padding:
                      //                                       EdgeInsetsDirectional
                      //                                           .fromSTEB(
                      //                                               0.0,
                      //                                               0.0,
                      //                                               5.0,
                      //                                               0.0),
                      //                                   child: Icon(
                      //                                     Icons.location_on,
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .primaryBackground,
                      //                                     size: 10.0,
                      //                                   ),
                      //                                 ),
                      //                                 Expanded(
                      //                                   child: Text(
                      //                                     valueOrDefault<
                      //                                         String>(
                      //                                       getJsonField(
                      //                                         tourDataItem,
                      //                                         r'''$.location.name''',
                      //                                       ).toString(),
                      //                                       '0',
                      //                                     ),
                      //                                     style: TextStyle(
                      //                                       color: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .secondaryBackground,
                      //                                       fontWeight:
                      //                                           FontWeight.w600,
                      //                                       fontSize: 10.0,
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     Align(
                      //                       alignment:
                      //                           AlignmentDirectional(0.9, -0.9),
                      //                       child: FaIcon(
                      //                         FontAwesomeIcons.bookmark,
                      //                         color:
                      //                             FlutterFlowTheme.of(context)
                      //                                 .primaryBackground,
                      //                         size: 20.0,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             );
                      //           },
                      //         );
                      //       },
                      //     );
                      //   },
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tempat Wisata Populer \ndi Labuan Bajo',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                      Text(
                        'Lihat Semua',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).accent1,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0x2F1D2429),
                              offset: Offset(0.0, 3.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailWisataWidget(),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://static.republika.co.id/uploads/images/inpicture_slide/wisatawan-menikmati-wisata-bukit-amelia-labuan-bajo-manggarai-barat_210613224840-706.jpg',
                                        width: double.infinity,
                                        height: 160.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bukit Amelia Sea Labuan Bajo',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Icon(
                                              Icons.share_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Tourist attraction',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0x2F1D2429),
                              offset: Offset(0.0, 3.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailWisataWidget(),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1634466319/x6b4qzv2nrrp3hc3fwoi.jpg',
                                        width: double.infinity,
                                        height: 160.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bukit Cinta',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Icon(
                                              Icons.share_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Tourist attraction',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7.0,
                              color: Color(0x2F1D2429),
                              offset: Offset(0.0, 3.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailWisataWidget(),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://www.paketwisatakomodo.com/wp-content/uploads/2019/12/Air-Terjun-Cunca-Wulang.jpg',
                                        width: double.infinity,
                                        height: 160.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Cunca Wulang Waterfall',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Icon(
                                              Icons.share_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Nature reserve',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
