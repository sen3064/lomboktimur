import 'dart:convert';

import 'package:get/get.dart';
import 'package:kelotimaja/makanan/detail_resto/detail_resto_widget.dart';
import 'package:kelotimaja/theme.dart';

import '/components/pilih_tanggal_pesan_widget.dart';
import '/components/wishlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/transportasi/detail_transpotasi_mobil/detail_transpotasi_mobil_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_pencarian_makanan_model.dart';
export 'list_pencarian_makanan_model.dart';

class ListPencarianMakananWidget extends StatefulWidget {
  const ListPencarianMakananWidget({Key? key, this.searchData, this.keyData})
      : super(key: key);
  final String? searchData;
  final dynamic keyData;

  @override
  _ListPencarianMakananWidgetState createState() =>
      _ListPencarianMakananWidgetState();
}

class _ListPencarianMakananWidgetState
    extends State<ListPencarianMakananWidget> {
  late ListPencarianMakananModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPencarianMakananModel());
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
          print('refresh');
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
              ),
              title: Text(
                "Pencarian Makanan",
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 10, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hasil pencarian anda',
                          style: bold16.copyWith(color: dark1),
                        ),
                      ],
                    ),
                  ),
                  // Generated code for this ListView Widget...
                  Builder(
                    builder: (context) {
                      final listMakananToko = widget.keyData?.toList() ?? [];

                      if (listMakananToko.isEmpty) {
                        return Center(
                          child:
                              Text('Kata kunci pencarianmu tidak di temukan'),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: listMakananToko.length,
                        itemBuilder: (context, listMakananTokoIndex) {
                          final listMakananTokoItem =
                              listMakananToko[listMakananTokoIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Get.to(
                                  () => DetailRestoWidget(
                                    createUser: getJsonField(
                                        listMakananTokoItem,
                                        r'''$.create_user'''),
                                    dataToko: listMakananTokoItem['seller'],
                                  ),
                                  arguments: {'dataPage': 'search'},
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      getJsonField(listMakananTokoItem,
                                          r'''$.banner''')['200x150'],
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
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
                                              Expanded(
                                                child: Text(
                                                  '${(getJsonField(listMakananTokoItem, r'''$.name'''))} - ${(getJsonField(listMakananTokoItem['seller'], r'''$.name'''))}',
                                                  style: semibold12_5.copyWith(
                                                      color: dark2),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.star_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                size: 10,
                                              ),
                                              Text(
                                                getJsonField(
                                                        listMakananTokoItem[
                                                            'seller'],
                                                        r'''$.review''')
                                                    .toString(),
                                                style: regular10.copyWith(
                                                    color: dark2),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            getJsonField(listMakananTokoItem,
                                                r'''$.category_name'''),
                                            style: regular10.copyWith(
                                                color: dark2),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                getJsonField(
                                                    listMakananTokoItem,
                                                    r'''$.location_name'''),
                                                style: regular10.copyWith(
                                                    color: dark2),
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
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
