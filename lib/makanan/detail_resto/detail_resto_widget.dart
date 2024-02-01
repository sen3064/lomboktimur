import 'package:kelotimaja/components/ganti_pesanan_widget.dart';
import 'package:kelotimaja/theme.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/buy_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/components/makanan_sheet_widget.dart';
import '/makanan/custom_makanan/custom_makanan_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/makanan/list_pesanan_makanan/list_pesanan_makanan_widget.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_resto_model.dart';
export 'detail_resto_model.dart';

class DetailRestoWidget extends StatefulWidget {
  const DetailRestoWidget({
    Key? key,
    required this.createUser,
    required this.dataToko,
  }) : super(key: key);

  final int? createUser;
  final dynamic dataToko;

  @override
  _DetailRestoWidgetState createState() => _DetailRestoWidgetState();
}

class _DetailRestoWidgetState extends State<DetailRestoWidget> {
  late DetailRestoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailRestoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    print(widget.dataToko);
    return WillPopScope(
      onWillPop: () async => await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () =>
                FocusScope.of(context).requestFocus(_model.unfocusNode),
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: GantiPesananWidget(),
            ),
          );
        },
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 345,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 241,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder: NetworkImage(
                                    'https://cdn2.iconfinder.com/data/icons/building-vol-2/512/restaurant-512.png'),
                                image: NetworkImage(
                                  getJsonField(
                                    widget.dataToko,
                                    r'''$.banner''',
                                  ),
                                ),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.network(
                                    'https://cdn2.iconfinder.com/data/icons/building-vol-2/512/restaurant-512.png',
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),

                            // Generated code for this Container Widget...
                            // Generated code for this Container Widget...
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: 130,
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
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 15, 20, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (getJsonField(widget.dataToko,
                                                r'''$.business_name''') !=
                                            null)
                                          Text(
                                            getJsonField(
                                              widget.dataToko,
                                              r'''$.business_name''',
                                            ).toString(),
                                            style:
                                                bold16.copyWith(color: dark1),
                                          ),
                                        if (getJsonField(widget.dataToko,
                                                r'''$.business_name''') ==
                                            null)
                                          Text(
                                            getJsonField(
                                              widget.dataToko,
                                              r'''$.name''',
                                            ).toString(),
                                            style:
                                                bold16.copyWith(color: dark1),
                                          ),
                                        Text(
                                          '${getJsonField(
                                            widget.dataToko,
                                            r'''$.address''',
                                          ).toString()}',
                                          style: regular12_5.copyWith(
                                              color: dark2),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              color: Colors.yellow,
                                              size: 15,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                getJsonField(widget.dataToko,
                                                        r'''$.review''')
                                                    .toString(),
                                                style: regular10.copyWith(
                                                    color: dark2),
                                              ),
                                            ),
                                            if (getJsonField(widget.dataToko,
                                                    r'''$.review''') ==
                                                null)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  '(Belum ada review)',
                                                  style: regular10.copyWith(
                                                      color: dark2),
                                                ),
                                              ),
                                          ],
                                        ),
                                        StyledDivider(
                                          thickness: 1,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          lineStyle: DividerLineStyle.dotted,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 20,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '${getJsonField(widget.dataToko, r'''$.open_hour''')}'
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r':00$'),
                                                                    ''),
                                                        style:
                                                            regular10.copyWith(
                                                                color: dark2),
                                                      ),
                                                      TextSpan(
                                                        text: '-',
                                                        style:
                                                            regular10.copyWith(
                                                                color: dark2),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '${getJsonField(widget.dataToko, r'''$.close_hour''')}'
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r':00$'),
                                                                    ''),
                                                        style:
                                                            regular10.copyWith(
                                                                color: dark2),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                                child: VerticalDivider(
                                                  thickness: 1,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '${getJsonField(widget.dataToko, r'''$.location_name''')}',
                                                        style:
                                                            regular10.copyWith(
                                                                color: dark2),
                                                      ),
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                              // Icon(
                                              //   Icons.location_on,
                                              //   color:
                                              //       FlutterFlowTheme.of(context)
                                              //           .secondary,
                                              //   size: 20,
                                              // ),
                                              // Padding(
                                              //   padding: EdgeInsetsDirectional
                                              //       .fromSTEB(5, 0, 0, 0),
                                              //   child: RichText(
                                              //     text: TextSpan(
                                              //       children: [
                                              //         TextSpan(
                                              //           text: '1 Km',
                                              //           style:
                                              //               FlutterFlowTheme.of(
                                              //                       context)
                                              //                   .bodySmall
                                              //                   .override(
                                              //                     fontFamily: FlutterFlowTheme.of(
                                              //                             context)
                                              //                         .bodySmallFamily,
                                              //                     color: FlutterFlowTheme.of(
                                              //                             context)
                                              //                         .secondary,
                                              //                     useGoogleFonts: GoogleFonts
                                              //                             .asMap()
                                              //                         .containsKey(
                                              //                             FlutterFlowTheme.of(context)
                                              //                                 .bodySmallFamily),
                                              //                   ),
                                              //         )
                                              //       ],
                                              //       style: FlutterFlowTheme.of(
                                              //               context)
                                              //           .bodyMedium,
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 40,
                                      buttonSize: 40,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      icon: Icon(
                                        Icons.arrow_back_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                              child: Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: GantiPesananWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            setState(() =>
                                                FFAppState().trueFalse =
                                                    !FFAppState().trueFalse);
                                          },
                                          value: FFAppState().trueFalse,
                                          onIcon: Icon(
                                            Icons.favorite_border,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.favorite_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 25,
                                          ),
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
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Makanan',
                                    style: bold16.copyWith(color: dark1),
                                  )
                                ],
                              ),
                            ),
                            StyledDivider(
                              thickness: 1,
                              color: FlutterFlowTheme.of(context).accent4,
                              lineStyle: DividerLineStyle.dotted,
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: _model.listMakanan(
                                requestFn: () =>
                                    MakananMinumanGroup.filterMakananCall.call(
                                  createUser: widget.createUser,
                                  sid: 8,
                                ),
                              ),
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
                                final columnFilterMakananResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final jsonBody =
                                        columnFilterMakananResponse.jsonBody;
                                    if (jsonBody == null) {
                                      // Handle the case when jsonBody is null (e.g., show an error message)
                                      return Center(
                                        child: Text("koneksi tidak stabil"),
                                      );
                                    }
                                    final filterMakanan =
                                        columnFilterMakananResponse.jsonBody
                                            .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(filterMakanan.length,
                                              (filterMakananIndex) {
                                        final filterMakananItem =
                                            filterMakanan[filterMakananIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 20, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(_model
                                                                    .unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child:
                                                                  MakananSheetWidget(
                                                                makananJson:
                                                                    filterMakananItem,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            child:
                                                                Image.network(
                                                              getJsonField(
                                                                filterMakananItem,
                                                                r'''$.banner''',
                                                              )['400x350'],
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    filterMakananItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  style: bold16
                                                                      .copyWith(
                                                                          color:
                                                                              dark1),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    filterMakananItem,
                                                                    r'''$.description''',
                                                                  ).toString(),
                                                                  style: regular14
                                                                      .copyWith(
                                                                          color:
                                                                              dark2),
                                                                ),
                                                                Text(
                                                                  '${getJsonField(
                                                                    filterMakananItem,
                                                                    r'''$.total_sales''',
                                                                  ).toString()} terjual',
                                                                  style: regular12_5
                                                                      .copyWith(
                                                                          color:
                                                                              dark2),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          10),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                        child:
                                                                            Text(
                                                                          formatNumber(
                                                                            double.parse(getJsonField(
                                                                              filterMakananItem,
                                                                              r'''$.price''',
                                                                            ).toString()),
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.commaDecimal,
                                                                            currency:
                                                                                'Rp ',
                                                                          ),
                                                                          style:
                                                                              semibold14.copyWith(color: red1),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 5, 5),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        if (getJsonField(
                                                              filterMakananItem,
                                                              r'''$.variants[:]''',
                                                            ) !=
                                                            null)
                                                          InkWell(
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          CustomMakananWidget(
                                                                    makananJson:
                                                                        filterMakananItem,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            21),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Text(
                                                                  'Tambah',
                                                                  style: semibold14
                                                                      .copyWith(
                                                                          color:
                                                                              red1),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              filterMakananItem,
                                                              r'''$.variants[:]''',
                                                            ) ==
                                                            null)
                                                          InkWell(
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                        .addMakananToJson ??=
                                                                    []; // Inisialisasi jika null

                                                                bool isAdd =
                                                                    true;
                                                                for (int i = 0;
                                                                    i <
                                                                        FFAppState()
                                                                            .addMakananToJson
                                                                            .length;
                                                                    i++) {
                                                                  if (FFAppState()
                                                                              .addMakananToJson[i]
                                                                          [
                                                                          'id'] ==
                                                                      filterMakananItem[
                                                                          'id']) {
                                                                    setState(
                                                                        () {
                                                                      // Jika item sudah ada dalam keranjang, tambahkan jumlahnya
                                                                      FFAppState()
                                                                              .addMakananToJson[i]
                                                                          [
                                                                          'quantity'] = (FFAppState().addMakananToJson[i]['quantity'] ??
                                                                              0) +
                                                                          1;
                                                                      isAdd =
                                                                          false;
                                                                    });
                                                                    break;
                                                                  }
                                                                }

                                                                if (isAdd) {
                                                                  Map<String,
                                                                          dynamic>
                                                                      newCartItem =
                                                                      Map.from(
                                                                          filterMakananItem);
                                                                  newCartItem
                                                                      .remove(
                                                                          'variants');
                                                                  newCartItem[
                                                                      'quantity'] = 1;
                                                                  FFAppState()
                                                                      .addMakananToJson
                                                                      .add(
                                                                          newCartItem);
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            21),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Text(
                                                                  'Tambah',
                                                                  style: semibold14
                                                                      .copyWith(
                                                                          color:
                                                                              red1),
                                                                ),
                                                              ),
                                                            ),
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
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 10,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Menu Paket',
                                    style: bold16.copyWith(color: dark1),
                                  ),
                                ],
                              ),
                            ),
                            StyledDivider(
                              thickness: 1,
                              color: FlutterFlowTheme.of(context).accent4,
                              lineStyle: DividerLineStyle.dotted,
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future:
                                  MakananMinumanGroup.filterMakananCall.call(
                                createUser: getJsonField(
                                  widget.dataToko,
                                  r'''$.create_user''',
                                ),
                                sid: 10,
                              ),
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
                                final columnFilterPaketResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final jsonBody =
                                        columnFilterPaketResponse.jsonBody;
                                    if (jsonBody == null) {
                                      // Handle the case when jsonBody is null (e.g., show an error message)
                                      return Center(
                                        child: Text("koneksi tidak stabil"),
                                      );
                                    }
                                    final filterMenupaket =
                                        columnFilterPaketResponse.jsonBody
                                            .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(filterMenupaket.length,
                                              (filterMenupaketIndex) {
                                        final filterMenupaketItem =
                                            filterMenupaket[
                                                filterMenupaketIndex];
                                        return // Generated code for this Container Widget...
                                            Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 20, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(_model
                                                                    .unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Scaffold(
                                                                body:
                                                                    GestureDetector(
                                                                  onTap: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                ),
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                bottomSheet:
                                                                    MakananSheetWidget(
                                                                  makananJson:
                                                                      filterMenupaketItem,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            child:
                                                                Image.network(
                                                              getJsonField(
                                                                filterMenupaketItem,
                                                                r'''$.banner''',
                                                              )['400x350'],
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      filterMenupaketItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    style: semibold12_5
                                                                        .copyWith(
                                                                            color:
                                                                                dark2),
                                                                  ),
                                                                  Text(
                                                                    getJsonField(
                                                                      filterMenupaketItem,
                                                                      r'''$.description''',
                                                                    ).toString(),
                                                                    style: regular14
                                                                        .copyWith(
                                                                            color:
                                                                                dark2),
                                                                  ),
                                                                  Text(
                                                                    '${getJsonField(
                                                                      filterMenupaketItem,
                                                                      r'''$.total_sales''',
                                                                    ).toString()} terjual',
                                                                    style: regular12_5
                                                                        .copyWith(
                                                                            color:
                                                                                dark2),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              1),
                                                                          child:
                                                                              Text(
                                                                            formatNumber(
                                                                              double.parse(getJsonField(
                                                                                filterMenupaketItem,
                                                                                r'''$.price''',
                                                                              ).toString()),
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.commaDecimal,
                                                                              currency: 'Rp ',
                                                                            ),
                                                                            style:
                                                                                semibold14.copyWith(color: red1),
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
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        if (getJsonField(
                                                              filterMenupaketItem,
                                                              r'''$.variants[:]''',
                                                            ) !=
                                                            null)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            CustomMakananWidget(
                                                                      makananJson:
                                                                          filterMenupaketItem,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              21),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              'Tambah',
                                                                          style:
                                                                              semibold14.copyWith(color: red1),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              filterMenupaketItem,
                                                              r'''$.variants[:]''',
                                                            ) ==
                                                            null)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .addMakananToJson ??=
                                                                      []; // Inisialisasi jika null

                                                                  bool isAdd =
                                                                      true;
                                                                  for (int i =
                                                                          0;
                                                                      i <
                                                                          FFAppState()
                                                                              .addMakananToJson
                                                                              .length;
                                                                      i++) {
                                                                    if (FFAppState().addMakananToJson[i]
                                                                            [
                                                                            'id'] ==
                                                                        filterMenupaketItem[
                                                                            'id']) {
                                                                      setState(
                                                                          () {
                                                                        // Jika item sudah ada dalam keranjang, tambahkan jumlahnya
                                                                        FFAppState().addMakananToJson[i]
                                                                            [
                                                                            'quantity'] = (FFAppState().addMakananToJson[i]['quantity'] ??
                                                                                0) +
                                                                            1;
                                                                        isAdd =
                                                                            false;
                                                                      });
                                                                      break;
                                                                    }
                                                                  }

                                                                  if (isAdd) {
                                                                    Map<String,
                                                                            dynamic>
                                                                        newCartPaketItem =
                                                                        Map.from(
                                                                            filterMenupaketItem);
                                                                    newCartPaketItem
                                                                        .remove(
                                                                            'variants');
                                                                    newCartPaketItem[
                                                                        'quantity'] = 1;
                                                                    FFAppState()
                                                                        .addMakananToJson
                                                                        .add(
                                                                            newCartPaketItem);
                                                                  }
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              21),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      RichText(
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              'Tambah',
                                                                          style:
                                                                              semibold14.copyWith(color: red1),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 10,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Minuman',
                                  style: bold16.copyWith(color: dark1),
                                ),
                              ],
                            ),
                          ),
                          StyledDivider(
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).accent4,
                            lineStyle: DividerLineStyle.dotted,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: MakananMinumanGroup.filterMakananCall
                                      .call(
                                    createUser: getJsonField(
                                      widget.dataToko,
                                      r'''$.create_user''',
                                    ),
                                    sid: 9,
                                  ),
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
                                    final columnFilterMinumanResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final jsonBody =
                                            columnFilterMinumanResponse
                                                .jsonBody;
                                        if (jsonBody == null) {
                                          // Handle the case when jsonBody is null (e.g., show an error message)
                                          return Center(
                                            child: Text("koneksi tidak stabil"),
                                          );
                                        }
                                        final filterMinuman =
                                            columnFilterMinumanResponse.jsonBody
                                                .toList();
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              filterMinuman.length,
                                              (filterMinumanIndex) {
                                            final filterMinumanItem =
                                                filterMinuman[
                                                    filterMinumanIndex];
                                            return // Generated code for this Container Widget...
                                                Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(21),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode),
                                                                child: Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Scaffold(
                                                                    body:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          Navigator.pop(
                                                                              context),
                                                                    ),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    bottomSheet:
                                                                        MakananSheetWidget(
                                                                      makananJson:
                                                                          filterMinumanItem,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    filterMinumanItem,
                                                                    r'''$.banner''',
                                                                  )['400x350'],
                                                                  width: 100,
                                                                  height: 100,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 1),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          filterMinumanItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        style: semibold12_5.copyWith(
                                                                            color:
                                                                                dark2),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          filterMinumanItem,
                                                                          r'''$.description''',
                                                                        ).toString(),
                                                                        style: regular14.copyWith(
                                                                            color:
                                                                                dark2),
                                                                      ),
                                                                      Text(
                                                                        '${getJsonField(
                                                                          filterMinumanItem,
                                                                          r'''$.total_sales''',
                                                                        ).toString()} terjual',
                                                                        style: regular12_5.copyWith(
                                                                            color:
                                                                                dark2),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            10),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0, 1),
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  double.parse(getJsonField(
                                                                                    filterMinumanItem,
                                                                                    r'''$.price''',
                                                                                  ).toString()),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.commaDecimal,
                                                                                  currency: 'Rp ',
                                                                                ),
                                                                                style: semibold14.copyWith(color: red1),
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
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    5, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            if (getJsonField(
                                                                  filterMinumanItem,
                                                                  r'''$.variants[:]''',
                                                                ) !=
                                                                null)
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              CustomMakananWidget(
                                                                        makananJson:
                                                                            filterMinumanItem,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            21),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Tambah',
                                                                      style: semibold14.copyWith(
                                                                          color:
                                                                              red1),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (getJsonField(
                                                                  filterMinumanItem,
                                                                  r'''$.variants[:]''',
                                                                ) ==
                                                                null)
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .addMakananToJson ??=
                                                                        []; // Inisialisasi jika null

                                                                    bool isAdd =
                                                                        true;
                                                                    for (int i =
                                                                            0;
                                                                        i < FFAppState().addMakananToJson.length;
                                                                        i++) {
                                                                      if (FFAppState().addMakananToJson[i]
                                                                              [
                                                                              'id'] ==
                                                                          filterMinumanItem[
                                                                              'id']) {
                                                                        setState(
                                                                            () {
                                                                          // Jika item sudah ada dalam keranjang, tambahkan jumlahnya
                                                                          FFAppState().addMakananToJson[i]
                                                                              [
                                                                              'quantity'] = (FFAppState().addMakananToJson[i]['quantity'] ??
                                                                                  0) +
                                                                              1;
                                                                          isAdd =
                                                                              false;
                                                                        });
                                                                        break;
                                                                      }
                                                                    }

                                                                    if (isAdd) {
                                                                      Map<String,
                                                                              dynamic>
                                                                          newCartMinumanItem =
                                                                          Map.from(
                                                                              filterMinumanItem);
                                                                      newCartMinumanItem
                                                                          .remove(
                                                                              'variants');
                                                                      newCartMinumanItem[
                                                                          'quantity'] = 1;
                                                                      FFAppState()
                                                                          .addMakananToJson
                                                                          .add(
                                                                              newCartMinumanItem);
                                                                    }
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Tambah',
                                                                      style: semibold14.copyWith(
                                                                          color:
                                                                              red1),
                                                                    ),
                                                                  ),
                                                                ),
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
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ListPesananMakananWidget(
                                          dataToko: widget.dataToko,
                                        ),
                                      ),
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.buyItemModel,
                                    updateCallback: () => setState(() {}),
                                    child: BuyItemWidget(),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
