import 'dart:async';
import 'dart:math';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kelotimaja/index.dart';
import 'package:kelotimaja/search_filter/search_produk/search_produk_widget.dart';
import 'package:kelotimaja/theme.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/pilih_lokasi_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'list_produk_pilihan_model.dart';
export 'list_produk_pilihan_model.dart';
import 'dart:core';

class ListProdukPilihanWidget extends StatefulWidget {
  const ListProdukPilihanWidget({
    Key? key,
    this.dataPage,
  }) : super(key: key);
  final String? dataPage;

  @override
  _ListProdukPilihanWidgetState createState() =>
      _ListProdukPilihanWidgetState();
}

class _ListProdukPilihanWidgetState extends State<ListProdukPilihanWidget> {
  late ListProdukPilihanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListProdukPilihanModel());
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
              // height: 60,
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
                          padding: MediaQuery.viewInsetsOf(context),
                          child: PilihLokasiWidget(),
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
                        Text(
                          'Produk Pilihan',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 30, 0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KeranjangWidget(
                          dataUmkm: FFAppState().productUmkm,
                          cartData: FFAppState().cartAddJson,
                        ),
                      ),
                    );
                  },
                  child: badges.Badge(
                    badgeContent: Text(
                      FFAppState().cartAddJson.length.toString(),
                      style: regular10.copyWith(color: white),
                    ),
                    showBadge: true,
                    child: Icon(
                      Icons.local_grocery_store_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Mau belanja apa hari ini?',
                                  style: regular12_5.copyWith(color: dark2),
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
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(UmkmGroup.listProdukUMKMCall.call()))
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
                      final gridViewListProdukUMKMResponse = snapshot.data!;
                      final jsonBody = gridViewListProdukUMKMResponse.jsonBody;
                      if (jsonBody == null) {
                        // Handle the case when jsonBody is null (e.g., show an error message)
                        return Center(
                          child: Text("Koneksi tidak stabil"),
                        );
                      }

                      final listUmkm =
                          gridViewListProdukUMKMResponse.jsonBody.toList();
                      // final random = Random();
                      // listUmkm.shuffle(random);
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _model.apiRequestCompleter = null);
                          await _model.waitForApiRequestCompleted();
                        },
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listUmkm.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, listUmkmIndex) {
                            final listUmkmItem = listUmkm[listUmkmIndex];
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        getJsonField(listUmkmItem,
                                            r'''$.banner''')['400x350'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 5, 10, 0),
                                      child: Text(
                                        capitalize(truncatedName),
                                        style:
                                            semibold12_5.copyWith(color: dark2),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              '0 ',
                                              style: regular10.copyWith(
                                                  color: dark2),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Icon(
                                              Icons.location_on,
                                              color: const Color.fromARGB(
                                                  255, 65, 64, 64),
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
                                                color: const Color.fromARGB(
                                                    255, 65, 64, 64),
                                                fontWeight: FontWeight.w400,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                              formatType: FormatType.decimal,
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

String capitalize(String text) {
  if (text == null || text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
