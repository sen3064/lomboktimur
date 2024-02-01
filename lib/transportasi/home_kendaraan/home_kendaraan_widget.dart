import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:kolaka/theme.dart';
import 'package:kolaka/transportasi/cari_kendaraan_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../search_filter/cari_kendaraan.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/pilih_lokasi_widget.dart';
import '/components/tombol_lihat_semua_widget.dart';
import '/components/wishlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/transportasi/detail_transpotasi_mobil/detail_transpotasi_mobil_widget.dart';

import '/transportasi/list_kendaraan_mobil/list_kendaraan_mobil_widget.dart';
import '/transportasi/list_kendaraan_motor/list_kendaraan_motor_widget.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_kendaraan_model.dart';
export 'home_kendaraan_model.dart';

class HomeKendaraanWidget extends StatefulWidget {
  const HomeKendaraanWidget({
    Key? key,
    this.dataPage,
  }) : super(key: key);
  final String? dataPage;
  @override
  _HomeKendaraanWidgetState createState() => _HomeKendaraanWidgetState();
}

class _HomeKendaraanWidgetState extends State<HomeKendaraanWidget> {
  late HomeKendaraanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeKendaraanModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _updatePrices() async {
    if (_model.switchListTileValue == true) {
      // Harga yang ditampilkan saat SwitchListTile aktif (true)
      // ...
    } else {
      // Harga yang ditampilkan saat SwitchListTile nonaktif (false)
      // ...
    }
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
          appBar: // Generated code for this AppBar Widget...
              AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 54,
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).primary,
                size: 24,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Sewa Kendaraan",
              style: bold16.copyWith(color: dark1),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xB5EEEEEE),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: // Generated code for this Row Widget...
                                        Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          Get.to(() => CariKendaraanWidget());
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20,
                                              borderWidth: 1,
                                              buttonSize: 30,
                                              icon: Icon(
                                                Icons.search,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 14,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  'Cari mobil favorit Anda',
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       10, 0, 0, 0),
                                //   child: Icon(
                                //     FFIcons.kdocumentFilterCopy,
                                //     color: FlutterFlowTheme.of(context).accent1,
                                //     size: 24,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Container(
                      width: double.infinity,
                      height: 174,
                      decoration: BoxDecoration(
                        color: Color(0xFFE6F9F2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1, 1),
                            child: Container(
                              width: 180,
                              height: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/audi-png-45317.png',
                                  ).image,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 150, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Jadikan Perjalanan Anda Mudah & Terjangkau',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SwitchListTile(
                              value: _model.switchListTileValue ?? false,
                              // onChanged: (newValue) async {
                              //   setState(() =>
                              //       _model.switchListTileValue = newValue!);
                              // },
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue = newValue);
                                await _updatePrices();
                              },
                              title: Text(
                                'Tersedia Untuk Anda',
                                style: bold16.copyWith(color: dark1),
                              ),
                              subtitle: Text(
                                'Dengan Supir',
                                style: regular16.copyWith(color: dark1),
                              ),
                              activeColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: _model.rentListing(
                                  requestFn: () => (_model
                                              .apiRequestCompleter ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(
                                                RentGroup.rentListCall.call()))
                                      .future,
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
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  final rowRentListResponse = snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final rentList = (RentGroup.rentListCall
                                                  .dataRent(
                                                    rowRentListResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [])
                                          .where((rentListItem) =>
                                              rentListItem['vehicle_type'] ==
                                              'mobil')
                                          .toList();
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              rentList.length, (rentListIndex) {
                                            final rentListItem =
                                                rentList[rentListIndex];
                                            var prices = json
                                                .decode(rentListItem['prices']);
                                            var selectedPriceKey =
                                                _model.switchListTileValue ==
                                                        true
                                                    ? 'driver'
                                                    : 'nodriver';
                                            var selectedPrice =
                                                prices[selectedPriceKey];
                                            var displayPrice = selectedPrice !=
                                                    null
                                                ? NumberFormat.currency(
                                                            locale: 'id',
                                                            symbol: 'Rp ',
                                                            decimalDigits: 0)
                                                        .format(int.parse(
                                                            selectedPrice)) +
                                                    '/hari'
                                                : 'Driver tidak tersedia';
                                            Text(
                                              displayPrice,
                                              style: semibold14.copyWith(
                                                  color: red1),
                                            );

                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailTranspotasiMobilWidget(
                                                        rentData: rentListItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 180,
                                                  // height: 320,
                                                  decoration: BoxDecoration(
                                                    // color: Color(0xF6F7F7F7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DetailTranspotasiMobilWidget(
                                                                rentData:
                                                                    rentListItem,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          21),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                        rentListItem,
                                                                        r'''$.banner''')[
                                                                    '400x350'],
                                                                width: 300,
                                                                height: 180,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          0),
                                                              child: Text(
                                                                getJsonField(
                                                                    rentListItem,
                                                                    r'''$.title'''),
                                                                style: semibold12_5
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          10),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .star_purple500_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                    size: 10,
                                                                  ),
                                                                  if (getJsonField(
                                                                              rentListItem,
                                                                              r'''$.review_score''') ==
                                                                          null ||
                                                                      getJsonField(
                                                                              rentListItem,
                                                                              r'''$.review_score''') ==
                                                                          0)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        '0',
                                                                        style: regular10.copyWith(
                                                                            color:
                                                                                dark2),
                                                                      ),
                                                                    ),
                                                                  if (getJsonField(
                                                                          rentListItem,
                                                                          r'''$.review_score''') !=
                                                                      null)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(rentListItem,
                                                                                r'''$.review_score''')
                                                                            .toString(),
                                                                        style: regular10.copyWith(
                                                                            color:
                                                                                dark2),
                                                                      ),
                                                                    ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                    child:
                                                                        VerticalDivider(
                                                                      thickness:
                                                                          1,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${getJsonField(rentListItem, r'''$.passenger''').toString()} Kursi',
                                                                    style: regular10
                                                                        .copyWith(
                                                                            color:
                                                                                dark2),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                            //                 Padding(
                                            //   padding: EdgeInsetsDirectional
                                            //       .fromSTEB(
                                            //           5.0, 5.0, 0.0, 0.0),
                                            //   child: Row(
                                            //     mainAxisSize:
                                            //         MainAxisSize.max,
                                            //     children: [
                                            //       Padding(
                                            //         padding:
                                            //             EdgeInsetsDirectional
                                            //                 .fromSTEB(
                                            //                     0.0,
                                            //                     0.0,
                                            //                     5.0,
                                            //                     0.0),
                                            //         child: Icon(
                                            //           Icons.location_on,
                                            //           color: const Color
                                            //                       .fromARGB(
                                            //                       255,
                                            //                       65,
                                            //                       64,
                                            //                       64),
                                            //           size: 10.0,
                                            //         ),
                                            //       ),
                                            //       Expanded(
                                            //         child: Text(
                                            //           '${(getJsonField(rentListItem, r'''$.seller.address''') ?? '').substring(0, 12)}...',
                                            //           style: TextStyle(
                                            //             color: const Color
                                            //                       .fromARGB(
                                            //                       255,
                                            //                       65,
                                            //                       64,
                                            //                       64),
                                            //             fontWeight:
                                            //                 FontWeight.w400,
                                            //             fontSize: 10.0,
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          10),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                displayPrice,
                                                                            style:
                                                                                semibold14.copyWith(color: red1),
                                                                          ),
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, -1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          0),
                                                              child: Container(
                                                                width: 30,
                                                                height: 55,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    WishlistWidget(
                                                                  key: Key(
                                                                      'Key49m_${rentListIndex}_of_${rentList.length}'),
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
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ListKendaraanMobilWidget(),
                                  ),
                                );
                              },
                              child: wrapWithModel(
                                model: _model.tombolLihatSemuaModel,
                                updateCallback: () => setState(() {}),
                                child: TombolLihatSemuaWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Mudah & Terjangkau',
                                style: bold16.copyWith(color: dark1),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ListKendaraanMotorWidget(
                                      typeVec: 'motor',
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Lihat Semua',
                                style: regular16.copyWith(color: red1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: _model.rentListing(
                                  requestFn: () =>
                                      RentGroup.rentListCall.call(),
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
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  final rowRentListResponse = snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final rentList2 = (RentGroup.rentListCall
                                                  .dataRent(
                                                    rowRentListResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [])
                                          .where((rentListItem) =>
                                              rentListItem['vehicle_type'] ==
                                              'motor')
                                          .toList();
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children:
                                              List.generate(rentList2.length,
                                                  (rentList2Index) {
                                            final rentList2Item =
                                                rentList2[rentList2Index];
                                            var prices = json.decode(
                                                rentList2Item['prices']);
                                            var selectedPriceKey =
                                                _model.switchListTileValue ==
                                                        true
                                                    ? 'driver'
                                                    : 'nodriver';
                                            var selectedPrice =
                                                prices[selectedPriceKey];
                                            var displayPrice = selectedPrice !=
                                                    null
                                                ? NumberFormat.currency(
                                                            locale: 'id',
                                                            symbol: 'Rp ',
                                                            decimalDigits: 0)
                                                        .format(int.parse(
                                                            selectedPrice)) +
                                                    '/hari'
                                                : 'Driver tidak tersedia';

                                            Text(
                                              displayPrice,
                                              style: semibold14.copyWith(
                                                  color: red1),
                                            );

                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 10, 0),
                                              child: Container(
                                                width: 160,
                                                // height: 320,
                                                decoration: BoxDecoration(
                                                  color: Color(0xF6F7F7F7),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailTranspotasiMobilWidget(
                                                              rentData:
                                                                  rentList2Item,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        21),
                                                            child:
                                                                Image.network(
                                                              getJsonField(
                                                                      rentList2Item,
                                                                      r'''$.banner''')[
                                                                  '400x350'],
                                                              width: 300,
                                                              height: 180,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Text(
                                                              getJsonField(
                                                                  rentList2Item,
                                                                  r'''$.title'''),
                                                              style: semibold12_5
                                                                  .copyWith(
                                                                      color:
                                                                          dark2),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        10,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .star_purple500_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                                  size: 10,
                                                                ),
                                                                if (getJsonField(
                                                                            rentList2Item,
                                                                            r'''$.review_score''') ==
                                                                        null ||
                                                                    getJsonField(
                                                                            rentList2Item,
                                                                            r'''$.review_score''') ==
                                                                        0)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      '0',
                                                                      style: regular10.copyWith(
                                                                          color:
                                                                              dark2),
                                                                    ),
                                                                  ),
                                                                if (getJsonField(
                                                                        rentList2Item,
                                                                        r'''$.review_score''') !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                              rentList2Item,
                                                                              r'''$.review_score''')
                                                                          .toString(),
                                                                      style: regular10.copyWith(
                                                                          color:
                                                                              dark2),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        10,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              displayPrice,
                                                                          style:
                                                                              semibold14.copyWith(color: red1),
                                                                        ),
                                                                      ],
                                                                      style: bold16.copyWith(
                                                                          color:
                                                                              red1),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, -1),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Container(
                                                              width: 30,
                                                              height: 55,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  WishlistWidget(
                                                                key: Key(
                                                                    'Keynzc_${rentList2Index}_of_${rentList2.length}'),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
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
    child: Container(
      height: 200,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
