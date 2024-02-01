import 'dart:async';

import 'package:get/get.dart';
import 'package:kelotimaja/backend/api_requests/api_calls.dart';
import 'package:kelotimaja/components/ubah_data_tiket_widget.dart';
import 'package:kelotimaja/main.dart';
import 'package:kelotimaja/search_filter/search.dart';
import 'package:kelotimaja/tiket_wisata/beli_tiket_wisata/beli_tiket_wisata_widget.dart';

import '../../theme.dart';
import '/tiket_wisata/detail_wisata/detail_wisata_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'list_tiket_wisata_model.dart';
export 'list_tiket_wisata_model.dart';

class ListTiketWisataWidget extends StatefulWidget {
  const ListTiketWisataWidget({
    Key? key,
    this.locationName,
    this.locationId,
    this.startDate,
  }) : super(key: key);
  final String? locationName;
  final String? locationId;
  final String? startDate;

  @override
  _ListTiketWisataWidgetState createState() => _ListTiketWisataWidgetState();
}

class _ListTiketWisataWidgetState extends State<ListTiketWisataWidget> {
  late ListTiketWisataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListTiketWisataModel());
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
    DateTime now = DateTime.now();
    String formattedNow = DateFormat('yyyy-MM-dd').format(now);
    // int locId = int.parse(widget.locationId!);
    print(widget.startDate);
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => NavBarPage(initialPage: 'Home_Page'));
        return true;
      },
      // onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        // endDrawer: Container(
        //   width: 100,
        //   child: Drawer(
        //     elevation: 16,
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).accent1,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 54,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24,
            ),
            onPressed: () async {
              // Navigator.pop(context);
              Get.off(() => NavBarPage(initialPage: 'Home_Page'));
            },
          ),
          title: Text(
            'Tiket Wisata',
            style: bold16.copyWith(color: white),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            onRefresh: () async {
              print('refresh bawah');
              // setState(
              //     () => _model.apiRequestCompleter = null);
              // await _model.waitForApiRequestCompleted();
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              Get.to(() => SearchPage());
                            },
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xB5EEEEEE),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Cari tempat wisata',
                                          style: regular12_5.copyWith(
                                              color: dark2),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
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
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 20, 0),
                        child: Text(
                          widget.locationName != null
                              ? 'Tempat Wisata Populer Di ${widget.locationName}'
                              : 'Semua Tempat Wisata Populer',
                          style: semibold14.copyWith(color: dark1),
                        ),
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??= Completer<
                                ApiCallResponse>()
                              ..complete(
                                  // TiketWisataGroup.getTiketWisataCall.call()

                                  widget.locationId == null &&
                                          widget.startDate == null
                                      ? TiketWisataGroup.getTiketWisataCall
                                          .call()
                                      : TiketWisataGroup.filterTiketWisataCall
                                          .call(
                                          startDate: widget.startDate,
                                          loc_id: int.parse(widget.locationId!),
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).tertiary400,
                                  ),
                                ),
                              ),
                            );
                          }
                          final columnTourListResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final jsonBody = columnTourListResponse.jsonBody;
                              if (jsonBody == null) {
                                // Handle the case when jsonBody is null (e.g., show an error message)
                                return Center(
                                  child: Text("koneksi tidak stabil"),
                                );
                              }
                              final dataTiket = EventGroup.eventListCall
                                      .dataTour(
                                        columnTourListResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              // Filter out items with price equal to 0
                              final filteredDataTiket = dataTiket.where((item) {
                                final price =
                                    double.tryParse(item['price'] ?? "0");
                                return price != null && price != 0.0;
                              }).toList();
                              return RefreshIndicator(
                                onRefresh: () async {
                                  setState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(filteredDataTiket.length,
                                          (filteredDataTiketIndex) {
                                    final filteredDataTiketItem =
                                        filteredDataTiket[
                                            filteredDataTiketIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 12),
                                      child: InkWell(
                                        onTap: () async {
                                          DateTime? startDate =
                                              FFAppState().startDate;

                                          String formattedStartDate =
                                              startDate != null
                                                  ? DateFormat('yyyy-MM-dd')
                                                      .format(startDate)
                                                  : formattedNow;

                                          Get.to(() => BeliTiketWisataWidget(
                                                dataTiket:
                                                    filteredDataTiketItem,
                                                startDate: formattedStartDate,
                                              ));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 7,
                                                color: Color(0x2F1D2429),
                                                offset: Offset(0, 3),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 12, 12, 12),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.network(
                                                        getJsonField(
                                                          filteredDataTiketItem,
                                                          r'''$.banner''',
                                                        )["400x350"],
                                                        width: double.infinity,
                                                        height: 160,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              filteredDataTiketItem,
                                                              r'''$.title''',
                                                            ).toString(),
                                                            style: semibold14
                                                                .copyWith(
                                                                    color:
                                                                        dark2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            getJsonField(
                                                              filteredDataTiketItem,
                                                              r'''$.location.name''',
                                                            ).toString(),
                                                            style: regular12_5
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
                      )
                    ],
                  ),

                  // Generated code for this Column Widget...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
