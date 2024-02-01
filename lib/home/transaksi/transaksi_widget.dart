import 'package:get/get.dart';
import 'package:kolaka/components/webview_screen.dart';
import 'package:kolaka/flutter_flow/flutter_flow_widgets.dart';
import 'package:kolaka/transaksi/c_penginapanpesananditerima_transaksi/c_penginapanpesananditerima_transaksi_widget.dart';
import 'package:shimmer/shimmer.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'transaksi_model.dart';
export 'transaksi_model.dart';

class TransaksiWidget extends StatefulWidget {
  const TransaksiWidget({Key? key}) : super(key: key);

  @override
  _TransaksiWidgetState createState() => _TransaksiWidgetState();
}

class _TransaksiWidgetState extends State<TransaksiWidget> {
  late TransaksiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransaksiModel());
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
              builder: (context) => NavBarPage(initialPage: 'Home_Page'),
            ));
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 80, 20, 60),
                        child: DefaultTabController(
                          length: 7,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(-1, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  indicatorWeight: 4,
                                  tabs: [
                                    Tab(
                                      text: 'Belum Bayar',
                                    ),
                                    Tab(
                                      text: 'Di Bayar',
                                    ),
                                    Tab(
                                      text: 'Di Proses',
                                    ),
                                    Tab(
                                      text: 'Di Kirim',
                                    ),
                                    Tab(
                                      text: 'Selesai',
                                    ),
                                    Tab(
                                      text: 'Pembatalan',
                                    ),
                                    Tab(
                                      text: 'Di Batalkan',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    FutureBuilder<ApiCallResponse>(
                                      future: BookingHandlerGroup.transaksiCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                              ],
                                            ),
                                          ));
                                        }
                                        final listViewTransaksiResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final dataTransaksi =
                                                (BookingHandlerGroup
                                                            .transaksiCall
                                                            .dataTransaksi(
                                                              listViewTransaksiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [])
                                                    .where(
                                                        (dataTransaksiItem) =>
                                                            dataTransaksiItem[
                                                                'status'] ==
                                                            'waiting')
                                                    .toList();
                                            if (dataTransaksi.isEmpty) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  children: [
                                                    Text('Belum ada transaksi'),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Home_Page'),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Mulai Transaksi',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100,
                                                          height: 40,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              primary: false,
                                              shrinkWrap: true,
                                              // physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: dataTransaksi.length,
                                              itemBuilder: (context,
                                                  dataTransaksiIndex) {
                                                final dataTransaksiItem =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                Map<String, dynamic> data =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                dynamic dataDetail =
                                                    json.decode(
                                                        data['data_detail']);
                                                // print('ini data detail: ${dataDetail}');
                                                // if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'){

                                                // Map<String, dynamic> imgBanner = ;
                                                // }
                                                // print(imgBanner);
                                                // if (data['code']
                                                //         .toString()
                                                //         .substring(0, 1) ==
                                                //     'U') {}

                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((getJsonField(
                                                              dataTransaksiItem,
                                                              r'''$.status''') ==
                                                          'waiting'))
                                                        Get.to(
                                                            () =>
                                                                WebViewScreen(),
                                                            arguments: {
                                                              'title':
                                                                  'Pembayaran',
                                                              'url': (getJsonField(
                                                                  dataTransaksiItem,
                                                                  r'''$.payment.redirect_url'''))
                                                            });
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Menunggu Pembayaran',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          fontSize:
                                                                              12,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'F' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'U')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataDetail,
                                                                                r'''$.toko.banner''') ??
                                                                            'https://icon-library.com/images/shop-icon/shop-icon-29.jpg',
                                                                        // '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'W' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'R')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        // getJsonField(
                                                                        //     dataDetail,
                                                                        //     r'''$.banner''')['400x350'],
                                                                        getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'H'
                                                                            ? getJsonField(dataDetail,
                                                                                r'''$.banner''')['400x350']
                                                                            : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                ? dataDetail['tiket-wisata']['banner']['200x150']
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                    ? dataDetail['transportasi']['banner']['200x150']
                                                                                    : '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'W' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'R')
                                                                          Text(
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                ? getJsonField(dataDetail, r'''$.hotel_title''')
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                    ? dataDetail['tiket-wisata']['title']
                                                                                    : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                        ? dataDetail['transportasi']['title']
                                                                                        : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'F')
                                                                          Text(
                                                                            getJsonField(dataDetail,
                                                                                r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'U')
                                                                          Text(
                                                                            () {
                                                                              try {
                                                                                return getJsonField(dataDetail, r'''$.toko.name''') ?? getJsonField(dataDetail, r'''$.items[0].name''');
                                                                              } catch (e) {
                                                                                return getJsonField(dataDetail, r'''$.items[0].name''');
                                                                              }
                                                                            }(),
                                                                            // getJsonField(dataDetail,
                                                                            //     r'''$.toko.name'''),
                                                                            // '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                child: Text(
                                                                                  'No Pesanan :',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    dataTransaksiItem,
                                                                                    r'''$.code''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                              child: Text(
                                                                                'Kategori :',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'hotel'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Penginapan',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'food-beverage'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Makanan dan Minuman',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'umkm'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'UMKM',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'tiket-wisata'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Tiket Wisata',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
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
                                        );
                                      },
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: BookingHandlerGroup.transaksiCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                              ],
                                            ),
                                          ));
                                        }
                                        final listViewTransaksiResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final dataTransaksi =
                                                (BookingHandlerGroup
                                                            .transaksiCall
                                                            .dataTransaksi(
                                                              listViewTransaksiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [])
                                                    .where(
                                                        (dataTransaksiItem) =>
                                                            dataTransaksiItem[
                                                                'status'] ==
                                                            'Payment Sukses')
                                                    .toList();
                                            if (dataTransaksi.isEmpty) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  children: [
                                                    Text('Belum ada transaksi'),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Home_Page'),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Mulai Transaksi',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100,
                                                          height: 40,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              primary: false,
                                              shrinkWrap: true,
                                              // physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: dataTransaksi.length,
                                              itemBuilder: (context,
                                                  dataTransaksiIndex) {
                                                final dataTransaksiItem =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                Map<String, dynamic> data =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                dynamic dataDetail =
                                                    json.decode(
                                                        data['data_detail']);

                                                // if (data['code']
                                                //         .toString()
                                                //         .substring(0, 1) ==
                                                //     'U') {}

                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((getJsonField(
                                                              dataTransaksiItem,
                                                              r'''$.status''') !=
                                                          'waiting'))
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CPenginapanpesananditerimaTransaksiWidget(
                                                              detailData:
                                                                  dataTransaksiItem,
                                                            ),
                                                          ),
                                                        );
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((getJsonField(
                                                                        dataTransaksiItem,
                                                                        r'''$.status''') ==
                                                                    'Payment Sukses'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Pembayaran Berhasil',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            fontSize:
                                                                                12,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'F' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'U')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataDetail,
                                                                                r'''$.toko.banner''') ??
                                                                            'https://icon-library.com/images/shop-icon/shop-icon-29.jpg',
                                                                        // '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'W' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'R')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        // getJsonField(
                                                                        //     dataDetail,
                                                                        //     r'''$.banner''')['400x350'],
                                                                        getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'H'
                                                                            ? getJsonField(dataDetail,
                                                                                r'''$.banner''')['400x350']
                                                                            : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                ? dataDetail['tiket-wisata']['banner']['200x150']
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                    ? dataDetail['transportasi']['banner']['200x150']
                                                                                    : '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'W' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'R')
                                                                          Text(
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                ? getJsonField(dataDetail, r'''$.hotel_title''')
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                    ? dataDetail['tiket-wisata']['title']
                                                                                    : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                        ? dataDetail['transportasi']['title']
                                                                                        : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'F')
                                                                          Text(
                                                                            getJsonField(dataDetail,
                                                                                r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'U')
                                                                          Text(
                                                                            () {
                                                                              try {
                                                                                return getJsonField(dataDetail, r'''$.toko.name''') ?? getJsonField(dataDetail, r'''$.items[0].name''');
                                                                              } catch (e) {
                                                                                return getJsonField(dataDetail, r'''$.items[0].name''');
                                                                              }
                                                                            }(),
                                                                            // getJsonField(dataDetail,
                                                                            //     r'''$.toko.name'''),
                                                                            // '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                child: Text(
                                                                                  'No Pesanan :',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    dataTransaksiItem,
                                                                                    r'''$.code''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                              child: Text(
                                                                                'Kategori :',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'hotel'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Penginapan',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'food-beverage'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Makanan dan Minuman',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'umkm'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'UMKM',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'tiket-wisata'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Tiket Wisata',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
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
                                        );
                                      },
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: BookingHandlerGroup.transaksiCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                              ],
                                            ),
                                          ));
                                        }
                                        final listViewTransaksiResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final dataTransaksi =
                                                (BookingHandlerGroup
                                                            .transaksiCall
                                                            .dataTransaksi(
                                                              listViewTransaksiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [])
                                                    .where(
                                                        (dataTransaksiItem) =>
                                                            dataTransaksiItem[
                                                                    'status'] ==
                                                                'Proses' ||
                                                            dataTransaksiItem[
                                                                    'status'] ==
                                                                'Partial')
                                                    .toList();
                                            if (dataTransaksi.isEmpty) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  children: [
                                                    Text('Belum ada transaksi'),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Home_Page'),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Mulai Transaksi',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100,
                                                          height: 40,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              primary: false,
                                              shrinkWrap: true,
                                              // physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: dataTransaksi.length,
                                              itemBuilder: (context,
                                                  dataTransaksiIndex) {
                                                final dataTransaksiItem =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                Map<String, dynamic> data =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                dynamic dataDetail =
                                                    json.decode(
                                                        data['data_detail']);

                                                // if (data['code']
                                                //         .toString()
                                                //         .substring(0, 1) ==
                                                //     'U') {}

                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((getJsonField(
                                                              dataTransaksiItem,
                                                              r'''$.status''') !=
                                                          'waiting'))
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CPenginapanpesananditerimaTransaksiWidget(
                                                              detailData:
                                                                  dataTransaksiItem,
                                                            ),
                                                          ),
                                                        );
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((getJsonField(
                                                                            dataTransaksiItem,
                                                                            r'''$.status''') ==
                                                                        'Proses' ||
                                                                    getJsonField(
                                                                            dataTransaksiItem,
                                                                            r'''$.status''') ==
                                                                        'Partial'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Pesanan Diproses',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                Color(0xFFC08423),
                                                                            fontSize:
                                                                                12,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'F' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'U')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataDetail,
                                                                                r'''$.toko.banner''') ??
                                                                            'https://icon-library.com/images/shop-icon/shop-icon-29.jpg',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'W' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'R')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        // getJsonField(
                                                                        //     dataDetail,
                                                                        //     r'''$.banner''')['400x350'],
                                                                        getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'H'
                                                                            ? getJsonField(dataDetail,
                                                                                r'''$.banner''')['400x350']
                                                                            : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                ? dataDetail['tiket-wisata']['banner']['200x150']
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                    ? dataDetail['transportasi']['banner']['200x150']
                                                                                    : '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'W' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'R')
                                                                          Text(
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                ? getJsonField(dataDetail, r'''$.hotel_title''')
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                    ? dataDetail['tiket-wisata']['title']
                                                                                    : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                        ? dataDetail['transportasi']['title']
                                                                                        : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'F')
                                                                          Text(
                                                                            getJsonField(dataDetail,
                                                                                r'''$.toko.business_name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'U')
                                                                          Text(
                                                                            getJsonField(dataDetail,
                                                                                r'''$.toko.name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                child: Text(
                                                                                  'No Pesanan :',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    dataTransaksiItem,
                                                                                    r'''$.code''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                              child: Text(
                                                                                'Kategori :',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'hotel'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Penginapan',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'food-beverage'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Makanan dan Minuman',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'umkm'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'UMKM',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'tiket-wisata'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Tiket Wisata',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
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
                                        );
                                      },
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: BookingHandlerGroup.transaksiCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                              ],
                                            ),
                                          ));
                                        }
                                        final listViewTransaksiResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final dataTransaksi =
                                                (BookingHandlerGroup
                                                            .transaksiCall
                                                            .dataTransaksi(
                                                              listViewTransaksiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [])
                                                    .where(
                                                        (dataTransaksiItem) =>
                                                            dataTransaksiItem[
                                                                'status'] ==
                                                            'Shipping')
                                                    .toList();
                                            if (dataTransaksi.isEmpty) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  children: [
                                                    Text('Belum ada transaksi'),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Home_Page'),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Mulai Transaksi',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100,
                                                          height: 40,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              primary: false,
                                              shrinkWrap: true,
                                              // physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: dataTransaksi.length,
                                              itemBuilder: (context,
                                                  dataTransaksiIndex) {
                                                final dataTransaksiItem =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                Map<String, dynamic> data =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                dynamic dataDetail =
                                                    json.decode(
                                                        data['data_detail']);

                                                // if (data['code']
                                                //         .toString()
                                                //         .substring(0, 1) ==
                                                //     'U') {}

                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((getJsonField(
                                                              dataTransaksiItem,
                                                              r'''$.status''') !=
                                                          'waiting'))
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CPenginapanpesananditerimaTransaksiWidget(
                                                              detailData:
                                                                  dataTransaksiItem,
                                                            ),
                                                          ),
                                                        );
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((getJsonField(
                                                                        dataTransaksiItem,
                                                                        r'''$.status''') ==
                                                                    'Shipping'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Di Kirim',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                Color(0xFFC08423),
                                                                            fontSize:
                                                                                12,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'F' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'U')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataDetail,
                                                                                r'''$.toko.banner''') ??
                                                                            'https://icon-library.com/images/shop-icon/shop-icon-29.jpg',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'W' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'R')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        // getJsonField(
                                                                        //     dataDetail,
                                                                        //     r'''$.banner''')['400x350'],
                                                                        getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'H'
                                                                            ? getJsonField(dataDetail,
                                                                                r'''$.banner''')['400x350']
                                                                            : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                ? dataDetail['tiket-wisata']['banner']['200x150']
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                    ? dataDetail['transportasi']['banner']['200x150']
                                                                                    : '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'W' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'R')
                                                                          Text(
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                ? getJsonField(dataDetail, r'''$.hotel_title''')
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                    ? dataDetail['tiket-wisata']['title']
                                                                                    : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                        ? getJsonField(dataDetail, r'''$.rent_title''')
                                                                                        : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'F')
                                                                          Text(
                                                                            getJsonField(dataDetail,
                                                                                r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'U')
                                                                          Text(
                                                                            getJsonField(dataDetail, r'''$.toko.name''') ??
                                                                                getJsonField(dataDetail, r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                child: Text(
                                                                                  'No Pesanan :',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    dataTransaksiItem,
                                                                                    r'''$.code''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                              child: Text(
                                                                                'Kategori :',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'hotel'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Penginapan',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'food-beverage'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Makanan dan Minuman',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'umkm'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'UMKM',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'tiket-wisata'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Tiket Wisata',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
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
                                        );
                                      },
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: BookingHandlerGroup
                                          .historyTransaksiCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                              ],
                                            ),
                                          ));
                                        }
                                        final listViewTransaksiResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final dataTransaksiSelesai =
                                                BookingHandlerGroup
                                                        .transaksiCall
                                                        .dataTransaksi(
                                                          listViewTransaksiResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            if (dataTransaksiSelesai.isEmpty) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  children: [
                                                    Text('Belum ada transaksi'),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Home_Page'),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Mulai Transaksi',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100,
                                                          height: 40,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              primary: false,
                                              shrinkWrap: true,
                                              // physics:
                                              //     NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  dataTransaksiSelesai.length,
                                              itemBuilder: (context,
                                                  dataTransaksiSelesaiIndex) {
                                                final dataTransaksiSelesaiItem =
                                                    dataTransaksiSelesai[
                                                        dataTransaksiSelesaiIndex];

                                                Map<String, dynamic> data =
                                                    dataTransaksiSelesai[
                                                        dataTransaksiSelesaiIndex];

                                                dynamic dataDetailSelesai =
                                                    json.decode(
                                                        data['data_detail']);
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CPenginapanpesananditerimaTransaksiWidget(
                                                            detailData:
                                                                dataTransaksiSelesaiItem,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Selesai',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          fontSize:
                                                                              12,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'F' ||
                                                                    getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'U')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataDetailSelesai,
                                                                                r'''$.toko.banner''') ??
                                                                            'https://icon-library.com/images/shop-icon/shop-icon-29.jpg',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                    getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'W' ||
                                                                    getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'R')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) ==
                                                                                'H'
                                                                            ? getJsonField(dataDetailSelesai,
                                                                                r'''$.banner''')['400x350']
                                                                            : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                ? dataDetailSelesai['tiket-wisata']['banner']['200x150']
                                                                                : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                    ? dataDetailSelesai['transportasi']['banner']['200x150']
                                                                                    : '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                            getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) ==
                                                                                'W' ||
                                                                            getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) ==
                                                                                'R')
                                                                          Text(
                                                                            getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                ? getJsonField(dataDetailSelesai, r'''$.hotel_title''')
                                                                                : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                    ? dataDetailSelesai['tiket-wisata']['title']
                                                                                    : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                        ? dataDetailSelesai['transportasi']['title']
                                                                                        : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) ==
                                                                                'F' ||
                                                                            getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) ==
                                                                                'U')
                                                                          Text(
                                                                            getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'F'
                                                                                ? getJsonField(dataDetailSelesai, r'''$.items[0].name''')
                                                                                : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'U'
                                                                                    ? getJsonField(dataDetailSelesai, r'''$.toko.name''') ?? getJsonField(dataDetailSelesai, r'''$.items[0].name''')
                                                                                    : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                child: Text(
                                                                                  'No Pesanan :',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    dataTransaksiSelesaiItem,
                                                                                    r'''$.code''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                              child: Text(
                                                                                'Kategori :',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                              child: Text(
                                                                                getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                    ? 'Penginapan'
                                                                                    : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                        ? 'Tiket Wisata'
                                                                                        : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                            ? 'Sewa Kendaraan'
                                                                                            : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'F'
                                                                                                ? 'Makanan dan Minuman'
                                                                                                : getJsonField(dataTransaksiSelesaiItem, r'''$.code''').substring(0, 1) == 'U'
                                                                                                    ? 'UMKM'
                                                                                                    : '',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 12,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
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
                                        );
                                      },
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: BookingHandlerGroup.transaksiCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                              ],
                                            ),
                                          ));
                                        }
                                        final listViewTransaksiResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final dataTransaksi =
                                                (BookingHandlerGroup
                                                            .transaksiCall
                                                            .dataTransaksi(
                                                              listViewTransaksiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [])
                                                    .where(
                                                        (dataTransaksiItem) =>
                                                            dataTransaksiItem[
                                                                'status'] ==
                                                            'minta_batal')
                                                    .toList();
                                            if (dataTransaksi.isEmpty) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  children: [
                                                    Text('Belum ada transaksi'),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Home_Page'),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Mulai Transaksi',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100,
                                                          height: 40,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              primary: false,
                                              shrinkWrap: true,
                                              // physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: dataTransaksi.length,
                                              itemBuilder: (context,
                                                  dataTransaksiIndex) {
                                                final dataTransaksiItem =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                Map<String, dynamic> data =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                dynamic dataDetail =
                                                    json.decode(
                                                        data['data_detail']);

                                                // if (data['code']
                                                //         .toString()
                                                //         .substring(0, 1) ==
                                                //     'U') {}

                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((getJsonField(
                                                              dataTransaksiItem,
                                                              r'''$.status''') !=
                                                          'waiting'))
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CPenginapanpesananditerimaTransaksiWidget(
                                                              detailData:
                                                                  dataTransaksiItem,
                                                            ),
                                                          ),
                                                        );
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((getJsonField(
                                                                        dataTransaksiItem,
                                                                        r'''$.status''') ==
                                                                    'minta_batal'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Permintaan Pembatalan',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                Color(0xFFC08423),
                                                                            fontSize:
                                                                                12,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'F' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'U')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataDetail,
                                                                                r'''$.toko.banner''') ??
                                                                            'https://icon-library.com/images/shop-icon/shop-icon-29.jpg',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'W' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'R')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        // getJsonField(
                                                                        //     dataDetail,
                                                                        //     r'''$.banner''')['400x350'],
                                                                        getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'H'
                                                                            ? getJsonField(dataDetail,
                                                                                r'''$.banner''')['400x350']
                                                                            : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                ? dataDetail['tiket-wisata']['banner']['200x150']
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                    ? dataDetail['transportasi']['banner']['200x150']
                                                                                    : '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'W' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'R')
                                                                          Text(
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                ? getJsonField(dataDetail, r'''$.hotel_title''')
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                    ? dataDetail['tiket-wisata']['title']
                                                                                    : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                        ? getJsonField(dataDetail, r'''$.rent_title''')
                                                                                        : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'F')
                                                                          Text(
                                                                            getJsonField(dataDetail,
                                                                                r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'U')
                                                                          Text(
                                                                            getJsonField(dataDetail, r'''$.toko.name''') ??
                                                                                getJsonField(dataDetail, r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                child: Text(
                                                                                  'No Pesanan :',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    dataTransaksiItem,
                                                                                    r'''$.code''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                              child: Text(
                                                                                'Kategori :',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'hotel'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Penginapan',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'food-beverage'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Makanan dan Minuman',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'umkm'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'UMKM',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'tiket-wisata'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Tiket Wisata',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
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
                                        );
                                      },
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: BookingHandlerGroup
                                          .historyTransaksiCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                loadingCard(),
                                              ],
                                            ),
                                          ));
                                        }
                                        final listViewTransaksiResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final dataTransaksi =
                                                (BookingHandlerGroup
                                                            .transaksiCall
                                                            .dataTransaksi(
                                                              listViewTransaksiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [])
                                                    .where(
                                                        (dataTransaksiItem) =>
                                                            dataTransaksiItem[
                                                                'status'] ==
                                                            'Dibatalkan')
                                                    .toList();
                                            if (dataTransaksi.isEmpty) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Column(
                                                  children: [
                                                    Text('Belum ada transaksi'),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NavBarPage(
                                                                      initialPage:
                                                                          'Home_Page'),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Mulai Transaksi',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100,
                                                          height: 40,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            // final dataTransaksi = canceled;

                                            // print(dataTransaksi);
                                            return ListView.builder(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              primary: false,
                                              shrinkWrap: true,
                                              // physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: dataTransaksi.length,
                                              itemBuilder: (context,
                                                  dataTransaksiIndex) {
                                                final dataTransaksiItem =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                Map<String, dynamic> data =
                                                    dataTransaksi[
                                                        dataTransaksiIndex];

                                                dynamic dataDetail =
                                                    json.decode(
                                                        data['data_detail']);

                                                // if (data['code']
                                                //         .toString()
                                                //         .substring(0, 1) ==
                                                //     'U') {}

                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 5),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if ((getJsonField(
                                                              dataTransaksiItem,
                                                              r'''$.status''') !=
                                                          'waiting'))
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CPenginapanpesananditerimaTransaksiWidget(
                                                              detailData:
                                                                  dataTransaksiItem,
                                                            ),
                                                          ),
                                                        );
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 750,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if ((getJsonField(
                                                                        dataTransaksiItem,
                                                                        r'''$.status''') ==
                                                                    'Dibatalkan'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Di Batalkan',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                231,
                                                                                45,
                                                                                45),
                                                                            fontSize:
                                                                                12,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'F' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'U')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        getJsonField(dataDetail,
                                                                                r'''$.toko.banner''') ??
                                                                            'https://icon-library.com/images/shop-icon/shop-icon-29.jpg',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'W' ||
                                                                    getJsonField(dataTransaksiItem, r'''$.code''').substring(
                                                                            0,
                                                                            1) ==
                                                                        'R')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      child: Image
                                                                          .network(
                                                                        // getJsonField(
                                                                        //     dataDetail,
                                                                        //     r'''$.banner''')['400x350'],
                                                                        getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'H'
                                                                            ? getJsonField(dataDetail,
                                                                                r'''$.banner''')['400x350']
                                                                            : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                ? dataDetail['tiket-wisata']['banner']['200x150']
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                    ? dataDetail['transportasi']['banner']['200x150']
                                                                                    : '',
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'W' ||
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) ==
                                                                                'R')
                                                                          Text(
                                                                            getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'H'
                                                                                ? getJsonField(dataDetail, r'''$.hotel_title''')
                                                                                : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'W'
                                                                                    ? dataDetail['tiket-wisata']['title']
                                                                                    : getJsonField(dataTransaksiItem, r'''$.code''').substring(0, 1) == 'R'
                                                                                        ? dataDetail['transportasi']['title']
                                                                                        : '',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'F')
                                                                          Text(
                                                                            getJsonField(dataDetail,
                                                                                r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(dataTransaksiItem, r'''$.code''').substring(0,
                                                                                1) ==
                                                                            'U')
                                                                          Text(
                                                                            getJsonField(dataDetail, r'''$.toko.name''') ??
                                                                                getJsonField(dataDetail, r'''$.items[0].name'''),
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                  fontSize: 14,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                                ),
                                                                          ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                child: Text(
                                                                                  'No Pesanan :',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    dataTransaksiItem,
                                                                                    r'''$.code''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                              child: Text(
                                                                                'Kategori :',
                                                                                style: FlutterFlowTheme.of(context).labelMedium,
                                                                              ),
                                                                            ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'hotel'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                child: Text(
                                                                                  'Penginapan',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'food-beverage'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Makanan dan Minuman',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'umkm'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'UMKM',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            if ((getJsonField(dataTransaksiItem, r'''$.object_model''') ==
                                                                                'tiket-wisata'))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  // getJsonField(
                                                                                  //     dataTransaksiItem,
                                                                                  //     r'''$.object_model'''),
                                                                                  'Tiket Wisata',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
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
                                        );
                                      },
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'Home_Page'),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  'Transaksi',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: badges.Badge(
                                    badgeContent: Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Colors.white,
                                            fontSize: 7,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    showBadge: true,
                                    child: Icon(
                                      Icons.notifications_none,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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

Widget loadingCard() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 14,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 14,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 20,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 20,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 20,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Divider(
          thickness: 5,
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 20,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
