import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:kelotimaja/makanan/cari_makanan_widget.dart';
import 'package:kelotimaja/theme.dart';

import '/alamat/pilih_alamat_antar_makanan/pilih_alamat_antar_makanan_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import '/makanan/detail_resto/detail_resto_widget.dart';
import '/makanan/list_menu_popular/list_menu_popular_widget.dart';
import '/makanan/list_pesanan_makanan/list_pesanan_makanan_widget.dart';
import '/makanan/list_rekomendasi/list_rekomendasi_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_makanan_model.dart';
export 'home_makanan_model.dart';

class HomeMakananWidget extends StatefulWidget {
  const HomeMakananWidget({Key? key, this.dataPage}) : super(key: key);
  final String? dataPage;

  @override
  _HomeMakananWidgetState createState() => _HomeMakananWidgetState();
}

class _HomeMakananWidgetState extends State<HomeMakananWidget> {
  late HomeMakananModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeMakananModel());
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
          appBar: AppBar(
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
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'Home_Page'),
                  ),
                );
              },
            ),
            title: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Lokasi Kamu',
                        style: regular12_5.copyWith(color: dark2),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: red1,
                        size: 24,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PilihAlamatAntarMakananWidget(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 25,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (FFAppState().address == null ||
                                  FFAppState().address == '')
                                Text(
                                  'Pilih lokasi anda',
                                  textAlign: TextAlign.start,
                                  style: regular12_5.copyWith(color: dark2),
                                ),
                              if (FFAppState().address != null &&
                                  FFAppState().address != '')
                                Expanded(
                                  child: SelectionArea(
                                      child: Text(
                                    FFAppState().address.maybeHandleOverflow(
                                          maxChars: 30,
                                          replacement: '…',
                                        ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  )),
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
            // actions: [
            //   Padding(
            //     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
            //     child: InkWell(
            //       splashColor: Colors.transparent,
            //       focusColor: Colors.transparent,
            //       hoverColor: Colors.transparent,
            //       highlightColor: Colors.transparent,
            //       onTap: () async {
            //         await Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => ListPesananMakananWidget(),
            //           ),
            //         );
            //       },
            //       child: badges.Badge(
            //         badgeContent: Text(
            //           FFAppState().addMakananToJson.length.toString(),
            //           style: FlutterFlowTheme.of(context).titleSmall.override(
            //                 fontFamily:
            //                     FlutterFlowTheme.of(context).titleSmallFamily,
            //                 color: Colors.white,
            //                 useGoogleFonts: GoogleFonts.asMap().containsKey(
            //                     FlutterFlowTheme.of(context).titleSmallFamily),
            //               ),
            //         ),
            //         showBadge: true,
            //         child: Icon(
            //           Icons.local_grocery_store_outlined,
            //           color: FlutterFlowTheme.of(context).primary,
            //           size: 30,
            //         ),
            //       ),
            //     ),
            //   ),
            // ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
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
                    child: InkWell(
                      onTap: () async {
                        Get.to(() => CariMakananWidget());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Mau belanja apa hari ini?',
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20,
                                    borderWidth: 1,
                                    buttonSize: 30,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    icon: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 14,
                                    ),
                                    onPressed: () {
                                      Get.to(() => CariMakananWidget());
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
              ),
            ),
            centerTitle: false,
            elevation: 0,
          ),
          body: FutureBuilder<ApiCallResponse>(
            future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(MakananMinumanGroup.getMakananCall.call()))
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
              final columnGetMakananResponse = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() => _model.apiRequestCompleter = null);
                  await _model.waitForApiRequestCompleted();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 249, 230, 230),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1, 1),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/imgbin_greek-salad-recipe-vegetarian-cuisine-everyday-super-food-png.png',
                                      ).image,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 30, 70, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Let's you find good Quality Food",
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      //   child: SingleChildScrollView(
                      //     child: Column(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: [
                      //         Padding(
                      //           padding: EdgeInsetsDirectional.fromSTEB(1, 10, 0, 10),
                      //           child: Row(
                      //             mainAxisSize: MainAxisSize.max,
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 'Menu popular',
                      //                 style: FlutterFlowTheme.of(context)
                      //                     .titleMedium
                      //                     .override(
                      //                       fontFamily: FlutterFlowTheme.of(context)
                      //                           .titleMediumFamily,
                      //                       fontWeight: FontWeight.w600,
                      //                       useGoogleFonts: GoogleFonts.asMap()
                      //                           .containsKey(
                      //                               FlutterFlowTheme.of(context)
                      //                                   .titleMediumFamily),
                      //                     ),
                      //               ),
                      //               InkWell(
                      //                 splashColor: Colors.transparent,
                      //                 focusColor: Colors.transparent,
                      //                 hoverColor: Colors.transparent,
                      //                 highlightColor: Colors.transparent,
                      //                 onTap: () async {
                      //                   await Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           ListMenuPopularWidget(),
                      //                     ),
                      //                   );
                      //                 },
                      //                 child: Text(
                      //                   'Lihat Semua',
                      //                   style: FlutterFlowTheme.of(context)
                      //                       .bodyMedium
                      //                       .override(
                      //                         fontFamily: FlutterFlowTheme.of(context)
                      //                             .bodyMediumFamily,
                      //                         color: FlutterFlowTheme.of(context)
                      //                             .accent1,
                      //                         fontWeight: FontWeight.w500,
                      //                         useGoogleFonts: GoogleFonts.asMap()
                      //                             .containsKey(
                      //                                 FlutterFlowTheme.of(context)
                      //                                     .bodyMediumFamily),
                      //                       ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         Align(
                      //           alignment: AlignmentDirectional(-1, 0),
                      //           child: FutureBuilder<ApiCallResponse>(
                      //             future: FFAppState().listMakanan(
                      //               requestFn: () =>
                      //                   MakananMinumanGroup.listMakananCall.call(),
                      //             ),
                      //             builder: (context, snapshot) {
                      //               // Customize what your widget looks like when it's loading.
                      //               if (!snapshot.hasData) {
                      //                 return Center(
                      //                   child: SizedBox(
                      //                     width: 50,
                      //                     height: 50,
                      //                     child: CircularProgressIndicator(
                      //                       color: FlutterFlowTheme.of(context)
                      //                           .tertiary400,
                      //                     ),
                      //                   ),
                      //                 );
                      //               }
                      //               final rowGetMakananResponse = snapshot.data!;
                      //               return Builder(
                      //                 builder: (context) {
                      //                   final dataMakanan = rowGetMakananResponse
                      //                       .jsonBody
                      //                       .toList()
                      //                       .take(3)
                      //                       .toList();
                      //                   final random = Random();
                      //                   dataMakanan.shuffle(random);
                      //                   return SingleChildScrollView(
                      //                     scrollDirection: Axis.horizontal,
                      //                     child: Row(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       children:
                      //                           List.generate(dataMakanan.length,
                      //                               (dataMakananIndex) {
                      //                         final dataMakananItem =
                      //                             dataMakanan[dataMakananIndex];
                      //                         return Padding(
                      //                           padding:
                      //                               EdgeInsetsDirectional.fromSTEB(
                      //                                   0, 0, 20, 0),
                      //                           child: InkWell(
                      //                             splashColor: Colors.transparent,
                      //                             focusColor: Colors.transparent,
                      //                             hoverColor: Colors.transparent,
                      //                             highlightColor: Colors.transparent,
                      //                             onTap: () async {
                      //                               setState(() {
                      //                                 FFAppState().createUser =
                      //                                     getJsonField(
                      //                                   dataMakananItem,
                      //                                   r'''$.create_user''',
                      //                                 );
                      //                               });
                      //                               await Navigator.push(
                      //                                 context,
                      //                                 MaterialPageRoute(
                      //                                   builder: (context) =>
                      //                                       DetailRestoWidget(
                      //                                     createUser: getJsonField(
                      //                                       dataMakananItem,
                      //                                       r'''$.create_user''',
                      //                                     ),
                      //                                     dataToko: dataMakananItem,
                      //                                   ),
                      //                                 ),
                      //                               );
                      //                             },
                      //                             child: Container(
                      //                               width: 220,
                      //                               height: 270,
                      //                               decoration: BoxDecoration(
                      //                                 color:
                      //                                     FlutterFlowTheme.of(context)
                      //                                         .secondaryBackground,
                      //                                 image: DecorationImage(
                      //                                   fit: BoxFit.cover,
                      //                                   image: Image.network(
                      //                                     getJsonField(
                      //                                       dataMakananItem,
                      //                                       r'''$.banner''',
                      //                                     )['400x350'],
                      //                                   ).image,
                      //                                 ),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(8),
                      //                               ),
                      //                               child: Stack(
                      //                                 children: [
                      //                                   Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             0, 1),
                      //                                     child: Padding(
                      //                                       padding:
                      //                                           EdgeInsetsDirectional
                      //                                               .fromSTEB(
                      //                                                   0, 0, 0, 20),
                      //                                       child: Container(
                      //                                         width: 200,
                      //                                         height: 80,
                      //                                         decoration:
                      //                                             BoxDecoration(
                      //                                           color:
                      //                                               Color(0xBFFFFFFF),
                      //                                           borderRadius:
                      //                                               BorderRadius
                      //                                                   .circular(8),
                      //                                         ),
                      //                                         child: Padding(
                      //                                           padding:
                      //                                               EdgeInsetsDirectional
                      //                                                   .fromSTEB(
                      //                                                       10,
                      //                                                       10,
                      //                                                       10,
                      //                                                       10),
                      //                                           child: Column(
                      //                                             mainAxisSize:
                      //                                                 MainAxisSize
                      //                                                     .min,
                      //                                             mainAxisAlignment:
                      //                                                 MainAxisAlignment
                      //                                                     .start,
                      //                                             crossAxisAlignment:
                      //                                                 CrossAxisAlignment
                      //                                                     .start,
                      //                                             children: [
                      //                                               Expanded(
                      //                                                 child: Text(
                      //                                                   getJsonField(
                      //                                                     dataMakananItem,
                      //                                                     r'''$.name''',
                      //                                                   ).toString(),
                      //                                                   style: FlutterFlowTheme.of(
                      //                                                           context)
                      //                                                       .bodyLarge
                      //                                                       .override(
                      //                                                         fontFamily:
                      //                                                             FlutterFlowTheme.of(context).bodyLargeFamily,
                      //                                                         fontWeight:
                      //                                                             FontWeight.w600,
                      //                                                         useGoogleFonts:
                      //                                                             GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                      //                                                       ),
                      //                                                 ),
                      //                                               ),
                      //                                               Row(
                      //                                                 mainAxisSize:
                      //                                                     MainAxisSize
                      //                                                         .max,
                      //                                                 mainAxisAlignment:
                      //                                                     MainAxisAlignment
                      //                                                         .spaceBetween,
                      //                                                 children: [
                      //                                                   if (getJsonField(
                      //                                                         dataMakananItem,
                      //                                                         r'''$.discount''',
                      //                                                       ) ==
                      //                                                       FFAppState()
                      //                                                           .zeroValueString)
                      //                                                     Text(
                      //                                                       formatNumber(
                      //                                                         double.parse(
                      //                                                             getJsonField(
                      //                                                           dataMakananItem,
                      //                                                           r'''$.price''',
                      //                                                         ).toString()),
                      //                                                         formatType:
                      //                                                             FormatType.decimal,
                      //                                                         decimalType:
                      //                                                             DecimalType.commaDecimal,
                      //                                                         currency:
                      //                                                             'Rp ',
                      //                                                       ),
                      //                                                       style: FlutterFlowTheme.of(
                      //                                                               context)
                      //                                                           .bodyLarge
                      //                                                           .override(
                      //                                                             fontFamily:
                      //                                                                 FlutterFlowTheme.of(context).bodyLargeFamily,
                      //                                                             fontWeight:
                      //                                                                 FontWeight.w600,
                      //                                                             useGoogleFonts:
                      //                                                                 GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                      //                                                           ),
                      //                                                     ),
                      //                                                   if (getJsonField(
                      //                                                         dataMakananItem,
                      //                                                         r'''$.discount''',
                      //                                                       ) !=
                      //                                                       FFAppState()
                      //                                                           .zeroValueString)
                      //                                                     Text(
                      //                                                       formatNumber(
                      //                                                         double.parse(
                      //                                                             getJsonField(
                      //                                                           dataMakananItem,
                      //                                                           r'''$.discount''',
                      //                                                         ).toString()),
                      //                                                         formatType:
                      //                                                             FormatType.decimal,
                      //                                                         decimalType:
                      //                                                             DecimalType.commaDecimal,
                      //                                                         currency:
                      //                                                             'Rp ',
                      //                                                       ),
                      //                                                       style: FlutterFlowTheme.of(
                      //                                                               context)
                      //                                                           .bodyLarge
                      //                                                           .override(
                      //                                                             fontFamily:
                      //                                                                 FlutterFlowTheme.of(context).bodyLargeFamily,
                      //                                                             fontWeight:
                      //                                                                 FontWeight.w600,
                      //                                                             useGoogleFonts:
                      //                                                                 GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                      //                                                           ),
                      //                                                     ),
                      //                                                   if (getJsonField(
                      //                                                         dataMakananItem,
                      //                                                         r'''$.discount''',
                      //                                                       ) !=
                      //                                                       FFAppState()
                      //                                                           .zeroValueString)
                      //                                                     Expanded(
                      //                                                       child:
                      //                                                           Padding(
                      //                                                         padding: EdgeInsetsDirectional.fromSTEB(
                      //                                                             5,
                      //                                                             0,
                      //                                                             0,
                      //                                                             0),
                      //                                                         child:
                      //                                                             Text(
                      //                                                           formatNumber(
                      //                                                             double.parse(getJsonField(
                      //                                                               dataMakananItem,
                      //                                                               r'''$.price''',
                      //                                                             ).toString()),
                      //                                                             formatType:
                      //                                                                 FormatType.decimal,
                      //                                                             decimalType:
                      //                                                                 DecimalType.commaDecimal,
                      //                                                             currency:
                      //                                                                 'Rp ',
                      //                                                           ),
                      //                                                           style: FlutterFlowTheme.of(context)
                      //                                                               .bodyLarge
                      //                                                               .override(
                      //                                                                 fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      //                                                                 decoration: TextDecoration.lineThrough,
                      //                                                                 useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                      //                                                               ),
                      //                                                         ),
                      //                                                       ),
                      //                                                     ),
                      //                                                   Container(
                      //                                                     width: 70,
                      //                                                     height: 35,
                      //                                                     decoration:
                      //                                                         BoxDecoration(
                      //                                                       color: FlutterFlowTheme.of(
                      //                                                               context)
                      //                                                           .accent1,
                      //                                                       borderRadius:
                      //                                                           BorderRadius.circular(
                      //                                                               8),
                      //                                                     ),
                      //                                                     child: Row(
                      //                                                       mainAxisSize:
                      //                                                           MainAxisSize
                      //                                                               .max,
                      //                                                       mainAxisAlignment:
                      //                                                           MainAxisAlignment
                      //                                                               .center,
                      //                                                       children: [
                      //                                                         Align(
                      //                                                           alignment: AlignmentDirectional(
                      //                                                               0,
                      //                                                               0),
                      //                                                           child:
                      //                                                               RichText(
                      //                                                             text:
                      //                                                                 TextSpan(
                      //                                                               children: [
                      //                                                                 TextSpan(
                      //                                                                   text: getJsonField(
                      //                                                                     dataMakananItem,
                      //                                                                     r'''$.stock_quantity''',
                      //                                                                   ).toString(),
                      //                                                                   style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //                                                                         fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      //                                                                         color: FlutterFlowTheme.of(context).primaryBackground,
                      //                                                                         fontWeight: FontWeight.bold,
                      //                                                                         useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                      //                                                                       ),
                      //                                                                 ),
                      //                                                                 TextSpan(
                      //                                                                   text: ' lagi',
                      //                                                                   style: TextStyle(),
                      //                                                                 )
                      //                                                               ],
                      //                                                               style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //                                                                     fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      //                                                                     color: FlutterFlowTheme.of(context).secondaryText,
                      //                                                                     useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                      //                                                                   ),
                      //                                                             ),
                      //                                                           ),
                      //                                                         ),
                      //                                                       ],
                      //                                                     ),
                      //                                                   ),
                      //                                                 ],
                      //                                               ),
                      //                                             ],
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                   Align(
                      //                                     alignment:
                      //                                         AlignmentDirectional(
                      //                                             1, -1),
                      //                                     child: ToggleIcon(
                      //                                       onPressed: () async {
                      //                                         setState(() =>
                      //                                             FFAppState()
                      //                                                     .trueFalse =
                      //                                                 !FFAppState()
                      //                                                     .trueFalse);
                      //                                       },
                      //                                       value: FFAppState()
                      //                                           .trueFalse,
                      //                                       onIcon: Icon(
                      //                                         Icons.favorite_border,
                      //                                         color:
                      //                                             FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .accent1,
                      //                                         size: 30,
                      //                                       ),
                      //                                       offIcon: Icon(
                      //                                         Icons.favorite_sharp,
                      //                                         color:
                      //                                             FlutterFlowTheme.of(
                      //                                                     context)
                      //                                                 .error,
                      //                                         size: 30,
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         );
                      //                       }),
                      //                     ),
                      //                   );
                      //                 },
                      //               );
                      //             },
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rekomendasi Resto',
                              style: bold16.copyWith(color: dark1),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ListRekomendasiWidget(),
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
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState().tokoMakanan(
                                  requestFn: () => MakananMinumanGroup
                                      .getTokoMakananCall
                                      .call(),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    //return Custom Widget,
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
                                  final rowGetMakananResponse = snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final dataMakananRec =
                                          rowGetMakananResponse.jsonBody
                                              .toList()
                                              .take(5)
                                              .toList();
                                      final random = Random();
                                      dataMakananRec.shuffle(random);
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              dataMakananRec.length,
                                              (dataMakananRecIndex) {
                                            final dataMakananRecItem =
                                                dataMakananRec[
                                                    dataMakananRecIndex];
                                            return InkWell(
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
                                                          dataMakananRecItem,
                                                          r'''$.create_user'''),
                                                      dataToko:
                                                          dataMakananRecItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                  10.0, // Adjust this value to decrease the distance
                                                  0.0,
                                                  dataMakananRecIndex == 0
                                                      ? 0.0
                                                      : 0.0,
                                                  0.0,
                                                ),
                                                child: Card(
                                                  child: Container(
                                                    width: 160,
                                                    height: 240,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x23000000),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              child: Center(
                                                                child: dataMakananRecItem['banner'] !=
                                                                            null &&
                                                                        dataMakananRecItem['banner'] !=
                                                                            ''
                                                                    ? Image
                                                                        .network(
                                                                        getJsonField(
                                                                          dataMakananRecItem,
                                                                          r'''$.banner''',
                                                                        ),
                                                                        height:
                                                                            130.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) {
                                                                          return Image
                                                                              .network(
                                                                            'https://cdn2.iconfinder.com/data/icons/building-vol-2/512/restaurant-512.png',
                                                                            height:
                                                                                130.0,
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
                                                                            130.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            15,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          RichText(
                                                                            text:
                                                                                TextSpan(
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.star_purple500_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).warning,
                                                                            size:
                                                                                10,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                dataMakananRecItem,
                                                                                r'''$.review''',
                                                                              )} ',
                                                                              style: regular10.copyWith(color: dark2),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.location_on,
                                                                              color: const Color.fromARGB(255, 65, 64, 64),
                                                                              size: 10.0,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                dataMakananRecItem,
                                                                                r'''$.location_name''',
                                                                              ).toString(),
                                                                              style: TextStyle(
                                                                                color: const Color.fromARGB(255, 65, 64, 64),
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 10.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            dataMakananRecItem,
                                                                            r'''$.business_name''',
                                                                          ).toString(),
                                                                          style:
                                                                              semibold12_5.copyWith(color: dark2),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Align(
                                                        //   alignment:
                                                        //       AlignmentDirectional(
                                                        //           1, -1),
                                                        //   child: ToggleIcon(
                                                        //     onPressed:
                                                        //         () async {
                                                        //       setState(() => FFAppState()
                                                        //               .trueFalse =
                                                        //           !FFAppState()
                                                        //               .trueFalse);
                                                        //     },
                                                        //     value: FFAppState()
                                                        //         .trueFalse,
                                                        //     onIcon: Icon(
                                                        //       Icons
                                                        //           .favorite_border,
                                                        //       color: FlutterFlowTheme
                                                        //               .of(context)
                                                        //           .accent1,
                                                        //       size: 30,
                                                        //     ),
                                                        //     offIcon: Icon(
                                                        //       Icons
                                                        //           .favorite_sharp,
                                                        //       color: FlutterFlowTheme
                                                        //               .of(context)
                                                        //           .error,
                                                        //       size: 30,
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
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

                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 10, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Populer Saat Ini',
                                    style: bold16.copyWith(color: dark1),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ListRekomendasiWidget(),
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
                            // Generated code for this ListView Widget...
                            FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter2 ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(MakananMinumanGroup
                                            .listMakananCall
                                            .call()))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .tertiary400,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final listViewGetMakananResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final jsonBody =
                                        listViewGetMakananResponse.jsonBody;
                                    if (jsonBody == null) {
                                      // Handle the case when jsonBody is null (e.g., show an error message)
                                      return Center(
                                        child: Text("koneksi tidak stabil"),
                                      );
                                    }
                                    final listMakananToko =
                                        listViewGetMakananResponse.jsonBody
                                            .toList();
                                    listMakananToko.sort((a, b) {
                                      final reviewScoreA = double.tryParse(
                                              a['review_score'] ?? "0.0") ??
                                          0.0;
                                      final reviewScoreB = double.tryParse(
                                              b['review_score'] ?? "0.0") ??
                                          0.0;
                                      return reviewScoreB
                                          .compareTo(reviewScoreA);
                                    });
                                    // Batasi jumlah data yang ditampilkan menjadi 20
                                    final limitedData =
                                        listMakananToko.take(20).toList();
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        setState(() =>
                                            _model.apiRequestCompleter2 = null);
                                        await _model
                                            .waitForApiRequestCompleted2();
                                      },
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: limitedData.length,
                                        itemBuilder:
                                            (context, limitedDataIndex) {
                                          final limitedDataItem =
                                              limitedData[limitedDataIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 10, 20, 20),
                                            child: InkWell(
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
                                                          limitedDataItem,
                                                          r'''$.create_user'''),
                                                      dataToko: limitedDataItem[
                                                          'seller'],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      getJsonField(
                                                              limitedDataItem,
                                                              r'''$.banner''')[
                                                          '200x150'],
                                                      width: 80,
                                                      height: 80,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
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
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  '${(getJsonField(limitedDataItem, r'''$.name'''))} - ${(getJsonField(limitedDataItem['seller'], r'''$.name'''))}',
                                                                  style: semibold12_5
                                                                      .copyWith(
                                                                          color:
                                                                              dark2),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .star_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                                size: 10,
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                        limitedDataItem[
                                                                            'seller'],
                                                                        r'''$.review''')
                                                                    .toString(),
                                                                style: regular10
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                                limitedDataItem,
                                                                r'''$.category_name'''),
                                                            style: regular10
                                                                .copyWith(
                                                                    color:
                                                                        dark2),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                    limitedDataItem,
                                                                    r'''$.location_name'''),
                                                                style: regular10
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                              // SizedBox(
                                                              //   height: 14,
                                                              //   child:
                                                              //       VerticalDivider(
                                                              //     thickness: 2,
                                                              //     color: FlutterFlowTheme.of(
                                                              //             context)
                                                              //         .accent4,
                                                              //   ),
                                                              // ),
                                                              // Text(
                                                              //   '${(getJsonField(listMakananTokoItem['seller'], r'''$.open_hour'''))} - ${(getJsonField(listMakananTokoItem['seller'], r'''$.close_hour'''))}',
                                                              //   style: FlutterFlowTheme.of(
                                                              //           context)
                                                              //       .bodySmall,
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
