import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../theme.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/ubah_data_booking_backup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/penginapan/detail_penginapan/detail_penginapan_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'list_penginapan_model.dart';
export 'list_penginapan_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class ListPenginapanWidget extends StatefulWidget {
  const ListPenginapanWidget({Key? key}) : super(key: key);

  @override
  _ListPenginapanWidgetState createState() => _ListPenginapanWidgetState();
}

class _ListPenginapanWidgetState extends State<ListPenginapanWidget> {
  late ListPenginapanModel _model;
  late bool _isLoading;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
    _model = createModel(context, () => ListPenginapanModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    DateTime checkin = DateTime.now().add(Duration(days: 1));
    String formattedStartdate = DateFormat('d/M/y').format(checkin);
    DateTime checkout = DateTime.now().add(Duration(days: 2));
    String formattedEndate = DateFormat('d/M/y').format(checkout);
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
            setState(() => _model.listViewPagingController1?.refresh());
            await _model.waitForOnePage();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).accent1,
              toolbarHeight: 80,
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
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Semua Lokasi',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        functions.viewDate(functions
                                            .formatDate(formattedStartdate)),
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
                                        functions.viewDate(functions
                                            .formatDate(formattedEndate)),
                                        'null',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 10.0,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily,
                                        ),
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 15.0,
                              ),
                              Text(
                                '1 Kamar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 10.0,
                                      useGoogleFonts:
                                          GoogleFonts.asMap().containsKey(
                                        FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                      ),
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 15.0,
                              ),
                              Expanded(
                                child: Text(
                                  '2 Tamu',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 10.0,
                                        useGoogleFonts:
                                            GoogleFonts.asMap().containsKey(
                                          FlutterFlowTheme.of(context)
                                              .bodyMediumFamily,
                                        ),
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
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
                                    startDate: formattedStartdate,
                                    endDate: formattedEndate,
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
                  ),
                ],
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Murah Setiap Hari',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily),
                                            ),
                                      ),
                                      Text(
                                        'Nginep murah setiap hari mulai dari 150rb aja ',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily),
                                            ),
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
                    //
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 10.0),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          setState(() =>
                              _model.listViewPagingController1?.refresh());
                          await _model.waitForOnePage();
                        },
                        child: PagedListView<ApiPagingParams, dynamic>(
                          pagingController: _model.setListViewController1(
                            (nextPageMarker) =>
                                HomestayGroup.homestayListCall.call(
                              accessToken: FFAppState().accessToken,
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
                            firstPageProgressIndicatorBuilder: (_) => Column(
                              children: [
                                loadingCard(),
                                SizedBox(
                                  height: 20,
                                ),
                                loadingCard(),
                                SizedBox(
                                  height: 20,
                                ),
                                loadingCard(),
                              ],
                            ),
                            itemBuilder: (context, _, homestayDataIndex) {
                              final homestayDataItem = _model
                                  .listViewPagingController1!
                                  .itemList![homestayDataIndex];
                              final title = homestayDataItem['title'];
                              final gallery = homestayDataItem['gallery'];
                              if (title == null ||
                                  (gallery == null ||
                                      (gallery as List).isEmpty)) {
                                return Container();
                              }
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPenginapanWidget(
                                                    hid: getJsonField(
                                                      homestayDataItem,
                                                      r'''$.id''',
                                                    ).toString(),
                                                    homestayData:
                                                        homestayDataItem,
                                                    startDate:
                                                        valueOrDefault<String>(
                                                      functions.formatDate(
                                                          formattedStartdate),
                                                      'null',
                                                    ),
                                                    endDate:
                                                        valueOrDefault<String>(
                                                      functions.formatDate(
                                                          formattedEndate),
                                                      'null',
                                                    ),
                                                    rooms: '1',
                                                    guests: '2',
                                                    terms: getJsonField(
                                                      homestayDataItem,
                                                      r'''$.terms_by_attribute_in_listing_page''',
                                                    ),
                                                    mapLat: double.parse(
                                                        getJsonField(
                                                      homestayDataItem,
                                                      r'''$.map_lat''',
                                                    ).toString()),
                                                    mapLng: double.parse(
                                                        getJsonField(
                                                      homestayDataItem,
                                                      r'''$.map_lng''',
                                                    ).toString()),
                                                    locationLatLng: functions
                                                        .locationLatLng(
                                                      double.parse(
                                                        getJsonField(
                                                          homestayDataItem,
                                                          r'''$.map_lat''',
                                                        ).toString(),
                                                      ),
                                                      double.parse(
                                                        getJsonField(
                                                          homestayDataItem,
                                                          r'''$.map_lng''',
                                                        ).toString(),
                                                      ),
                                                    )!,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 170.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 7.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final galleryData =
                                                            getJsonField(
                                                          homestayDataItem,
                                                          r'''$.gallery''',
                                                        ).toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: galleryData
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
                                                              child: Container(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 2, 10, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          getJsonField(
                                                            homestayDataItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: semibold12_5
                                                              .copyWith(
                                                                  color: dark2),
                                                        ),
                                                      ),
                                                      if (getJsonField(
                                                                homestayDataItem,
                                                                r'''$.review_score''',
                                                              ) !=
                                                              "0.0" ||
                                                          getJsonField(
                                                                homestayDataItem,
                                                                r'''$.review_score''',
                                                              ) !=
                                                              null)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 15,
                                                            ),
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
                                                                  homestayDataItem,
                                                                  r'''$.review_score''',
                                                                ).toString(),
                                                                style: regular10
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                            ),
                                                            if (getJsonField(
                                                                      homestayDataItem,
                                                                      r'''$.review_score''',
                                                                    ) ==
                                                                    "0.0" ||
                                                                getJsonField(
                                                                      homestayDataItem,
                                                                      r'''$.review_score''',
                                                                    ) ==
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
                                                                  '(Belum ada review)',
                                                                  style: regular10
                                                                      .copyWith(
                                                                          color:
                                                                              dark2),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.verified_user,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                              homestayDataItem,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.location_pin,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                              homestayDataItem,
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
                                                          height: 35.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final homestayTerms =
                                                                  getJsonField(
                                                                homestayDataItem,
                                                                r'''$.terms_by_attribute_in_listing_page''',
                                                              ).toList();
                                                              return homestayTerms
                                                                      .isNotEmpty
                                                                  ? ListView
                                                                      .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      itemCount:
                                                                          homestayTerms
                                                                              .length,
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
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                child: Text(
                                                                                  '${getJsonField(
                                                                                    homestayTermsItem,
                                                                                    r'''$.name''',
                                                                                  ).toString()}',
                                                                                  style: regular10.copyWith(color: dark2),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    )
                                                                  : Container(
                                                                      width:
                                                                          80.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
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
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'Tidak ada fasilitas tersedia',
                                                                              style: regular10.copyWith(color: dark2),
                                                                            ),
                                                                          ],
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
                                                SizedBox(
                                                  height: 10,
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
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        if (getJsonField(
                                                              homestayDataItem,
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
                                                                  homestayDataItem,
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
                                                          ),
                                                        if (getJsonField(
                                                              homestayDataItem,
                                                              r'''$.sale_price''',
                                                            ) !=
                                                            null)
                                                          Text(
                                                            formatNumber(
                                                              double.parse(
                                                                  getJsonField(
                                                                homestayDataItem,
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
                                                        if (getJsonField(
                                                              homestayDataItem,
                                                              r'''$.sale_price''',
                                                            ) ==
                                                            null)
                                                          if (getJsonField(
                                                                  homestayDataItem,
                                                                  r'''$.price''') !=
                                                              0)
                                                            Text(
                                                              formatNumber(
                                                                double.parse(
                                                                    getJsonField(
                                                                  homestayDataItem,
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
                                                        if (getJsonField(
                                                                homestayDataItem,
                                                                r'''$.price''') ==
                                                            0)
                                                          Text(
                                                            'Tidak ada kamar tersedia',
                                                            style: semibold12_5
                                                                .copyWith(
                                                                    color:
                                                                        dark2),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            '/Kamar /Malam (termasuk pajak)',
                                                            style: regular10
                                                                .copyWith(
                                                                    color:
                                                                        dark2),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        )
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
                                ),
                              );
                            },
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
