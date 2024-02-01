import 'package:kolaka/makanan/detail_resto/detail_resto_widget.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_rekomendasi_model.dart';
export 'list_rekomendasi_model.dart';

class ListRekomendasiWidget extends StatefulWidget {
  const ListRekomendasiWidget({Key? key}) : super(key: key);

  @override
  _ListRekomendasiWidgetState createState() => _ListRekomendasiWidgetState();
}

class _ListRekomendasiWidgetState extends State<ListRekomendasiWidget> {
  late ListRekomendasiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListRekomendasiModel());
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
            print('refresh atas');
            setState(() => _model.apiRequestCompleter = null);
            await _model.waitForApiRequestCompleted();
          },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            title: Text(
              'Rekomendasi Resto',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().tokoMakanan(
                            requestFn: () =>
                                MakananMinumanGroup.getTokoMakananCall.call(),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary400,
                                  ),
                                ),
                              );
                            }
                            final listViewGetMakananResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final dataMakanan =
                                    listViewGetMakananResponse.jsonBody.toList();
                                return RefreshIndicator(
                                  onRefresh: () async {
                                    print('refresh bawah');
                                    setState(
                                        () => _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: dataMakanan.length,
                                    itemBuilder: (context, dataMakananIndex) {
                                      final dataMakananItem =
                                          dataMakanan[dataMakananIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child: Container(
                                          width: 180.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailRestoWidget(
                                                        createUser: getJsonField(
                                                          dataMakananItem,
                                                          r'''$.create_user''',
                                                        ),
                                                        dataToko: dataMakananItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                16.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            child: dataMakananItem['banner'] !=
                                                                              null &&
                                                                          dataMakananItem['banner'] !=
                                                                              ''
                                                                      ? Image
                                                                          .network(
                                                                          getJsonField(
                                                                            dataMakananItem,
                                                                            r'''$.banner''',
                                                                          ),
                                                                          height:
                                                                              75.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) {
                                                                            return Image
                                                                                .network(
                                                                              'https://cdn2.iconfinder.com/data/icons/building-vol-2/512/restaurant-512.png',
                                                                              height:
                                                                                  75.0,
                                                                              fit:
                                                                                  BoxFit.cover,
                                                                            );
                                                                          },
                                                                        )
                                                                      : Image
                                                                          .network(
                                                                          'https://cdn2.iconfinder.com/data/icons/building-vol-2/512/restaurant-512.png',
                                                                          width: double
                                                                              .infinity,
                                                                          height:
                                                                              75.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 17.0,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                              dataMakananItem,
                                                                              r'''$.review''')
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(
                                                                                context)
                                                                            .primaryBackground,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            12.0,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(15.0, 0.0,
                                                                  5.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                dataMakananItem,
                                                                r'''$.business_name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: '${getJsonField(dataMakananItem, r'''$.open_hour''')}'.replaceAll(
                                                                                RegExp(
                                                                                    r':00$'),
                                                                                '') +
                                                                            ' - ' +
                                                                            '${getJsonField(dataMakananItem, r'''$.close_hour''')}'.replaceAll(
                                                                                RegExp(r':00$'),
                                                                                ''),
                                                                        style: FlutterFlowTheme.of(
                                                                                context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily:
                                                                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color:
                                                                                  FlutterFlowTheme.of(context).secondary,
                                                                              fontWeight:
                                                                                  FontWeight.w500,
                                                                              useGoogleFonts:
                                                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: '',
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            '${(getJsonField(dataMakananItem, r'''$.address''') ?? '').substring(0, 15)}...',
                                                                        style: FlutterFlowTheme.of(
                                                                                context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily:
                                                                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color:
                                                                                  FlutterFlowTheme.of(context).secondary,
                                                                              fontWeight:
                                                                                  FontWeight.w500,
                                                                              useGoogleFonts:
                                                                                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: '',
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
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
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
