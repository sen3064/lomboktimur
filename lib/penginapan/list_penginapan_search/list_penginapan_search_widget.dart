import 'dart:async';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kolaka/theme.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/ubah_data_booking_backup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/penginapan/detail_penginapan/detail_penginapan_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'list_penginapan_search_model.dart';
export 'list_penginapan_search_model.dart';

class ListPenginapanSearchWidget extends StatefulWidget {
  const ListPenginapanSearchWidget({
    Key? key,
    required this.locationName,
    required this.locationId,
    required this.startDate,
    required this.endDate,
    required this.rooms,
    required this.guests,
  }) : super(key: key);

  final String? locationName;
  final String? locationId;
  final String? startDate;
  final String? endDate;
  final String? rooms;
  final String? guests;

  @override
  _ListPenginapanSearchWidgetState createState() =>
      _ListPenginapanSearchWidgetState();
}

class _ListPenginapanSearchWidgetState
    extends State<ListPenginapanSearchWidget> {
  late ListPenginapanSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPenginapanSearchModel());
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
        child: RefreshIndicator(
          onRefresh: () async {
            print('refresh atas');
            setState(() => _model.apiRequestCompleter = null);
            await _model.waitForOnePage();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).accent1,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavBarPage(initialPage: 'Home_Page'),
                    ),
                  );
                },
              ),
              title: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.locationName!,
                          style: semibold12_5.copyWith(color: white),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      functions.viewDate(widget.startDate),
                                      'null',
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: ' - ',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      functions.viewDate(widget.endDate),
                                      'null',
                                    ),
                                    style: TextStyle(),
                                  )
                                ],
                                style: regular10.copyWith(color: white),
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            Text(
                              '${widget.rooms} Kamar',
                              style: regular10.copyWith(color: white),
                            ),
                            Icon(
                              Icons.arrow_right_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 15.0,
                            ),
                            Text(
                              '${widget.guests} Tamu',
                              style: regular10.copyWith(color: white),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Get.bottomSheet(
                              GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode),
                                child: Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: UbahDataBookingBackupWidget(
                                    startDate:
                                        FFAppState().startDate.toString(),
                                    endDate: FFAppState().endDate.toString(),
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              isDismissible: true,
                              isScrollControlled: true,
                            );
                            setState(() {});
                          },
                          child: Text(
                            "Ubah",
                            style: regular12_5.copyWith(color: white),
                          ),
                        )
                      ],
                    ),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     await Get.bottomSheet(
                    //       GestureDetector(
                    //         onTap: () => FocusScope.of(context)
                    //             .requestFocus(_model.unfocusNode),
                    //         child: Padding(
                    //           padding: MediaQuery.of(context).viewInsets,
                    //           child: UbahDataBookingBackupWidget(
                    //             startDate: FFAppState().startDate.toString(),
                    //             endDate: FFAppState().endDate.toString(),
                    //           ),
                    //         ),
                    //       ),
                    //       backgroundColor: Colors.transparent,
                    //       isDismissible: true,
                    //       isScrollControlled: true,
                    //     );

                    //     setState(() {});
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: FlutterFlowTheme.of(context).accent1,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(5.0),
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 5.0, horizontal: 10.0),
                    //     child: Text(
                    //       'Ubah',
                    //       style: FlutterFlowTheme.of(context)
                    //           .labelSmall
                    //           .override(
                    //             fontFamily: FlutterFlowTheme.of(context)
                    //                 .labelSmallFamily,
                    //             color:
                    //                 FlutterFlowTheme.of(context).secondaryText,
                    //             fontSize: 10.0,
                    //             useGoogleFonts: GoogleFonts.asMap().containsKey(
                    //               FlutterFlowTheme.of(context).labelSmallFamily,
                    //             ),
                    //           ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/promotion.png',
                                width: 20.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Murah Setiap Hari',
                                          style: semibold12_5.copyWith(
                                              color: white),
                                        ),
                                        Text(
                                          'Nginep murah setiap hari mulai dari 50rb aja ',
                                          style: regular12_5.copyWith(
                                              color: white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            setState(() =>
                                _model.listViewPagingController1?.refresh());
                            await _model.waitForOnePage();
                          },
                          child: PagedListView<ApiPagingParams, dynamic>(
                            pagingController: _model.setListViewController1(
                              (nextPageMarker) =>
                                  HomestayGroup.homestaySearchCall.call(
                                locationId: widget.locationId,
                                checkout: widget.endDate,
                                checkin: widget.startDate,
                                nextPage: valueOrDefault<int>(
                                  nextPageMarker.nextPageNumber,
                                  1,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
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
                                    ),
                                // Customize what your widget looks like when it's loading another page.
                                newPageProgressIndicatorBuilder: (_) => Center(
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
                                    ),
                                itemBuilder: (context, _, homestayDataIndex) {
                                  final homestayDataSearchItem = _model
                                      .listViewPagingController1!
                                      .itemList![homestayDataIndex];
                                  final title = homestayDataSearchItem['title'];
                                  final gallery =
                                      homestayDataSearchItem['gallery'];
                                  if (title == null ||
                                      (gallery == null ||
                                          (gallery as List).isEmpty)) {
                                    return Container();
                                  }
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 350.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (getJsonField(
                                                      homestayDataSearchItem,
                                                      r'''$.price''',
                                                    ) !=
                                                    FFAppState().zeroVal) {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailPenginapanWidget(
                                                        hid: getJsonField(
                                                          homestayDataSearchItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        homestayData:
                                                            homestayDataSearchItem,
                                                        startDate:
                                                            valueOrDefault<
                                                                String>(
                                                          functions.formatDate(
                                                              dateTimeFormat(
                                                                  'd/M/y',
                                                                  FFAppState()
                                                                      .startDate)),
                                                          'null',
                                                        ),
                                                        endDate: valueOrDefault<
                                                            String>(
                                                          functions.formatDate(
                                                              dateTimeFormat(
                                                                  'd/M/y',
                                                                  FFAppState()
                                                                      .endDate)),
                                                          'null',
                                                        ),
                                                        rooms: widget.rooms!,
                                                        guests: widget.guests!,
                                                        terms: getJsonField(
                                                          homestayDataSearchItem,
                                                          r'''$.terms_by_attribute_in_listing_page''',
                                                        ),
                                                        mapLat: double.parse(
                                                            getJsonField(
                                                          homestayDataSearchItem,
                                                          r'''$.map_lat''',
                                                        ).toString()),
                                                        mapLng: double.parse(
                                                            getJsonField(
                                                          homestayDataSearchItem,
                                                          r'''$.map_lng''',
                                                        ).toString()),
                                                        locationLatLng: functions
                                                            .locationLatLng(
                                                                double.parse(
                                                                    getJsonField(
                                                                  homestayDataSearchItem,
                                                                  r'''$.map_lat''',
                                                                ).toString()),
                                                                double.parse(
                                                                    getJsonField(
                                                                  homestayDataSearchItem,
                                                                  r'''$.map_lng''',
                                                                ).toString()))!,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Tidak ada kamar tersedia',
                                                        style: semibold12_5
                                                            .copyWith(
                                                                color: dark2),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray200,
                                                    ),
                                                  );
                                                }
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: 145.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  7.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final galleryData =
                                                              getJsonField(
                                                            homestayDataSearchItem,
                                                            r'''$.gallery''',
                                                          ).toList();
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                galleryData
                                                                    .length,
                                                            itemBuilder: (context,
                                                                galleryDataIndex) {
                                                              final galleryDataItem =
                                                                  galleryData[
                                                                      galleryDataIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 200.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .network(
                                                                      getJsonField(
                                                                        galleryDataItem,
                                                                        r'$..["400x350"]',
                                                                      ),
                                                                      width:
                                                                          233.0,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          homestayDataSearchItem,
                                                          r'''$.title''',
                                                        ).toString(),
                                                        style: semibold12_5
                                                            .copyWith(
                                                                color: dark2),
                                                      ),
                                                    ),
                                                  ),
                                                  if (getJsonField(
                                                            homestayDataSearchItem,
                                                            r'''$.review_score''',
                                                          ) !=
                                                          "0.0" ||
                                                      getJsonField(
                                                            homestayDataSearchItem,
                                                            r'''$.review_score''',
                                                          ) !=
                                                          null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  2.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .solidStar,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 15.0,
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                getJsonField(
                                                                  homestayDataSearchItem,
                                                                  r'''$.review_score''',
                                                                ).toString(),
                                                                style: regular10
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                            ),
                                                          ),
                                                          if (getJsonField(
                                                                    homestayDataSearchItem,
                                                                    r'''$.review_score''',
                                                                  ) ==
                                                                  "0.0" ||
                                                              getJsonField(
                                                                    homestayDataSearchItem,
                                                                    r'''$.review_score''',
                                                                  ) ==
                                                                  null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '(Belum ada review)',
                                                                style: regular10
                                                                    .copyWith(
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
                                                            .fromSTEB(10.0, 5.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.verified_user,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          size: 15.0,
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                homestayDataSearchItem,
                                                                r'''$.business_name''',
                                                              ).toString(),
                                                              style: regular12_5
                                                                  .copyWith(
                                                                      color:
                                                                          dark2),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                10.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.location_pin,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 15.0,
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                homestayDataSearchItem,
                                                                r'''$.location.name''',
                                                              ).toString(),
                                                              style: regular10
                                                                  .copyWith(
                                                                      color:
                                                                          dark2),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  20.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 18.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final homestayTerms =
                                                                    getJsonField(
                                                                  homestayDataSearchItem,
                                                                  r'''$.terms_by_attribute_in_listing_page''',
                                                                ).toList();
                                                                return homestayTerms
                                                                        .isNotEmpty
                                                                    ? ListView
                                                                        .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            homestayTerms.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                homestayTermsIndex) {
                                                                          final homestayTermsItem =
                                                                              homestayTerms[homestayTermsIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 80.0,
                                                                              height: 150.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      '${getJsonField(
                                                                                        homestayTermsItem,
                                                                                        r'''$.name''',
                                                                                      ).toString()}',
                                                                                      style: regular10.copyWith(color: dark2),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      )
                                                                    : Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              150.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                2.0,
                                                                                2.0,
                                                                                2.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  'Tidak ada fasilitas tersedia',
                                                                                  style: regular10.copyWith(color: dark2),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  StyledDivider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                    lineStyle:
                                                        DividerLineStyle.dotted,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          if (getJsonField(
                                                                homestayDataSearchItem,
                                                                r'''$.sale_price''',
                                                              ) !=
                                                              null)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                formatNumber(
                                                                  double.parse(
                                                                      getJsonField(
                                                                    homestayDataSearchItem,
                                                                    r'''$.price''',
                                                                  ).toString()),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency:
                                                                      'Rp ',
                                                                ),
                                                                style: semibold14
                                                                    .copyWith(
                                                                        color:
                                                                            red1),
                                                              ),
                                                            ),
                                                          if (getJsonField(
                                                                homestayDataSearchItem,
                                                                r'''$.sale_price''',
                                                              ) !=
                                                              null)
                                                            Text(
                                                              formatNumber(
                                                                double.parse(
                                                                    getJsonField(
                                                                  homestayDataSearchItem,
                                                                  r'''$.price''',
                                                                ).toString()),
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .commaDecimal,
                                                                currency: 'Rp ',
                                                              ),
                                                              style: semibold14
                                                                  .copyWith(
                                                                      color:
                                                                          red1),
                                                            ),
                                                          Text(
                                                            formatNumber(
                                                              double.parse(
                                                                  getJsonField(
                                                                homestayDataSearchItem,
                                                                r'''$.price''',
                                                              ).toString()),
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                              currency: 'Rp ',
                                                            ),
                                                            style: semibold14
                                                                .copyWith(
                                                                    color:
                                                                        red1),
                                                          ),
                                                          Text(
                                                            '/Kamar /Malam (termasuk pajak)',
                                                            style: regular10
                                                                .copyWith(
                                                                    color:
                                                                        dark2),
                                                          ),
                                                        ],
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
                                  );
                                }),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
