import '/backend/api_requests/api_calls.dart';
import '/event/detail_event/detail_event_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'list_event_model.dart';
export 'list_event_model.dart';

class ListEventWidget extends StatefulWidget {
  const ListEventWidget({Key? key}) : super(key: key);

  @override
  _ListEventWidgetState createState() => _ListEventWidgetState();
}

class _ListEventWidgetState extends State<ListEventWidget> {
  late ListEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEventModel());
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
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() => _model.apiRequestCompleter = null);
          await _model.waitForApiRequestCompleted();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          endDrawer: Container(
            width: 300,
            child: Drawer(
              elevation: 16,
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).accent1,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 54,
              icon: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Tempat Wisata',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       Icon(
                  //         Icons.location_on,
                  //         color: Color(0xFFF96F30),
                  //         size: 24,
                  //       ),
                  //       Text(
                  //         'Jelajahi Tempat Lainnya',
                  //         style: FlutterFlowTheme.of(context)
                  //             .bodySmall
                  //             .override(
                  //               fontFamily: FlutterFlowTheme.of(context)
                  //                   .bodySmallFamily,
                  //               color: Color(0xFFF96F30),
                  //               fontWeight: FontWeight.w500,
                  //               useGoogleFonts: GoogleFonts.asMap().containsKey(
                  //                   FlutterFlowTheme.of(context)
                  //                       .bodySmallFamily),
                  //             ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Event Populer\ndi Kabupaten kelotimaja',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.max,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //         Row(
                  //           mainAxisSize: MainAxisSize.max,
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               'Jelajah labuan bajo dengan cara terbaik',
                  //               style: FlutterFlowTheme.of(context)
                  //                   .bodySmall
                  //                   .override(
                  //                     fontFamily: FlutterFlowTheme.of(context)
                  //                         .bodySmallFamily,
                  //                     color: FlutterFlowTheme.of(context).primary,
                  //                     useGoogleFonts: GoogleFonts.asMap()
                  //                         .containsKey(
                  //                             FlutterFlowTheme.of(context)
                  //                                 .bodySmallFamily),
                  //                   ),
                  //             ),
                  //             Icon(
                  //               Icons.keyboard_arrow_right,
                  //               color: FlutterFlowTheme.of(context).accent1,
                  //               size: 20,
                  //             ),
                  //           ],
                  //         ),
                  //     ],
                  //   ),
                  // ),
                  FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(EventGroup.eventListCall.call()))
                        .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).tertiary400,
                              ),
                            ),
                          ),
                        );
                      }
                      final columnTourListResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final listEvent = EventGroup.eventListCall
                                  .dataTour(
                                    columnTourListResponse.jsonBody,
                                  )
                                  ?.toList() ??
                              [];
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(listEvent.length,
                                    (listEventIndex) {
                                  final listEventItem =
                                      listEvent[listEventIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 12),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         DetailEventWidget(
                                        //       eventData: listEventItem,
                                        //       eventID: getJsonField(
                                        //         listEventItem,
                                        //         r'''$.id''',
                                        //       ).toString(),
                                        //       eventListData: listEventItem,
                                        //     ),
                                        //   ),
                                        // );
                                        print('object');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 7,
                                              color: Color(0x2F1D2429),
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (getJsonField(
                                                        listEventItem,
                                                        r'''$.banner''',
                                                      ) !=
                                                      null)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        getJsonField(
                                                          listEventItem,
                                                          r'''$.banner''',
                                                        )['400x350'],
                                                        width: double.infinity,
                                                        height: 160,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                        listEventItem,
                                                        r'''$.banner''',
                                                      ) ==
                                                      null)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        "https://wallpapercave.com/wp/wp7488372.jpg",
                                                        width: 200,
                                                        height: 200,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        if (getJsonField(
                                                              listEventItem,
                                                              r'''$.title''',
                                                            ) !=
                                                            null)
                                                          Expanded(
                                                            child: Text(
                                                              getJsonField(
                                                                listEventItem,
                                                                r'''$.title''',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              listEventItem,
                                                              r'''$.title''',
                                                            ) ==
                                                            null)
                                                          Expanded(
                                                            child: Text(
                                                              'Tiket Wisata kelotimaja',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: 'Join Event',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24,
                                                                        0,
                                                                        24,
                                                                        0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 3,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Tourist attraction',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
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
                                  );
                                }),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
