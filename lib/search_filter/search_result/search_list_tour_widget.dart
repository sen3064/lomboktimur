import 'package:kelotimaja/flutter_flow/flutter_flow_widgets.dart';
import 'package:kelotimaja/main.dart';
import 'package:kelotimaja/search_filter/pilih_lokasi/pilih_lokasi_widget.dart';
import 'package:kelotimaja/search_filter/search_produk/search_produk_widget.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tour/detail_paket_tour/detail_paket_tour_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_list_tour_model.dart';
export 'search_list_tour_model.dart';

class SearchListTourWidget extends StatefulWidget {
  const SearchListTourWidget({Key? key, this.dataPage, this.searchData})
      : super(key: key);
  final String? dataPage;
  final String? searchData;

  @override
  _SearchListTourWidgetState createState() => _SearchListTourWidgetState();
}

class _SearchListTourWidgetState extends State<SearchListTourWidget> {
  late SearchListTourModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchListTourModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchProdukWidget(
                dataPage: widget.dataPage,
              ),
            ));
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).accent1,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 54.0,
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchProdukWidget(
                        dataPage: widget.dataPage,
                      ),
                    ));
              },
            ),
            title: Text(
              'Pencarian Tour',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: Colors.white,
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Generated code for this bg Widget...
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.16,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xB5EEEEEE),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchProdukWidget(
                                                dataPage: widget.dataPage,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  widget.searchData.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20,
                                              borderWidth: 1,
                                              buttonSize: 30,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              icon: Icon(
                                                Icons.search_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 14,
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
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Jenis paket',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Open Trip',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Colors.white,
                                                fontSize: 11,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                        Switch.adaptive(
                                          value: _model.switchValue ??= true,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.switchValue = newValue!);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .grayIcon,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        Text(
                                          'Private Trip',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Colors.white,
                                                fontSize: 11,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Generated code for this Row Widget...
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Filter Lokasi',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PilihLokasiWidget(
                                              dataPage: widget.dataPage,
                                              searchData: widget.searchData,
                                            ),
                                          ),
                                        );
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.menu,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7, 0, 0, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: Color(0xFF49BDD6),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                //   child: FutureBuilder<ApiCallResponse>(
                //     future: TourGroup.tourListCall.call(),
                //     builder: (context, snapshot) {
                //       // Customize what your widget looks like when it's loading.
                //       if (!snapshot.hasData) {
                //         return Center(
                //           child: SizedBox(
                //             width: 50.0,
                //             height: 50.0,
                //             child: CircularProgressIndicator(
                //               color: FlutterFlowTheme.of(context).tertiary400,
                //             ),
                //           ),
                //         );
                //       }
                //       final columnTourListResponse = snapshot.data!;
                //       return Builder(
                //         builder: (context) {
                //           final tourList = TourGroup.tourListCall
                //                   .dataTour(
                //                     columnTourListResponse.jsonBody,
                //                   )
                //                   ?.toList() ??
                //               [];
                //           final filteredTourList =
                //               tourList.where((tourListItem) {
                //             final isPrivate = tourListItem['is_private'] ?? 0;
                //             return (_model.switchValue! && isPrivate == 1) ||
                //                 (!_model.switchValue! && isPrivate == 0);
                //           }).toList();
                //           return Column(
                //             mainAxisSize: MainAxisSize.max,
                //             children:
                //                 //   List.generate(tourList.length, (tourListIndex) {
                //                 // final tourListItem = tourList[tourListIndex];
                //                 List.generate(filteredTourList.length,
                //                     (tourListIndex) {
                //               final tourListItem =
                //                   filteredTourList[tourListIndex];
                //               return Padding(
                //                 padding: EdgeInsetsDirectional.fromSTEB(
                //                     10.0, 10.0, 10.0, 10.0),
                //                 child: Container(
                //                   width: double.infinity,
                //                   decoration: BoxDecoration(
                //                     color: FlutterFlowTheme.of(context)
                //                         .secondaryBackground,
                //                     borderRadius: BorderRadius.circular(8.0),
                //                   ),
                //                   child: Stack(
                //                     children: [
                //                       Padding(
                //                         padding: EdgeInsetsDirectional.fromSTEB(
                //                             10.0, 10.0, 10.0, 10.0),
                //                         child: InkWell(
                //                           splashColor: Colors.transparent,
                //                           focusColor: Colors.transparent,
                //                           hoverColor: Colors.transparent,
                //                           highlightColor: Colors.transparent,
                //                           onTap: () async {
                //                             await Navigator.push(
                //                               context,
                //                               MaterialPageRoute(
                //                                 builder: (context) =>
                //                                     DetailPaketTourWidget(
                //                                   tourData: tourListItem,
                //                                   tourID: getJsonField(
                //                                     tourListItem,
                //                                     r'''$.id''',
                //                                   ).toString(),
                //                                   tourListData: getJsonField(
                //                                     tourListItem,
                //                                     r'''$.itinerary[:].hari[:]''',
                //                                   ),
                //                                 ),
                //                               ),
                //                             );
                //                           },
                //                           child: Column(
                //                             mainAxisSize: MainAxisSize.max,
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             children: [
                //                               ClipRRect(
                //                                 borderRadius:
                //                                     BorderRadius.circular(8.0),
                //                                 child: Image.network(
                //                                   valueOrDefault<String>(
                //                                     getJsonField(
                //                                       tourListItem,
                //                                       r'''$.banner''',
                //                                     )['400x350'],
                //                                     'https://sentosawisata.com/wp-content/uploads/2020/02/Paket-Tour-Labuan-Bajo-Komodo.jpg',
                //                                   ),
                //                                   width: double.infinity,
                //                                   height: 150.0,
                //                                   fit: BoxFit.cover,
                //                                 ),
                //                               ),
                //                               Padding(
                //                                 padding: EdgeInsetsDirectional
                //                                     .fromSTEB(
                //                                         0.0, 10.0, 0.0, 0.0),
                //                                 child: Text(
                //                                   getJsonField(
                //                                     tourListItem,
                //                                     r'''$.title''',
                //                                   ).toString(),
                //                                   style: FlutterFlowTheme.of(
                //                                           context)
                //                                       .bodyLarge,
                //                                 ),
                //                               ),
                //                               Row(
                //                                 mainAxisSize: MainAxisSize.max,
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment
                //                                         .spaceBetween,
                //                                 children: [
                //                                   Row(
                //                                     mainAxisSize:
                //                                         MainAxisSize.max,
                //                                     children: [
                //                                       Icon(
                //                                         Icons.star_rate_rounded,
                //                                         color:
                //                                             Color(0xFFFFA130),
                //                                         size: 21.0,
                //                                       ),
                //                                       if (getJsonField(
                //                                             tourListItem,
                //                                             r'''$.review_score''',
                //                                           ) !=
                //                                           null)
                //                                         Align(
                //                                           alignment:
                //                                               AlignmentDirectional(
                //                                                   -0.45, -0.5),
                //                                           child: Padding(
                //                                             padding:
                //                                                 EdgeInsetsDirectional
                //                                                     .fromSTEB(
                //                                                         4.0,
                //                                                         3.0,
                //                                                         0.0,
                //                                                         0.0),
                //                                             child: Text(
                //                                               getJsonField(
                //                                                 tourListItem,
                //                                                 r'''$.review_score''',
                //                                               ).toString(),
                //                                               style: FlutterFlowTheme
                //                                                       .of(context)
                //                                                   .titleSmall
                //                                                   .override(
                //                                                     fontFamily:
                //                                                         FlutterFlowTheme.of(context)
                //                                                             .titleSmallFamily,
                //                                                     fontSize:
                //                                                         12.0,
                //                                                     useGoogleFonts: GoogleFonts
                //                                                             .asMap()
                //                                                         .containsKey(
                //                                                             FlutterFlowTheme.of(context).titleSmallFamily),
                //                                                   ),
                //                                             ),
                //                                           ),
                //                                         ),
                //                                       if (getJsonField(
                //                                             tourListItem,
                //                                             r'''$.review_score''',
                //                                           ) ==
                //                                           null)
                //                                         Align(
                //                                           alignment:
                //                                               AlignmentDirectional(
                //                                                   -0.45, -0.5),
                //                                           child: Padding(
                //                                             padding:
                //                                                 EdgeInsetsDirectional
                //                                                     .fromSTEB(
                //                                                         4.0,
                //                                                         3.0,
                //                                                         0.0,
                //                                                         0.0),
                //                                             child: Text(
                //                                               '0.0',
                //                                               style: FlutterFlowTheme
                //                                                       .of(context)
                //                                                   .titleSmall
                //                                                   .override(
                //                                                     fontFamily:
                //                                                         FlutterFlowTheme.of(context)
                //                                                             .titleSmallFamily,
                //                                                     fontSize:
                //                                                         12.0,
                //                                                     useGoogleFonts: GoogleFonts
                //                                                             .asMap()
                //                                                         .containsKey(
                //                                                             FlutterFlowTheme.of(context).titleSmallFamily),
                //                                                   ),
                //                                             ),
                //                                           ),
                //                                         ),
                //                                     ],
                //                                   ),
                //                                   if (getJsonField(
                //                                         tourListItem,
                //                                         r'''$.is_private''',
                //                                       ) ==
                //                                       1)
                //                                     Padding(
                //                                       padding:
                //                                           EdgeInsetsDirectional
                //                                               .fromSTEB(
                //                                                   0.0,
                //                                                   0.0,
                //                                                   5.0,
                //                                                   0.0),
                //                                       child: Text(
                //                                         'Private Trip',
                //                                         style:
                //                                             FlutterFlowTheme.of(
                //                                                     context)
                //                                                 .bodyMedium
                //                                                 .override(
                //                                                   fontFamily: FlutterFlowTheme.of(
                //                                                           context)
                //                                                       .bodyMediumFamily,
                //                                                   color: FlutterFlowTheme.of(
                //                                                           context)
                //                                                       .alternate,
                //                                                   fontSize:
                //                                                       11.0,
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .w600,
                //                                                   useGoogleFonts: GoogleFonts
                //                                                           .asMap()
                //                                                       .containsKey(
                //                                                           FlutterFlowTheme.of(context)
                //                                                               .bodyMediumFamily),
                //                                                 ),
                //                                       ),
                //                                     ),
                //                                   if (getJsonField(
                //                                         tourListItem,
                //                                         r'''$.is_private''',
                //                                       ) ==
                //                                       0)
                //                                     Padding(
                //                                       padding:
                //                                           EdgeInsetsDirectional
                //                                               .fromSTEB(
                //                                                   0.0,
                //                                                   0.0,
                //                                                   5.0,
                //                                                   0.0),
                //                                       child: Text(
                //                                         'Open Trip',
                //                                         style:
                //                                             FlutterFlowTheme.of(
                //                                                     context)
                //                                                 .bodyMedium
                //                                                 .override(
                //                                                   fontFamily: FlutterFlowTheme.of(
                //                                                           context)
                //                                                       .bodyMediumFamily,
                //                                                   color: FlutterFlowTheme.of(
                //                                                           context)
                //                                                       .success,
                //                                                   fontSize:
                //                                                       11.0,
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .w600,
                //                                                   useGoogleFonts: GoogleFonts
                //                                                           .asMap()
                //                                                       .containsKey(
                //                                                           FlutterFlowTheme.of(context)
                //                                                               .bodyMediumFamily),
                //                                                 ),
                //                                       ),
                //                                     ),
                //                                 ],
                //                               ),
                //                               Padding(
                //                                 padding: EdgeInsetsDirectional
                //                                     .fromSTEB(
                //                                         0.0, 10.0, 0.0, 0.0),
                //                                 child: Text(
                //                                   formatNumber(
                //                                     double.parse(getJsonField(
                //                                       tourListItem,
                //                                       r'''$.price''',
                //                                     ).toString()),
                //                                     formatType:
                //                                         FormatType.decimal,
                //                                     decimalType: DecimalType
                //                                         .commaDecimal,
                //                                     currency: 'Rp ',
                //                                   ),
                //                                   style: FlutterFlowTheme.of(
                //                                           context)
                //                                       .bodyLarge
                //                                       .override(
                //                                         fontFamily:
                //                                             FlutterFlowTheme.of(
                //                                                     context)
                //                                                 .bodyLargeFamily,
                //                                         color:
                //                                             FlutterFlowTheme.of(
                //                                                     context)
                //                                                 .error,
                //                                         fontWeight:
                //                                             FontWeight.w500,
                //                                         useGoogleFonts: GoogleFonts
                //                                                 .asMap()
                //                                             .containsKey(
                //                                                 FlutterFlowTheme.of(
                //                                                         context)
                //                                                     .bodyLargeFamily),
                //                                       ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                       Align(
                //                         alignment:
                //                             AlignmentDirectional(-1.0, 0.0),
                //                         child: Padding(
                //                           padding:
                //                               EdgeInsetsDirectional.fromSTEB(
                //                                   10.0, 10.0, 10.0, 0.0),
                //                           child: Container(
                //                             width: 200.0,
                //                             decoration: BoxDecoration(
                //                               color: Color(0x33000000),
                //                               borderRadius: BorderRadius.only(
                //                                 bottomLeft:
                //                                     Radius.circular(0.0),
                //                                 bottomRight:
                //                                     Radius.circular(8.0),
                //                                 topLeft: Radius.circular(8.0),
                //                                 topRight: Radius.circular(0.0),
                //                               ),
                //                             ),
                //                             child: Padding(
                //                               padding: EdgeInsetsDirectional
                //                                   .fromSTEB(0.0, 5.0, 0.0, 5.0),
                //                               child: Row(
                //                                 mainAxisSize: MainAxisSize.max,
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.start,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   Padding(
                //                                     padding:
                //                                         EdgeInsetsDirectional
                //                                             .fromSTEB(5.0, 0.0,
                //                                                 5.0, 0.0),
                //                                     child: Icon(
                //                                       Icons.location_on,
                //                                       color:
                //                                           FlutterFlowTheme.of(
                //                                                   context)
                //                                               .secondary,
                //                                       size: 20.0,
                //                                     ),
                //                                   ),
                //                                   Expanded(
                //                                     child: Text(
                //                                       getJsonField(
                //                                         tourListItem,
                //                                         r'''$.location.name''',
                //                                       ).toString(),
                //                                       style: TextStyle(
                //                                         fontSize: 12.0,
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               );
                //             }),
                //           );
                //         },
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
