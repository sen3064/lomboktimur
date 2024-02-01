import 'dart:async';
import 'dart:convert';

import 'package:kolaka/core/constants/constant.dart';
import 'package:kolaka/transportasi/detail_transpotasi_mobil/detail_transpotasi_mobil_widget.dart';

import '../../backend/api_requests/api_calls.dart';
import '../../backend/api_requests/api_manager.dart';
import '/components/wishlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/transportasi/detail_transpotasi_motor/detail_transpotasi_motor_widget.dart';
import '/transportasi/pesan_kendaraan_motor/pesan_kendaraan_motor_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_kendaraan_motor_model.dart';
export 'list_kendaraan_motor_model.dart';

class ListKendaraanMotorWidget extends StatefulWidget {
  const ListKendaraanMotorWidget({
    Key? key,
    this.typeVec,
  }) : super(key: key);

  final String? typeVec;

  @override
  _ListKendaraanMotorWidgetState createState() =>
      _ListKendaraanMotorWidgetState();
}

class _ListKendaraanMotorWidgetState extends State<ListKendaraanMotorWidget> {
  late ListKendaraanMotorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListKendaraanMotorModel());
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
          setState(() => _model.apiRequestCompleter = null);
          await _model.waitForApiRequestCompleted();
        },
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
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
              ),title: Text(
              "Sewa Kendaraan",
              style: bold16.copyWith(color: dark1),
            ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: // Generated code for this Column Widget...
                SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.typeVec == 'motor')
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'List Kendaraan Tersedia',
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (widget.typeVec == 'mobil')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
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
                              ),
                              subtitle: Text(
                                'Dengan Supir',
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
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(RentGroup.rentListCall.call()))
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
                            final rowRentListResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final rentList = (RentGroup.rentListCall
                                            .dataRent(
                                              rowRentListResponse.jsonBody,
                                            )
                                            ?.toList() ??
                                        [])
                                    .where((rentListItem) =>
                                        rentListItem['vehicle_type'] ==
                                        widget.typeVec)
                                    .toList();
                                return RefreshIndicator(
                                  onRefresh: () async {
                                    setState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: rentList.length,
                                    itemBuilder: (context, rentListIndex) {
                                      final rentListItem =
                                          rentList[rentListIndex];
                                      var prices =
                                          json.decode(rentListItem['prices']);
                                      var selectedPriceKey =
                                          _model.switchListTileValue == true
                                              ? 'driver'
                                              : 'nodriver';
                                      var selectedPrice =
                                          prices[selectedPriceKey];
                                      var displayPrice = selectedPrice != null
                                          ? NumberFormat.currency(
                                                      locale: 'id',
                                                      symbol: 'Rp ',
                                                      decimalDigits: 0)
                                                  .format(int.parse(
                                                      selectedPrice)) +
                                              '/hari'
                                          : 'Tidak tersedia';
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: Container(
                                          width: double.infinity,
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
                                            borderRadius:
                                                BorderRadius.circular(21),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
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
                                                                .circular(21),
                                                        child: Image.network(
                                                          getJsonField(
                                                                  rentListItem,
                                                                  r'''$.banner''')[
                                                              '400x350'],
                                                          width:
                                                              double.infinity,
                                                          height: 250,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  getJsonField(
                                                                      rentListItem,
                                                                      r'''$.title'''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .star_purple500_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 20,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '0',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            if (getJsonField(
                                                                    rentListItem,
                                                                    r'''$.review_score''') !=
                                                                null)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  getJsonField(
                                                                          rentListItem,
                                                                          r'''$.review_score''')
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            SizedBox(
                                                              height: 20,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 1,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${getJsonField(rentListItem, r'''$.passenger''').toString()} Kursi',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    10, 10),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      FFIcons
                                                                          .ksteamMachineIconIconsCom68346,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      size: 15,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        '${getJsonField(rentListItem, r'''$.gear''').toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                    FFIcons
                                                                        .ksuitcaseRolling,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    size: 15,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      '${getJsonField(rentListItem, r'''$.baggage''')} Kg',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            // Row(
                                                            //   mainAxisSize:
                                                            //       MainAxisSize
                                                            //           .max,
                                                            //   mainAxisAlignment:
                                                            //       MainAxisAlignment
                                                            //           .start,
                                                            //   children: [
                                                            //     Icon(
                                                            //       FFIcons.kfuel,
                                                            //       color: FlutterFlowTheme.of(
                                                            //               context)
                                                            //           .accent1,
                                                            //       size: 15,
                                                            //     ),
                                                            //     Padding(
                                                            //       padding:
                                                            //           EdgeInsetsDirectional
                                                            //               .fromSTEB(
                                                            //                   5,
                                                            //                   0,
                                                            //                   0,
                                                            //                   0),
                                                            //       child: Text(
                                                            //         'Bensin',
                                                            //         style: FlutterFlowTheme.of(
                                                            //                 context)
                                                            //             .bodySmall,
                                                            //       ),
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 10),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: RichText(
                                                                  textScaleFactor:
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .textScaleFactor,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            displayPrice,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
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
                                              ),
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.00, -1.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 10, 0),
                                                      child: Container(
                                                        width: 30,
                                                        height: 55,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: WishlistWidget(
                                                          key: Key(
                                                              'Keyn8s_${rentListIndex}_of_${rentList.length}'),
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
                                    },
                                  ),
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
            )),
      ),
    );
  }
}
