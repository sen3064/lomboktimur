import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_ulasan_rating_model.dart';
export 'list_ulasan_rating_model.dart';
import 'package:intl/date_symbol_data_local.dart';

class ListUlasanRatingWidget extends StatefulWidget {
  const ListUlasanRatingWidget({
    Key? key,
    this.objectModel,
    this.objectId,
    this.productsName,
  }) : super(key: key);
  final String? objectModel;
  final String? objectId;
  final String? productsName;

  @override
  _ListUlasanRatingWidgetState createState() => _ListUlasanRatingWidgetState();
}

class _ListUlasanRatingWidgetState extends State<ListUlasanRatingWidget> {
  late ListUlasanRatingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListUlasanRatingModel());
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            widget.productsName!,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyLargeFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Rating ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     FaIcon(
                      //       FontAwesomeIcons.solidStar,
                      //       color: FlutterFlowTheme.of(context).warning,
                      //       size: 15.0,
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(
                      //           5.0, 0.0, 0.0, 0.0),
                      //       child: Text(
                      //         '4.8',
                      //         style: FlutterFlowTheme.of(context)
                      //             .bodyMedium
                      //             .override(
                      //               fontFamily: FlutterFlowTheme.of(context)
                      //                   .bodyMediumFamily,
                      //               color: FlutterFlowTheme.of(context).accent1,
                      //               fontWeight: FontWeight.w500,
                      //               useGoogleFonts: GoogleFonts.asMap()
                      //                   .containsKey(
                      //                       FlutterFlowTheme.of(context)
                      //                           .bodyMediumFamily),
                      //             ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(
                      //           5.0, 0.0, 0.0, 0.0),
                      //       child: RichText(
                      //         text: TextSpan(
                      //           children: [
                      //             TextSpan(
                      //               text: '(205 ulasan)',
                      //               style: TextStyle(),
                      //             )
                      //           ],
                      //           style: FlutterFlowTheme.of(context)
                      //               .bodySmall
                      //               .override(
                      //                 fontFamily: FlutterFlowTheme.of(context)
                      //                     .bodySmallFamily,
                      //                 color: FlutterFlowTheme.of(context)
                      //                     .secondary,
                      //                 fontWeight: FontWeight.w500,
                      //                 useGoogleFonts: GoogleFonts.asMap()
                      //                     .containsKey(
                      //                         FlutterFlowTheme.of(context)
                      //                             .bodySmallFamily),
                      //               ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                FutureBuilder<ApiCallResponse>(
                  future: ApiHelperGroup.getReviewHandlerCall.call(
                    objectId: widget.objectId,
                    objectModel: widget.objectModel,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).tertiary400,
                          ),
                        ),
                      );
                    }
                    final columnGetReviewHandlerResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final listView = ApiHelperGroup.getReviewHandlerCall
                                .reviewData(
                                  columnGetReviewHandlerResponse.jsonBody,
                                )
                                ?.toList() ??
                            [];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(listView.length, (listViewIndex) {
                            final listViewItem = listView[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 8, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 8, 0),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF1F4F8),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: Image.network(
                                                        getJsonField(
                                                            listViewItem,
                                                            r'''$.user.avatar''') ?? 'http://www.pngall.com/wp-content/uploads/5/Profile-PNG-Photo.png',
                                                        width: 300,
                                                        height: 200,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${getJsonField(listViewItem, r'''$.user.first_name''') != null ? getJsonField(listViewItem, r'''$.user.first_name''').toString() : 'Unknown'} ${getJsonField(listViewItem, r'''$.user.last_name''') != null ? getJsonField(listViewItem, r'''$.user.last_name''').toString() : 'User'}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child: Text(
                                                        getJsonField(
                                                                listViewItem,
                                                                r'''$.rate_number''')
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: AutoSizeText(
                                                getJsonField(listViewItem,
                                                    r'''$.content'''),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 12, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              DateFormat('EEE, d MMM', 'id_ID')
                                                  .format(DateTime.parse(
                                                      getJsonField(listViewItem,
                                                          r'''$.created_at'''))),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
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
                              ),
                            );
                          }),
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
    );
  }
}
