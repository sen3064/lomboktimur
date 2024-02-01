import 'dart:async';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kolaka/search_filter/search_produk/search_produk_widget.dart';
import 'package:kolaka/theme.dart';

import '../detail_produk_food/detail_produk_food_widget.dart';
import '../keranjang/keranjang_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/pilih_lokasi_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'list_produk_filter_model.dart';
export 'list_produk_filter_model.dart';

class ListProdukFilterWidget extends StatefulWidget {
  const ListProdukFilterWidget({
    Key? key,
    required this.subcategoryId,
    this.dataPage,
  }) : super(key: key);
  final String? dataPage;

  final int? subcategoryId;

  @override
  _ListProdukFilterWidgetState createState() => _ListProdukFilterWidgetState();
}

class _ListProdukFilterWidgetState extends State<ListProdukFilterWidget> {
  late ListProdukFilterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListProdukFilterModel());
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
                  Navigator.pop(context);
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
                            padding: MediaQuery.of(context).viewInsets,
                            child: Scaffold(
                              body: GestureDetector(
                                onTap: () => Navigator.pop(context),
                              ),
                              backgroundColor: Colors.transparent,
                              bottomSheet: PilihLokasiWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Generated code for this Text Widget UMKM Makanan Minuman...
                          if (widget.subcategoryId.toString() == '11')
                            FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            UmkmGroup.filterKategoriCall.call(
                                          umkmid: widget.subcategoryId,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary400,
                                      ),
                                    ),
                                  );
                                }
                                final textFilterKategoriResponse =
                                    snapshot.data!;
                                return Text(
                                  'Makanan & Minuman',
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
                                );
                              },
                            ), // Generated code for this Text Widget UMKM Fashion...
                          if (widget.subcategoryId.toString() == '12')
                            FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            UmkmGroup.filterKategoriCall.call(
                                          umkmid: widget.subcategoryId,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary400,
                                      ),
                                    ),
                                  );
                                }
                                final textFilterKategoriResponse =
                                    snapshot.data!;
                                return Text(
                                  'Fashion',
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
                                );
                              },
                            ), // Generated code for this Text Widget UMKM Kerajinan...
                          if (widget.subcategoryId.toString() == '13')
                            FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            UmkmGroup.filterKategoriCall.call(
                                          umkmid: widget.subcategoryId,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary400,
                                      ),
                                    ),
                                  );
                                }
                                final textFilterKategoriResponse =
                                    snapshot.data!;
                                return Text(
                                  'Kerajinan',
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
                                );
                              },
                            ), // Generated code for this Text Widget UMKM Dekorasi...
                          if (widget.subcategoryId.toString() == '14')
                            FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            UmkmGroup.filterKategoriCall.call(
                                          umkmid: widget.subcategoryId,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary400,
                                      ),
                                    ),
                                  );
                                }
                                final textFilterKategoriResponse =
                                    snapshot.data!;
                                return Text(
                                  'Dekorasi',
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
                                );
                              },
                            ), // Generated code for this Text Widget UMKM Aksesoris...
                          if (widget.subcategoryId.toString() == '15')
                            FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            UmkmGroup.filterKategoriCall.call(
                                          umkmid: widget.subcategoryId,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary400,
                                      ),
                                    ),
                                  );
                                }
                                final textFilterKategoriResponse =
                                    snapshot.data!;
                                return Text(
                                  'Aksesoris',
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
                                );
                              },
                            ), // Generated code for this Text Widget UMKM Kosmetik...
                          if (widget.subcategoryId.toString() == '16')
                            FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(
                                            UmkmGroup.filterKategoriCall.call(
                                          umkmid: widget.subcategoryId,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary400,
                                      ),
                                    ),
                                  );
                                }
                                final textFilterKategoriResponse =
                                    snapshot.data!;
                                return Text(
                                  'Kosmetik',
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
                                );
                              },
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
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
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
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
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
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0x59F6F5F5),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0x29000000),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 15,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Mau belanja apa hari ini?',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
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
              centerTitle: false,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(UmkmGroup.filterKategoriCall.call(
                                umkmid: widget.subcategoryId,
                              )))
                        .future,
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
                      final gridViewFilterKategoriResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final jsonBody =
                              gridViewFilterKategoriResponse.jsonBody;
                          if (jsonBody == null) {
                            // Handle the case when jsonBody is null (e.g., show an error message)
                            return Center(
                              child: Text("koneksi tidak stabil"),
                            );
                          }
                          final listFilterProduct =
                              gridViewFilterKategoriResponse.jsonBody.toList();
                          return RefreshIndicator(
                            onRefresh: () async {
                              print('refresh bawah');
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listFilterProduct.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, listUmkmIndex) {
                                final listUmkmItem =
                                    listFilterProduct[listUmkmIndex];
                                print(
                                    "Data for item $listUmkmIndex: $listUmkmItem");

                                String originalName =
                                    getJsonField(listUmkmItem, r'''$.name''')
                                            ?.toString() ??
                                        '';
                                String truncatedName = originalName.length > 30
                                    ? originalName.substring(0, 30) + '...'
                                    : originalName;

                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailProdukFoodWidget(
                                            umkmData: listUmkmItem,
                                            umkmId: getJsonField(
                                              listUmkmItem,
                                              r'''$.id''',
                                            ).toString(),
                                            variants: getJsonField(
                                              listUmkmItem,
                                              r'''$.variants''',
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            getJsonField(listUmkmItem,
                                                r'''$.banner''')['400x350'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 5, 10, 0),
                                          child: Text(
                                            capitalize(truncatedName),
                                            style: semibold12_5.copyWith(
                                                color: dark2),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
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
                                                size: 15,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  '0 ',
                                                  style: regular10.copyWith(
                                                      color: dark2),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                0.0,
                                                                5.0,
                                                                0.0),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  65,
                                                                  64,
                                                                  64),
                                                      size: 10.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                        listUmkmItem,
                                                        r'''$.location_name''',
                                                      ).toString(),
                                                      style: TextStyle(
                                                        color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  65,
                                                                  64,
                                                                  64),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                formatNumber(
                                                  double.parse(getJsonField(
                                                    listUmkmItem,
                                                    r'''$.price''',
                                                  ).toString()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'Rp',
                                                ),
                                                style: semibold14.copyWith(
                                                    color: red1),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
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
                ],
              ),
            )),
      ),
    );
  }
}

String capitalize(String text) {
  if (text == null || text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}


 //                           GridView.count(
                            // crossAxisCount: 2,
                            // crossAxisSpacing: 10,
                            // mainAxisSpacing: 10,
                            // childAspectRatio: 0.7,
                            // children: List.generate(listFilterProduct.length, (index) {
                            //   final listFilterProductItem = listFilterProduct[index];

                            // child: GridView.builder(
                            //   padding: EdgeInsets.zero,
                            //   gridDelegate:
                            //       SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount: 2,
                            //     crossAxisSpacing: 10,
                            //     mainAxisSpacing: 10,
                            //     childAspectRatio: 0.9,
                            //   ),
                            //   shrinkWrap: true,
                            //   physics: NeverScrollableScrollPhysics(),
                            //   scrollDirection: Axis.vertical,
                            //   itemCount: listFilterProduct.length,
                            //   itemBuilder: (context, listFilterProductIndex) {
                            //     final listFilterProductItem =
                            //         listFilterProduct[listFilterProductIndex];

                            //     String originalName = getJsonField(
                            //                 listFilterProductItem,
                            //                 r'''$.name''')
                            //             ?.toString() ??
                            //         '';
                            //     String truncatedName = originalName.length > 18
                            //         ? originalName.substring(0, 18) + '...'
                            //         : originalName;
                            //     return InkWell(
                            //         onTap: () async {
                            //           await Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //               builder: (context) =>
                            //                   DetailProdukFoodWidget(
                            //                 umkmData: listFilterProductItem,
                            //                 umkmId: getJsonField(
                            //                   listFilterProductItem,
                            //                   r'''$.id''',
                            //                 ).toString(),
                            //                 variants: getJsonField(
                            //                   listFilterProductItem,
                            //                   r'''$.variants''',
                            //                 ),
                            //               ),
                            //             ),
                            //           );
                            //         },
                            //         child: Card(
                            //           clipBehavior: Clip.antiAliasWithSaveLayer,
                            //           color: FlutterFlowTheme.of(context)
                            //               .secondaryBackground,
                            //           elevation: 4,
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           child: Container(
                            //             width: 100,
                            //             decoration: BoxDecoration(
                            //               color: FlutterFlowTheme.of(context)
                            //                   .primaryBackground,
                            //               boxShadow: [
                            //                 BoxShadow(
                            //                   blurRadius: 4,
                            //                   color: Color(0x33000000),
                            //                   offset: Offset(0, 2),
                            //                 )
                            //               ],
                            //               borderRadius:
                            //                   BorderRadius.circular(8),
                            //             ),
                            //             child: Padding(
                            //               padding:
                            //                   EdgeInsetsDirectional.fromSTEB(
                            //                       0, 0, 0, 10),
                            //               child: Column(
                            //                 mainAxisSize: MainAxisSize.min,
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   ClipRRect(
                            //                     borderRadius:
                            //                         BorderRadius.circular(8),
                            //                     child: Image.network(
                            //                       getJsonField(
                            //                         listFilterProductItem,
                            //                         r'''$.banner''',
                            //                       )['400x350'],
                            //                       width: double.infinity,
                            //                       height: 140,
                            //                       fit: BoxFit.cover,
                            //                     ),
                            //                   ),
                            //                   // Row(
                            //                   //   mainAxisSize: MainAxisSize.max,
                            //                   //   children: [
                            //                   //     Padding(
                            //                   //       padding: EdgeInsetsDirectional
                            //                   //           .fromSTEB(10, 5, 0, 0),
                            //                   //       child: Text(
                            //                   //         '1.6 km',
                            //                   //         style: FlutterFlowTheme.of(
                            //                   //                 context)
                            //                   //             .bodySmall,
                            //                   //       ),
                            //                   //     ),
                            //                   //   ],
                            //                   // ),
                            //                   Row(
                            //                     mainAxisSize: MainAxisSize.max,
                            //                     children: [
                            //                       Flexible(
                            //                         child: Padding(
                            //                           padding:
                            //                               EdgeInsetsDirectional
                            //                                   .fromSTEB(
                            //                                       10, 0, 0, 0),
                            //                           child: Text(
                            //                             truncatedName,
                            //                             style:
                            //                                 FlutterFlowTheme.of(
                            //                                         context)
                            //                                     .bodyLarge
                            //                                     .override(
                            //                                       fontFamily: FlutterFlowTheme.of(
                            //                                               context)
                            //                                           .bodyLargeFamily,
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .w500,
                            //                                       useGoogleFonts: GoogleFonts
                            //                                               .asMap()
                            //                                           .containsKey(
                            //                                               FlutterFlowTheme.of(context)
                            //                                                   .bodyLargeFamily),
                            //                                     ),
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                   Expanded(
                            //                     child: Padding(
                            //                       padding: EdgeInsetsDirectional
                            //                           .fromSTEB(10, 0, 0, 10),
                            //                       child: Row(
                            //                         mainAxisSize:
                            //                             MainAxisSize.min,
                            //                         crossAxisAlignment:
                            //                             CrossAxisAlignment
                            //                                 .start,
                            //                         children: [
                            //                           Icon(
                            //                             Icons
                            //                                 .star_purple500_sharp,
                            //                             color:
                            //                                 FlutterFlowTheme.of(
                            //                                         context)
                            //                                     .warning,
                            //                             size: 20,
                            //                           ),
                            //                           Padding(
                            //                             padding:
                            //                                 EdgeInsetsDirectional
                            //                                     .fromSTEB(
                            //                                         5, 0, 0, 0),
                            //                             child: Text(
                            //                               '${getJsonField(
                            //                                 listFilterProductItem,
                            //                                 r'''$.total_sales''',
                            //                               ).toString()} - Terjual',
                            //                               style: FlutterFlowTheme
                            //                                       .of(context)
                            //                                   .bodySmall,
                            //                             ),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   Padding(
                            //                     padding: EdgeInsetsDirectional
                            //                         .fromSTEB(10, 0, 10, 0),
                            //                     child: Row(
                            //                       mainAxisSize:
                            //                           MainAxisSize.max,
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment
                            //                               .spaceBetween,
                            //                       children: [
                            //                         Text(
                            //                           formatNumber(
                            //                             double.parse(
                            //                                 getJsonField(
                            //                               listFilterProductItem,
                            //                               r'''$.price''',
                            //                             ).toString()),
                            //                             formatType:
                            //                                 FormatType.decimal,
                            //                             decimalType: DecimalType
                            //                                 .commaDecimal,
                            //                             currency: 'Rp ',
                            //                           ),
                            //                           style:
                            //                               FlutterFlowTheme.of(
                            //                                       context)
                            //                                   .bodyMedium
                            //                                   .override(
                            //                                     fontFamily: FlutterFlowTheme.of(
                            //                                             context)
                            //                                         .bodyMediumFamily,
                            //                                     color: FlutterFlowTheme.of(
                            //                                             context)
                            //                                         .error,
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .w500,
                            //                                     useGoogleFonts: GoogleFonts
                            //                                             .asMap()
                            //                                         .containsKey(
                            //                                             FlutterFlowTheme.of(context)
                            //                                                 .bodyMediumFamily),
                            //                                   ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         ));
                            //   },
                            // ),