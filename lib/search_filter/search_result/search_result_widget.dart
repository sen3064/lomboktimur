import 'package:kolaka/search_filter/pilih_lokasi/pilih_lokasi_model.dart';
import 'package:kolaka/search_filter/pilih_lokasi/pilih_lokasi_widget.dart';
import 'package:kolaka/search_filter/search_produk/search_produk_widget.dart';
import 'package:kolaka/umkm/keranjang/keranjang_widget.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/umkm/detail_produk_food/detail_produk_food_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'search_result_model.dart';
export 'search_result_model.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({
    Key? key,
    this.dataPage,
    this.locationId,
    this.searchData,
    this.keyData,
  }) : super(key: key);

  final String? dataPage;
  final String? searchData;
  final int? locationId;
  final dynamic keyData;

  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  late SearchResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    print(widget.keyData);

    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchProdukWidget(
              dataPage: widget.dataPage,
            ),
          ),
        );
        return true;
      },
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
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 24,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchProdukWidget(
                    dataPage: widget.dataPage,
                  ),
                ),
              );
            },
          ),
          title: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PilihLokasiWidget(
                      dataPage: widget.dataPage,
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Customize what your widget looks like when it's loading.

                      Text(
                        'Hasil Pencarian',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 30, 0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KeranjangWidget(
                        cartData: FFAppState().cartAddJson,
                        dataUmkm: FFAppState().productUmkm,
                      ),
                    ),
                  );
                },
                child: badges.Badge(
                  badgeContent: Text(
                    valueOrDefault<String>(
                      FFAppState().cartAddJson.length.toString(),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                  ),
                  showBadge: true,
                  child: Icon(
                    Icons.local_grocery_store_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(6),
            child: Container(),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0x59F6F5F5),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0x29000000),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchProdukWidget(
                                    dataPage: widget.dataPage,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        widget.searchData.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PilihLokasiWidget(
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
                      padding: EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF58BBD2),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    showLoadingIndicator: false,
                  ),
                ],
              ),
            ),
            if (widget.locationId != null || widget.locationId != 0)
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              //   child: FutureBuilder<ApiCallResponse>(
              //     future: UmkmGroup.lokasiProdukUMKMCall.call(
              //       locationId: widget.locationId,
              //     ),
              //     builder: (context, snapshot) {
              //       // Customize what your widget looks like when it's loading.
              //       if (!snapshot.hasData) {
              //         return Center(
              //           child: SizedBox(
              //             width: 50,
              //             height: 50,
              //             child: CircularProgressIndicator(
              //               valueColor: AlwaysStoppedAnimation<Color>(
              //                 FlutterFlowTheme.of(context).tertiary400,
              //               ),
              //             ),
              //           ),
              //         );
              //       }
              //       final gridViewListProdukUMKMResponse = snapshot.data!;
              //       return Builder(
              //         builder: (context) {
              //           final jsonBody =
              //               gridViewListProdukUMKMResponse.jsonBody;
              //           if (jsonBody == null) {
              //             // Handle the case when jsonBody is null (e.g., show an error message)
              //             return Center(
              //               child: Text("Pencarian tidak ditemukan"),
              //             );
              //           }
              //           final listFilterProduct =
              //               gridViewListProdukUMKMResponse.jsonBody.toList();
              //           final filteredProducts =
              //               listFilterProduct.where((product) {
              //             final productName =
              //                 getJsonField(product, r'$.name') ?? '';
              //             return productName.toLowerCase().contains(
              //                 widget.searchData?.toLowerCase() ?? '') as bool;
              //           }).toList();
              //           // print(listFilterProduct);
              //           return GridView.builder(
              //             padding: EdgeInsets.zero,
              //             gridDelegate:
              //                 SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               crossAxisSpacing: 10,
              //               mainAxisSpacing: 10,
              //               childAspectRatio: 0.7,
              //             ),
              //             shrinkWrap: true,
              //             physics: NeverScrollableScrollPhysics(),
              //             scrollDirection: Axis.vertical,
              //             itemCount: filteredProducts.length,
              //             itemBuilder: (context, filteredProductsIndex) {
              //               final listFilterProductItem =
              //                   filteredProducts[filteredProductsIndex];
              //               return InkWell(
              //                 splashColor: Colors.transparent,
              //                 focusColor: Colors.transparent,
              //                 hoverColor: Colors.transparent,
              //                 highlightColor: Colors.transparent,
              //                 onTap: () async {
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) =>
              //                           DetailProdukFoodWidget(
              //                         umkmData: listFilterProductItem,
              //                         umkmId: getJsonField(
              //                           listFilterProductItem,
              //                           r'''$.id''',
              //                         ).toString(),
              //                         variants: getJsonField(
              //                           listFilterProductItem,
              //                           r'''$.variants[:]''',
              //                         ),
              //                       ),
              //                     ),
              //                   );
              //                 },
              //                 child: Card(
              //                   clipBehavior: Clip.antiAliasWithSaveLayer,
              //                   color: FlutterFlowTheme.of(context)
              //                       .secondaryBackground,
              //                   elevation: 4,
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                   ),
              //                   child: Container(
              //                     width: 180,
              //                     decoration: BoxDecoration(
              //                       color: FlutterFlowTheme.of(context)
              //                           .primaryBackground,
              //                       boxShadow: [
              //                         BoxShadow(
              //                           blurRadius: 4,
              //                           color: Color(0x33000000),
              //                           offset: Offset(0, 2),
              //                         )
              //                       ],
              //                       borderRadius: BorderRadius.circular(8),
              //                     ),
              //                     child: Padding(
              //                       padding: EdgeInsetsDirectional.fromSTEB(
              //                           0, 0, 0, 10),
              //                       child: Column(
              //                         mainAxisSize: MainAxisSize.min,
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           ClipRRect(
              //                             borderRadius:
              //                                 BorderRadius.circular(8),
              //                             child: Image.network(
              //                               getJsonField(listFilterProductItem,
              //                                   r'''$.banner''')['400x350'],
              //                               width: double.infinity,
              //                               height: 140,
              //                               fit: BoxFit.cover,
              //                             ),
              //                           ),
              //                           // Row(
              //                           //   mainAxisSize: MainAxisSize.max,
              //                           //   children: [
              //                           //     Padding(
              //                           //       padding: EdgeInsetsDirectional
              //                           //           .fromSTEB(10, 5, 0, 0),
              //                           //       child: Text(
              //                           //         '1.6 km',
              //                           //         style:
              //                           //             FlutterFlowTheme.of(context)
              //                           //                 .bodySmall,
              //                           //       ),
              //                           //     ),
              //                           //   ],
              //                           // ),
              //                           Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: [
              //                               Flexible(
              //                                 child: Padding(
              //                                   padding: EdgeInsetsDirectional
              //                                       .fromSTEB(10, 0, 0, 0),
              //                                   child: Text(
              //                                     getJsonField(
              //                                       listFilterProductItem,
              //                                       r'''$.name''',
              //                                     ).toString(),
              //                                     style: FlutterFlowTheme.of(
              //                                             context)
              //                                         .bodyLarge
              //                                         .override(
              //                                           fontFamily:
              //                                               FlutterFlowTheme.of(
              //                                                       context)
              //                                                   .bodyLargeFamily,
              //                                           fontWeight:
              //                                               FontWeight.w500,
              //                                           useGoogleFonts: GoogleFonts
              //                                                   .asMap()
              //                                               .containsKey(
              //                                                   FlutterFlowTheme.of(
              //                                                           context)
              //                                                       .bodyLargeFamily),
              //                                         ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                           Expanded(
              //                             child: Padding(
              //                               padding:
              //                                   EdgeInsetsDirectional.fromSTEB(
              //                                       10, 0, 0, 10),
              //                               child: Row(
              //                                 mainAxisSize: MainAxisSize.min,
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.start,
              //                                 children: [
              //                                   Icon(
              //                                     Icons.star_purple500_sharp,
              //                                     color: FlutterFlowTheme.of(
              //                                             context)
              //                                         .warning,
              //                                     size: 20,
              //                                   ),
              //                                   Padding(
              //                                     padding: EdgeInsetsDirectional
              //                                         .fromSTEB(5, 0, 0, 0),
              //                                     child: Text(
              //                                       '${getJsonField(
              //                                         listFilterProductItem,
              //                                         r'''$.total_sales''',
              //                                       ).toString()} - terjual',
              //                                       style: FlutterFlowTheme.of(
              //                                               context)
              //                                           .bodySmall,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                           Padding(
              //                             padding:
              //                                 EdgeInsetsDirectional.fromSTEB(
              //                                     10, 0, 10, 0),
              //                             child: Row(
              //                               mainAxisSize: MainAxisSize.max,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   formatNumber(
              //                                     double.parse(getJsonField(
              //                                       listFilterProductItem,
              //                                       r'''$.price''',
              //                                     ).toString()),
              //                                     formatType:
              //                                         FormatType.decimal,
              //                                     decimalType:
              //                                         DecimalType.commaDecimal,
              //                                     currency: 'Rp ',
              //                                   ),
              //                                   style:
              //                                       FlutterFlowTheme.of(context)
              //                                           .bodyMedium
              //                                           .override(
              //                                             fontFamily:
              //                                                 FlutterFlowTheme.of(
              //                                                         context)
              //                                                     .bodyMediumFamily,
              //                                             color: FlutterFlowTheme
              //                                                     .of(context)
              //                                                 .error,
              //                                             fontWeight:
              //                                                 FontWeight.w500,
              //                                             useGoogleFonts: GoogleFonts
              //                                                     .asMap()
              //                                                 .containsKey(
              //                                                     FlutterFlowTheme.of(
              //                                                             context)
              //                                                         .bodyMediumFamily),
              //                                           ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
            if (widget.locationId == null || widget.locationId == 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Builder(
                  builder: (context) {
                    final searchData = widget.keyData?.toList() ?? [];

                    if (searchData.isEmpty) {
                      return Center(
                        child: Text('Kata kunci pencarianmu tidak di temukan'),
                      );
                    }
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: searchData.length,
                      itemBuilder: (context, searchDataIndex) {
                        final listFilterProductItem =
                            searchData[searchDataIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProdukFoodWidget(
                                  umkmData: listFilterProductItem,
                                  umkmId: getJsonField(
                                    listFilterProductItem,
                                    r'''$.id''',
                                  ).toString(),
                                  variants: getJsonField(
                                    listFilterProductItem,
                                    r'''$.variants[:]''',
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        getJsonField(listFilterProductItem,
                                            r'''$.banner''')['400x350'],
                                        width: double.infinity,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // Row(
                                    //   mainAxisSize: MainAxisSize.max,
                                    //   children: [
                                    //     Padding(
                                    //       padding: EdgeInsetsDirectional
                                    //           .fromSTEB(10, 5, 0, 0),
                                    //       child: Text(
                                    //         '1.6 km',
                                    //         style:
                                    //             FlutterFlowTheme.of(context)
                                    //                 .bodySmall,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              getJsonField(
                                                listFilterProductItem,
                                                r'''$.name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
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
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_purple500_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                '${getJsonField(
                                                  listFilterProductItem,
                                                  r'''$.total_sales''',
                                                ).toString()} - terjual',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            formatNumber(
                                              double.parse(getJsonField(
                                                listFilterProductItem,
                                                r'''$.price''',
                                              ).toString()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontWeight: FontWeight.w500,
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
    );
  }
}
