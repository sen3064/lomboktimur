import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'custom_makanan_model.dart';
export 'custom_makanan_model.dart';

class CustomMakananWidget extends StatefulWidget {
  const CustomMakananWidget({
    Key? key,
    required this.makananJson,
  }) : super(key: key);

  final dynamic makananJson;

  @override
  _CustomMakananWidgetState createState() => _CustomMakananWidgetState();
}

class _CustomMakananWidgetState extends State<CustomMakananWidget> {
  late CustomMakananModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomMakananModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    var result = getJsonField(widget.makananJson, r'''$.variants[:]''');
    // print(result);
    if (result is List<Map<String, dynamic>>) {
      List<Map<String, dynamic>> variants =
          List<Map<String, dynamic>>.from(result);
      // Sekarang Anda memiliki daftar produk dalam 'variants'
      // Lakukan apa yang diperlukan dengan daftar ini.
      // Contoh: Cetak nama produk dari setiap elemen
      for (var product in variants) {
        print(product['name']);
        // List<String> options = product
        //     .map<String>((variant) => "${variant['name']}, ${variant['price']}")
        //     .toList();
      }
    } else {
      print('Format data tidak sesuai dengan ekspektasi.');
    }

    // List<Map<String, dynamic>> variants = (getJsonField(
    //   widget.makananJson,
    //   r'''$.variants[:]''',
    // ) as List)
    //     .cast<Map<String, dynamic>>();

    // print(widget.makananJson);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 150),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Tambah Variasi',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      getJsonField(
                                        widget.makananJson,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Generated code for this Text Widget...
                                Text(
                                  formatNumber(
                                    double.parse(getJsonField(
                                      widget.makananJson,
                                      r'''$.price''',
                                    ).toString()),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.commaDecimal,
                                    currency: 'Rp ',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilih Satu',
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Builder(
                                builder: (context) {
                                  final makananVariants = getJsonField(
                                    widget.makananJson,
                                    r'''$.variants''',
                                  ).toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(makananVariants.length,
                                            (makananVariantsIndex) {
                                      final makananVariantsItem =
                                          makananVariants[makananVariantsIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(-1, -1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Text(
                                                  getJsonField(
                                                    makananVariantsItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Text(
                                                formatNumber(
                                                  double.parse(getJsonField(
                                                    makananVariantsItem,
                                                    r'''$.price''',
                                                  ).toString()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'Rp ',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValueMap![
                                                      makananVariantsItem] ??
                                                  false,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _model.checkboxValueMap!
                                                      .forEach((key, value) {
                                                    if (key !=
                                                        makananVariantsItem) {
                                                      _model.checkboxValueMap![
                                                          key] = false;
                                                    }
                                                  });
                                                  _model.checkboxValueMap![
                                                          makananVariantsItem] =
                                                      newValue!;
                                                });
                                                print(_model.checkboxValueMap);
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary400,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              tristate: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                            spreadRadius: 4,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().update(() {
                                      FFAppState().addMakananToJson ??=
                                          []; // Inisialisasi jika null

                                      bool isAdd = true;
                                      for (int i = 0;
                                          i <
                                              FFAppState()
                                                  .addMakananToJson
                                                  .length;
                                          i++) {
                                        if (FFAppState().addMakananToJson[i]
                                                ['id'] ==
                                            _model.checkboxCheckedItems
                                                .first['product_id']) {
                                          if (widget.makananJson[i]
                                                  ['product_id'] ==
                                              null) {
                                            FFAppState().update(() {
                                              // Jika item sudah ada dalam keranjang, tambahkan jumlahnya
                                              FFAppState().addMakananToJson[i]
                                                  ['quantity'] = (FFAppState()
                                                              .addMakananToJson[
                                                          i]['quantity'] ??
                                                      0) +
                                                  1;
                                              isAdd = false;
                                            });
                                          }
                                        }
                                      }

                                      if (isAdd) {
                                        Map<String, dynamic>
                                            newCartCustomItems = Map.from(_model
                                                .checkboxCheckedItems.first);
                                        newCartCustomItems['quantity'] = 1;

                                        FFAppState()
                                            .addMakananToJson
                                            .add(newCartCustomItems);
                                      }
                                      // FFAppState().addToAddMakananToJson(
                                      //     _model.checkboxCheckedItems.first);
                                    });
                                    Navigator.pop(context);
                                  },
                                  // print(FFAppState().addMakananToJson);
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Tambah Item',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Icon(
                                          Icons.horizontal_rule,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 15,
                                        ),
                                      ),
                                      Text(
                                        '${FFAppState().addMakananToJson.length.toString()} Item',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
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
                              ),
                            ),
                          ],
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
