import 'package:get/get.dart';
import 'package:kolaka/backend/api_requests/api_calls.dart';
import 'package:kolaka/transportasi/list_pencarian_kendaraan/list_pencarian_kendaraan_widget.dart';

import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cari_kendaraan_model.dart';
export 'cari_kendaraan_model.dart';

class CariKendaraanWidget extends StatefulWidget {
  const CariKendaraanWidget({Key? key}) : super(key: key);

  @override
  _CariKendaraanWidgetState createState() => _CariKendaraanWidgetState();
}

class _CariKendaraanWidgetState extends State<CariKendaraanWidget> {
  late CariKendaraanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CariKendaraanModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 54,
            icon: Icon(
              Icons.arrow_back_outlined,
              color: FlutterFlowTheme.of(context).primary,
              size: 24,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Cari Kendaraan',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Poppins',
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: TextFormField(
                              controller: _model.textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              onFieldSubmitted: (_) async {
                              try {
                                // Menampilkan indikator loading
                                _model.setLoading(true);

                                _model.apiResultijas =
                                    await UmkmGroup.searchProdukCall.call(
                                  keyword: _model.textController.text,
                                );

                                if ((_model.apiResultijas?.succeeded ?? true)) {
                                  final transportasiData = getJsonField(
                                          _model.apiResultijas?.jsonBody,
                                          r'$.data.transportasi') ??
                                      [];
                                  // Lanjutkan dengan logika setelah mendapatkan hasil pencarian

                                  Get.to(() => ListPencarianKendaraanWidget(
                                        searchData: _model.textController.text,
                                        keyData: transportasiData,
                                      ));

                                  _model.setLoading(false);}
                              } catch (e) {
                                print('failed');
                                // Menyembunyikan indikator loading setelah proses pencarian selesai, termasuk jika terjadi kesalahan
                                _model.setLoading(false);
                              }
                            },
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                hintText: 'Cari mobil favorit Anda',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 15,
                                ),
                                suffixIcon: _model
                                        .textController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.textController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 20,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Pencarian ',
                //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                //               fontFamily:
                //                   FlutterFlowTheme.of(context).bodyMediumFamily,
                //               fontWeight: FontWeight.w600,
                //               useGoogleFonts: GoogleFonts.asMap().containsKey(
                //                   FlutterFlowTheme.of(context)
                //                       .bodyMediumFamily),
                //             ),
                //       ),
                //       Text(
                //         'Hapus Semua',
                //         style: FlutterFlowTheme.of(context).bodySmall,
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //   child: Column(
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       ListView(
                //         padding: EdgeInsets.zero,
                //         shrinkWrap: true,
                //         scrollDirection: Axis.vertical,
                //         children: [
                //           Padding(
                //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                //             child: Row(
                //               mainAxisSize: MainAxisSize.max,
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   'Daihatsu Xenia',
                //                   style: FlutterFlowTheme.of(context).bodySmall,
                //                 ),
                //                 Icon(
                //                   Icons.close_rounded,
                //                   color: FlutterFlowTheme.of(context).secondary,
                //                   size: 20,
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                //             child: Row(
                //               mainAxisSize: MainAxisSize.max,
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   'Suzuki APV',
                //                   style: FlutterFlowTheme.of(context).bodySmall,
                //                 ),
                //                 Icon(
                //                   Icons.close_rounded,
                //                   color: FlutterFlowTheme.of(context).secondary,
                //                   size: 20,
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                //             child: Row(
                //               mainAxisSize: MainAxisSize.max,
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   'Toyota Avanza',
                //                   style: FlutterFlowTheme.of(context).bodySmall,
                //                 ),
                //                 Icon(
                //                   Icons.close_rounded,
                //                   color: FlutterFlowTheme.of(context).secondary,
                //                   size: 20,
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // Align(
                //   alignment: AlignmentDirectional(-1, 0),
                //   child: Padding(
                //     padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //     child: Column(
                //       mainAxisSize: MainAxisSize.max,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Type Mobil',
                //           style: FlutterFlowTheme.of(context)
                //               .bodyMedium
                //               .override(
                //                 fontFamily: FlutterFlowTheme.of(context)
                //                     .bodyMediumFamily,
                //                 fontWeight: FontWeight.w600,
                //                 useGoogleFonts: GoogleFonts.asMap().containsKey(
                //                     FlutterFlowTheme.of(context)
                //                         .bodyMediumFamily),
                //               ),
                //         ),
                //         Padding(
                //           padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                //           child: FlutterFlowChoiceChips(
                //             options: [
                //               ChipData('All'),
                //               ChipData('Hatchback'),
                //               ChipData('Compact SUV'),
                //               ChipData('SUV'),
                //               ChipData('Sedan'),
                //               ChipData('MPV'),
                //               ChipData('Luxury')
                //             ],
                //             onChanged: (val) => setState(
                //                 () => _model.choiceChipsValue = val?.first),
                //             selectedChipStyle: ChipStyle(
                //               backgroundColor: Color(0xFFCDEEFC),
                //               textStyle: FlutterFlowTheme.of(context)
                //                   .bodyMedium
                //                   .override(
                //                     fontFamily: FlutterFlowTheme.of(context)
                //                         .bodyMediumFamily,
                //                     color: FlutterFlowTheme.of(context)
                //                         .primaryText,
                //                     useGoogleFonts: GoogleFonts.asMap()
                //                         .containsKey(
                //                             FlutterFlowTheme.of(context)
                //                                 .bodyMediumFamily),
                //                   ),
                //               iconColor:
                //                   FlutterFlowTheme.of(context).primaryText,
                //               iconSize: 18,
                //               elevation: 0,
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //             unselectedChipStyle: ChipStyle(
                //               backgroundColor: Color(0x00000000),
                //               textStyle: FlutterFlowTheme.of(context).bodySmall,
                //               iconColor: FlutterFlowTheme.of(context).secondary,
                //               iconSize: 18,
                //               elevation: 0,
                //               borderColor: Color(0x42000000),
                //               borderRadius: BorderRadius.circular(16),
                //             ),
                //             chipSpacing: 12,
                //             rowSpacing: 12,
                //             multiselect: false,
                //             alignment: WrapAlignment.start,
                //             controller: _model.choiceChipsValueController ??=
                //                 FormFieldController<List<String>>(
                //               [],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
