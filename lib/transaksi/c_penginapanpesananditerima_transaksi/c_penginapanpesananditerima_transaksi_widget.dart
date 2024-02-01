import 'dart:convert';

import 'package:get/get.dart';
import 'package:kolaka/backend/api_requests/api_calls.dart';
import 'package:kolaka/core/helpers/common_helper.dart';
import 'package:kolaka/core/services/api_client.dart';
import 'package:kolaka/home/chat/chat_widget.dart';
import 'package:kolaka/main.dart';
import 'package:kolaka/transaksi/halamanstatus_message/halamanstatus_cancel_widget.dart';
import 'package:kolaka/transaksi/halamanstatus_message/halamanstatus_message_widget.dart';
import 'package:kolaka/umkm/tracking_food_widget.dart';
import 'package:kolaka/umkm/tracking_widget.dart';

import '/components/varian_umkm_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_penginapanpesananditerima_transaksi_model.dart';
export 'c_penginapanpesananditerima_transaksi_model.dart';

class CPenginapanpesananditerimaTransaksiWidget extends StatefulWidget {
  const CPenginapanpesananditerimaTransaksiWidget({
    Key? key,
    this.detailData,
  }) : super(key: key);
  final dynamic detailData;

  @override
  _CPenginapanpesananditerimaTransaksiWidgetState createState() =>
      _CPenginapanpesananditerimaTransaksiWidgetState();
}

class _CPenginapanpesananditerimaTransaksiWidgetState
    extends State<CPenginapanpesananditerimaTransaksiWidget> {
  ApiClient apiClient = Get.isRegistered<ApiClient>()
      ? Get.find<ApiClient>()
      : Get.put(ApiClient());
  late CPenginapanpesananditerimaTransaksiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CPenginapanpesananditerimaTransaksiModel());

    if (widget.detailData['review'] != null) {
      _model.textController ??= TextEditingController(
          text: getJsonField(
        widget.detailData,
        r'''$.review.content''',
      ).toString().toString());
    } else {
      _model.textController ??= TextEditingController(text: 'Isi komentar');
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    print('${widget.detailData['status']} Status');

    dynamic dataDetail = json.decode(widget.detailData['data_detail']);

    dynamic buyerFees = json.decode(widget.detailData['buyer_fees']);
    // String dataDetailJson = json.encode(dataDetail['items']);

    // final dataDetailList = json.decode(dataDetailJson) as List<dynamic>;
    // print(buyerFees);
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
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarPage(initialPage: 'Transaksi'),
                ),
              );
            },
          ),
          title: Text(
            'Detail Transaksi',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  fontSize: 14.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyLargeFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if ((getJsonField(
                                        widget.detailData, r'''$.status''') ==
                                    'Payment Sukses'))
                                  Text(
                                    'Pembayaran Berhasil',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              Color.fromARGB(255, 18, 195, 50),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                if ((getJsonField(
                                        widget.detailData, r'''$.status''') ==
                                    'Shipping'))
                                  Text(
                                    'Pesanan Sedang Di kirim',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: Color(0xFFC08423),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                if ((getJsonField(
                                        widget.detailData, r'''$.status''') ==
                                    'Dibatalkan'))
                                  // Text(
                                  //   'Dibatalkan',
                                  //   style: FlutterFlowTheme.of(context)
                                  //       .bodyMedium
                                  //       .override(
                                  //         fontFamily:
                                  //             FlutterFlowTheme.of(context)
                                  //                 .bodyMediumFamily,
                                  //         color: Color.fromARGB(255, 255, 0, 0),
                                  //         fontSize: 16.0,
                                  //         fontWeight: FontWeight.bold,
                                  //         useGoogleFonts: GoogleFonts.asMap()
                                  //             .containsKey(
                                  //                 FlutterFlowTheme.of(context)
                                  //                     .bodyMediumFamily),
                                  //       ),
                                  // ),
                                  if ((getJsonField(
                                          widget.detailData, r'''$.status''') ==
                                      'Partial'))
                                    Text(
                                      'Partial',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFFC08423),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                if ((getJsonField(
                                        widget.detailData, r'''$.status''') ==
                                    'Proses'))
                                  Text(
                                    'Pesanan Diproses',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: Color(0xFFC08423),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                if ((getJsonField(
                                        widget.detailData, r'''$.status''') ==
                                    'Selesai'))
                                  Text(
                                    'Pesanan Selesai',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: Color(0xFFC08423),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if ((getJsonField(
                                        widget.detailData, r'''$.status''') ==
                                    'Payment Sukses'))
                                  Text(
                                    '',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Kategori :',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                if ((getJsonField(widget.detailData,
                                        r'''$.object_model''') ==
                                    'hotel'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Penginapan',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                if ((getJsonField(widget.detailData,
                                        r'''$.object_model''') ==
                                    'umkm'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'UMKM',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                if ((getJsonField(widget.detailData,
                                        r'''$.object_model''') ==
                                    'food-beverages'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Makanan dan Minuman',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                if ((getJsonField(widget.detailData,
                                        r'''$.object_model''') ==
                                    'tiket-wisata'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tiket Wisata',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                if ((getJsonField(widget.detailData,
                                        r'''$.object_model''') ==
                                    'transportasi'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Transportasi',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'No. Pesanan :',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                      widget.detailData, r'''$.code'''),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent4,
                        ),
                        if (widget.detailData['code'].substring(0, 1) == 'H' ||
                            widget.detailData['code'].substring(0, 1) == 'W' ||
                            widget.detailData['code'].substring(0, 1) == 'R')
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(21.0),
                                          child: Image.network(
                                            widget.detailData['code']
                                                        .substring(0, 1) ==
                                                    'H'
                                                ? dataDetail['banner']
                                                    ['200x150']
                                                : widget.detailData['code']
                                                            .substring(0, 1) ==
                                                        'W'
                                                    ? dataDetail['tiket-wisata']
                                                        ['banner']['200x150']
                                                    : widget.detailData['code']
                                                                .substring(
                                                                    0, 1) ==
                                                            'R'
                                                        ? dataDetail[
                                                                'transportasi'][
                                                            'banner']['200x150']
                                                        : '',
                                            width: 117.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  widget.detailData['code']
                                                              .substring(
                                                                  0, 1) ==
                                                          'H'
                                                      ? dataDetail[
                                                          'hotel_title']
                                                      : widget.detailData[
                                                                      'code']
                                                                  .substring(
                                                                      0, 1) ==
                                                              'W'
                                                          ? dataDetail[
                                                                  'tiket-wisata']
                                                              ['title']
                                                          : widget.detailData[
                                                                          'code']
                                                                      .substring(
                                                                          0,
                                                                          1) ==
                                                                  'R'
                                                              ? dataDetail[
                                                                      'transportasi']
                                                                  ['title']
                                                              : '',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  widget.detailData['code']
                                                              .substring(
                                                                  0, 1) ==
                                                          'H'
                                                      ? dataDetail['locname']
                                                      : widget.detailData[
                                                                      'code']
                                                                  .substring(
                                                                      0, 1) ==
                                                              'W'
                                                          ? dataDetail[
                                                              'locname']
                                                          : widget.detailData[
                                                                          'code']
                                                                      .substring(
                                                                          0,
                                                                          1) ==
                                                                  'R'
                                                              ? dataDetail[
                                                                  'locname']
                                                              : '',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  widget.detailData['code']
                                                              .substring(
                                                                  0, 1) ==
                                                          'H'
                                                      ? dataDetail['title']
                                                      : widget.detailData[
                                                                      'code']
                                                                  .substring(
                                                                      0, 1) ==
                                                              'W'
                                                          ? dataDetail[
                                                                  'tiket-wisata']
                                                              ['title']
                                                          : widget.detailData[
                                                                          'code']
                                                                      .substring(
                                                                          0,
                                                                          1) ==
                                                                  'R'
                                                              ? dataDetail[
                                                                      'transportasi']
                                                                  ['title']
                                                              : '',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        if (widget.detailData['code'].substring(0, 1) == 'U' ||
                            widget.detailData['code'].substring(0, 1) == 'F')
                          // Generated code for this ColumnTitle Widget...
                          Builder(
                            builder: (context) {
                              final dataDetails = dataDetail['items'] ?? [];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(dataDetails.length,
                                    (dataDetailsIndex) {
                                  final dataDetailsItem =
                                      dataDetails[dataDetailsIndex];
                                  // Map<String, dynamic>? bannerMap = getJsonField(dataDetailsItem, r'''$.banner''') as Map<String, dynamic>?;
                                  // String imageUrl = bannerMap?['original'] as String? ?? 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.icon-icons.com%2Ficons2%2F37%2FPNG%2F512%2Fproductapplication_producto_3010.png&f=1&nofb=1&ipt=e4b03bfdadbc4b2f43af11f65fe326f6ee25f7f453b7f6a7c96d5eceb1cd40a9&ipo=images';
                                  Map<String, dynamic>? bannerMap;
                                  String imageUrl;

                                  // Check if 'banner' is a Map<String, dynamic>
                                  if (dataDetailsItem['banner']
                                      is Map<String, dynamic>) {
                                    bannerMap = dataDetailsItem['banner']
                                        as Map<String, dynamic>;
                                    imageUrl = bannerMap?['original']
                                            as String? ??
                                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.icon-icons.com%2Ficons2%2F37%2FPNG%2F512%2Fproductapplication_producto_3010.png&f=1&nofb=1&ipt=e4b03bfdadbc4b2f43af11f65fe326f6ee25f7f453b7f6a7c96d5eceb1cd40a9&ipo=images';
                                  } else {
                                    // Handle the case where 'banner' is not a Map<String, dynamic>
                                    imageUrl =
                                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.icon-icons.com%2Ficons2%2F37%2FPNG%2F512%2Fproductapplication_producto_3010.png&f=1&nofb=1&ipt=e4b03bfdadbc4b2f43af11f65fe326f6ee25f7f453b7f6a7c96d5eceb1cd40a9&ipo=images';
                                  }

                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              child: Image.network(
                                                imageUrl,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                          dataDetailsItem,
                                                          r'''$.name'''),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    // if ((getJsonField(
                                                    //         dataDetailsItem,
                                                    //         r'''$.variants''') !=
                                                    //     null))
                                                    //   Text(
                                                    //     getJsonField(
                                                    //         dataDetailsItem,
                                                    //         r'''$.variants.name'''),
                                                    //     style:
                                                    //         FlutterFlowTheme.of(
                                                    //                 context)
                                                    //             .bodyMedium
                                                    //             .override(
                                                    //               fontFamily: FlutterFlowTheme.of(
                                                    //                       context)
                                                    //                   .bodyMediumFamily,
                                                    //               color: FlutterFlowTheme.of(
                                                    //                       context)
                                                    //                   .primary,
                                                    //               fontSize: 14,
                                                    //               fontWeight:
                                                    //                   FontWeight
                                                    //                       .normal,
                                                    //               useGoogleFonts: GoogleFonts
                                                    //                       .asMap()
                                                    //                   .containsKey(
                                                    //                       FlutterFlowTheme.of(context)
                                                    //                           .bodyMediumFamily),
                                                    //             ),
                                                    //   ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${getJsonField(dataDetailsItem, r'''$.quantity''')} Item',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          formatNumber(
                                                              double.parse(getJsonField(
                                                                      dataDetailsItem,
                                                                      r'''$.price''')
                                                                  .toString()),
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                              currency: 'Rp '),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
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
                                  );
                                }),
                              );
                            },
                          ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent4,
                        ),
                        if (widget.detailData['code'].substring(0, 1) == 'H' ||
                            widget.detailData['code'].substring(0, 1) == 'W' ||
                            widget.detailData['code'].substring(0, 1) == 'R')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 10.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nama Pemesan',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        '${widget.detailData['first_name']} ${widget.detailData['last_name']}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  if (widget.detailData['code']
                                          .substring(0, 1) ==
                                      'H')
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Check in',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatDDateTimes(
                                                      widget.detailData[
                                                          'start_date']),
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Check out',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatDDateTimes(
                                                      widget.detailData[
                                                          'end_date']),
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  // End Homestay Data
                                  if (widget.detailData['code']
                                          .substring(0, 1) ==
                                      'W')
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Berangkat',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatDDateTimes(
                                                      widget.detailData[
                                                          'start_date']),
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  // End Tour Data
                                  if (widget.detailData['code']
                                          .substring(0, 1) ==
                                      'R')
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Tanggal sewa',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatDDateTimes(
                                                      widget.detailData[
                                                          'start_date']),
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  // End Rent Data
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (widget.detailData['code']
                                                .substring(0, 1) ==
                                            'H')
                                          Text(
                                            'Harga per kamar',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        if (widget.detailData['code']
                                                .substring(0, 1) ==
                                            'W')
                                          Text(
                                            'Harga Tiket',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        if (widget.detailData['code']
                                                .substring(0, 1) ==
                                            'R')
                                          Text(
                                            'Harga sewa kendaraan',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        if (widget.detailData['code']
                                                .substring(0, 1) ==
                                            'H')
                                          Text(
                                            formatNumber(
                                              double.parse(dataDetail['price']
                                                  .toString()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        if (widget.detailData['code']
                                                .substring(0, 1) ==
                                            'W')
                                          Text(
                                            formatNumber(
                                              double.parse(getJsonField(
                                                      widget.detailData,
                                                      r'''$.total_before_fees''')
                                                  .toString()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            // '',
                                          ),
                                        if (widget.detailData['code']
                                                .substring(0, 1) ==
                                            'R')
                                          Text(
                                            formatNumber(
                                              double.parse(getJsonField(
                                                      widget.detailData,
                                                      r'''$.total_before_fees''')
                                                  .toString()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            // '',
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (widget.detailData['code']
                                          .substring(0, 1) ==
                                      'H')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Jumlah Kamar',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            dataDetail['total_room'],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (widget.detailData['code']
                                          .substring(0, 1) ==
                                      'W')
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(
                                    //       0.0, 0.0, 0.0, 10.0),
                                    //   child: Row(
                                    //     mainAxisSize: MainAxisSize.max,
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text(
                                    //         'Jenis Paket',
                                    //         style: FlutterFlowTheme.of(context)
                                    //             .bodyMedium,
                                    //       ),
                                    //       Text(
                                    //         'Open Trip',
                                    //         style: FlutterFlowTheme.of(context)
                                    //             .bodyMedium,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    if (widget.detailData['code']
                                            .substring(0, 1) ==
                                        'R')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Penyewaan',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              'Lepas kunci/Dengan supir',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                  if (widget.detailData['code']
                                              .substring(0, 1) ==
                                          'H' ||
                                      widget.detailData['code']
                                              .substring(0, 1) ==
                                          'R')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Biaya Penanganan dan Administrasi',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            formatNumber(
                                              double.parse((buyerFees[
                                                          'admin_fee'] +
                                                      buyerFees['transfer_fee'])
                                                  .toString()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),

                                  if (widget.detailData['code']
                                          .substring(0, 1) ==
                                      'W')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Biaya Penanganan dan Administrasi',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            formatNumber(
                                              double.parse((buyerFees[
                                                          'admin_fee'] +
                                                      buyerFees['transfer_fee'])
                                                  .toString()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Harga',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          formatNumber(
                                              double.parse(widget
                                                  .detailData['total']
                                                  .toString()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'Rp '),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 16.0,
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
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (widget.detailData['code'].substring(0, 1) == 'F' ||
                            widget.detailData['code'].substring(0, 1) == 'U')
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 10.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Harga Pesanan',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              formatNumber(
                                                  double.parse(
                                                      dataDetail['totalPrice']
                                                          .toString()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'Rp '),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Biaya Pengiriman',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              formatNumber(
                                                  double.parse(FFAppState()
                                                      .biayaPengiriman
                                                      .toString()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'Rp '),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Biaya Penanganan',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              formatNumber(
                                                  double.parse(FFAppState()
                                                      .biayaPenanganan
                                                      .toString()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'Rp '),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total Harga',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              formatNumber(
                                                  double.parse(widget
                                                      .detailData['total']
                                                      .toString()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'Rp '),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 16.0,
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
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 10.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nama Pemesan :',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontWeight: FontWeight.w600,
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dataDetail['name'],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '+${dataDetail['phone']}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Alamat Pengiriman :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                      if ((getJsonField(widget.detailData,
                                              r'''$.object_model''') ==
                                          'umkm'))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: UserGroup.userAddressCall
                                                  .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                              ),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final textUserAddressResponse =
                                                    snapshot.data!;
                                                final userAddressData = UserGroup
                                                    .userAddressCall
                                                    .userAddressDataAddressDet(
                                                  textUserAddressResponse
                                                      .jsonBody,
                                                ) as List<dynamic>?;
                                                if (userAddressData == null ||
                                                    userAddressData.isEmpty) {
                                                  return Text(
                                                    'No user address available',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  );
                                                }

                                                return Expanded(
                                                    child: Text(
                                                  userAddressData.first
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ));
                                              },
                                            ),
                                          ],
                                        ),
                                      if ((getJsonField(widget.detailData,
                                              r'''$.object_model''') ==
                                          'umkm'))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: UserGroup.userAddressCall
                                                  .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                              ),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final textUserAddressResponse =
                                                    snapshot.data!;
                                                final userAddressData = UserGroup
                                                    .userAddressCall
                                                    .userAddressDataAddressPhone(
                                                  textUserAddressResponse
                                                      .jsonBody,
                                                ) as List<dynamic>?;

                                                if (userAddressData == null ||
                                                    userAddressData.isEmpty) {
                                                  return Text(
                                                    'No user phone available',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  );
                                                }

                                                return Text(
                                                  userAddressData.first
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      if ((getJsonField(widget.detailData,
                                                  r'''$.object_model''') ==
                                              'food-beverages' ||
                                          getJsonField(widget.detailData,
                                                  r'''$.object_model''') ==
                                              'food-beverage'))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(
                                              getJsonField(dataDetail,
                                                      r'''$.address''')
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ))
                                          ],
                                        ),
                                      if ((getJsonField(widget.detailData,
                                                  r'''$.object_model''') ==
                                              'food-beverages' ||
                                          getJsonField(widget.detailData,
                                                  r'''$.object_model''') ==
                                              'food-beverage'))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: UserGroup.userAddressCall
                                                  .call(
                                                accessToken:
                                                    FFAppState().accessToken,
                                              ),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final textUserAddressResponse =
                                                    snapshot.data!;
                                                final userAddressData = UserGroup
                                                    .userAddressCall
                                                    .userAddressDataAddressPhone(
                                                  textUserAddressResponse
                                                      .jsonBody,
                                                ) as List<dynamic>?;

                                                if (userAddressData == null ||
                                                    userAddressData.isEmpty) {
                                                  return Text(
                                                    'No user phone available',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  );
                                                }

                                                return Text(
                                                  userAddressData.first
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 10.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Informasi Pengiriman :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if ((getJsonField(widget.detailData,
                                                        r'''$.object_model''') ==
                                                    'food-beverages' ||
                                                getJsonField(widget.detailData,
                                                        r'''$.object_model''') ==
                                                    'food-beverage'))
                                              Text(
                                                'Kurir Resto',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            if ((getJsonField(widget.detailData,
                                                    r'''$.object_model''') ==
                                                'umkm'))
                                              Text(
                                                dataDetail['shipping']
                                                    ['courier'],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            if (widget.detailData['status'] ==
                                                'Shipping')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((getJsonField(
                                                          widget.detailData,
                                                          r'''$.object_model''') ==
                                                      'umkm')) {
                                                    Get.to(() => TrackingWidget(
                                                        detailData:
                                                            widget.detailData,
                                                        dataDetail:
                                                            dataDetail));
                                                  } else if ((getJsonField(
                                                              widget.detailData,
                                                              r'''$.object_model''') ==
                                                          'food-beverages' ||
                                                      getJsonField(
                                                              widget.detailData,
                                                              r'''$.object_model''') ==
                                                          'food-beverage')) {
                                                            print('ini data detail: ${dataDetail['address2']}');
                                                    // Get.to(() =>
                                                    //     TrackingFoodWidget(
                                                    //         detailData: widget
                                                    //             .detailData,
                                                    //         dataDetail:
                                                    //             dataDetail,
                                                    //             addressLatlng: dataDetail['address2']));
                                                    List destCoor =
                                                    dataDetail['address2'].split(',');
                                                double latitude =
                                                    double.parse(destCoor[0]);
                                                double longitude =
                                                    double.parse(destCoor[1]);
                                                Get.to(
                                                    () => TrackingFoodWidget(
                                                        booking: widget.detailData),
                                                    arguments: {
                                                      'destination': {
                                                        'latitude': latitude,
                                                        'longitude': longitude
                                                      }
                                       });
                                                  } else {
                                                    print('object');
                                                  }
                                                },
                                                child: Text(
                                                  'Lacak',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
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
                  if (widget.detailData['status'] != 'Selesai'
                      ? widget.detailData['status'] != 'Dibatalkan'
                      : widget.detailData['status'] != 'Selesai')
                    Column(
                      children: [
                        Text(
                          'QR Code',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: BarcodeWidget(
                            data:
                                '${widget.detailData['code']},https://booking-api.kolaka.kabtour.com/v2/booking/,update,finish',
                            barcode: Barcode.qrCode(
                                errorCorrectLevel:
                                    BarcodeQRCorrectionLevel.high),
                            width: 250,
                            height: 250,
                            color: FlutterFlowTheme.of(context).primaryText,
                            backgroundColor: Colors.transparent,
                            errorBuilder: (_context, _error) => SizedBox(
                              width: 250,
                              height: 250,
                            ),
                            drawText: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kode Transaksi :',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              if (widget.detailData['payment'] != null)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    widget.detailData['payment']['bill_no'],
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Text(
                            'Note : Untuk menyelesaikan transaksi silahkan scan  Barcode atau masukan Kode Transaksi di aplikasi mitra Kolaka',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.italic,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 60.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      String lastName = widget.detailData['vendor']['last_name'] ?? '';
                                      Get.off(() => const ChatWidget(),
                                          arguments: {
                                            'to_username':
                                                '${widget.detailData['vendor']['first_name']}.${lastName.replaceAll(" ", "-")}',
                                            'not_navbar': true
                                          });
                                    },
                                    text: 'Kirim Pesan',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(21.0),
                                    ),
                                  ),
                                ),
                              ),
                              if (widget.detailData['status'] != 'Shipping' &&
                                  widget.detailData['status'] !=
                                      'minta_batal' &&
                                  widget.detailData['status'] != 'Dibatalkan')
                                  if(widget.detailData['object_model'] !=
                                              'food-beverages' ||
                                          widget.detailData['object_model']  !=
                                              'food-beverage')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var res = await updateTransactionStatus(
                                            'minta_batal',
                                            widget.detailData['code']);
                                        Get.to(() =>
                                            const HalamanstatusCancelWidget());
                                      },
                                      text: 'Batalkan Pesanan',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(21.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (widget.detailData['status'] == 'minta_batal')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        print('pembatalan');
                                      },
                                      text: 'Permintaan Pembatalan',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(21.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (widget.detailData['status'] == 'Partial')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var res = await updateTransactionStatus(
                                            'Selesai',
                                            widget.detailData['code']);
                                        Get.to(() =>
                                            const HalamanstatusMessageWidget());
                                      },
                                      text: 'Selesaikan Pesanan',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(21.0),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  // End transaksi running
                  // Start Rating Apps
                  if (widget.detailData['status'] == 'Selesai')
                    Column(
                      children: [
                        // Generated code for this Text Widget...
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Text(
                            'Penilaian Anda akan membantu kami dengan layanan yang lebih baik',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        if (widget.detailData['review'] != null)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  onRatingUpdate: (newValue) => setState(
                                      () => _model.ratingBarValue = newValue),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: FlutterFlowTheme.of(context).warning,
                                  ),
                                  direction: Axis.horizontal,
                                  // initialRating: _model.ratingBarValue ??= 4,

                                  initialRating: _model.ratingBarValue ??=
                                      getJsonField(widget.detailData,
                                              r'''$.review.rate_number''')
                                          .toDouble(),
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  itemCount: 5,
                                  itemSize: 45,
                                  glowColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              ],
                            ),
                          ),
                        if (widget.detailData['review'] == null)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  onRatingUpdate: (newValue) => setState(
                                      () => _model.ratingBarValue = newValue),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: FlutterFlowTheme.of(context).warning,
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating: _model.ratingBarValue ??= 0,

                                  // initialRating: _model.ratingBarValue ??=
                                  //     getJsonField(widget.detailData,
                                  //             r'''$.review.rate_number''')
                                  //         .toDouble(),
                                  unratedColor:
                                      FlutterFlowTheme.of(context).accent3,
                                  itemCount: 5,
                                  itemSize: 45,
                                  glowColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: _model.textController,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Tambahkan Komentar',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 2,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 40, 20, 60),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (getJsonField(widget.detailData,
                                            r'''$.review''') ==
                                        null) {
                                      _model.apiResult1rh = await ApiHelperGroup
                                          .addReviewHandlerCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                        bookingId: getJsonField(
                                          widget.detailData,
                                          r'''$.id''',
                                        ).toString(),
                                        bookingCode: getJsonField(
                                          widget.detailData,
                                          r'''$.code''',
                                        ).toString(),
                                        objectId: getJsonField(
                                          widget.detailData,
                                          r'''$.object_id''',
                                        ).toString(),
                                        objectModel: getJsonField(
                                          widget.detailData,
                                          r'''$.object_model''',
                                        ).toString(),
                                        content: _model.textController.text,
                                        rateNumber:
                                            _model.ratingBarValue.toString(),
                                        vendorId: getJsonField(
                                          widget.detailData,
                                          r'''$.vendor_id''',
                                        ).toString(),
                                      );
                                    } else {
                                      // var updateReview =
                                      //     widget.detailData['review'];
                                      // updateReview['content'];
                                      // updateReview['rate_number'];

                                      _model.apiResult1rh = await ApiHelperGroup
                                          .updateReviewHandlerCall
                                          .call(
                                        revid: widget.detailData['review']
                                            ['id'],
                                        accessToken: FFAppState().accessToken,
                                        content: _model.textController.text,
                                        rateNumber:
                                            _model.ratingBarValue.toString(),
                                      );
                                    }
                                    print(_model.apiResult1rh!.bodyText);
                                    if ((_model.apiResult1rh?.succeeded ??
                                        true)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResult1rh?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                        ),
                                      );
                                    }
                                    setState(() {});
                                  },
                                  text: getJsonField(widget.detailData,
                                              r'''$.review''') ==
                                          null
                                      ? 'Kirim Penilaian'
                                      : 'Ubah Penilaian',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).accent1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }

  updateTransactionStatus(String status, String code) async {
    print('$code - $status');
    // apiClient.setSubdomain('booking-api');
    var res = await apiClient.post(
        'https://booking-api.kolaka.kabtour.com/v2/my-transactions/update/$code?_method=put',
        data: {'status': status});
    CommonHelper.logPrint(res);
  }
}
