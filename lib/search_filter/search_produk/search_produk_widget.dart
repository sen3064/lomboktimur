import 'package:get/get.dart';
import 'package:kolaka/backend/api_requests/api_calls.dart';
import 'package:kolaka/index.dart';
import 'package:kolaka/search_filter/search_result/search_list_tour_widget.dart';
import 'package:kolaka/search_filter/search_result/search_result_widget.dart';

import '../../main.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/penginapan/detail_penginapan/detail_penginapan_widget.dart';
import '/search_filter/search_produk/search_produk_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'search_produk_model.dart';
export 'search_produk_model.dart';

class SearchProdukWidget extends StatefulWidget {
  const SearchProdukWidget({
    Key? key,
    this.dataProduct,
    this.dataPage,
  }) : super(key: key);

  final dynamic dataProduct;
  final String? dataPage;

  @override
  _SearchProdukWidgetState createState() => _SearchProdukWidgetState();
}

class _SearchProdukWidgetState extends State<SearchProdukWidget> {
  late SearchProdukModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchProdukModel());

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

    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // Menangani berbagai nilai dari widget.dataPage
              if (widget.dataPage == "HomeUMKMWidget()") {
                return HomeUMKMWidget(
                  dataPage: 'HomeUMKMWidget()',
                );
              } else {
                return NavBarPage(initialPage: 'Home_Page');
              }
            },
          ),
        );
        return true;
      },
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
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // Menangani berbagai nilai dari widget.dataPage
                    // Menangani berbagai nilai dari widget.dataPage
                    if (widget.dataPage == "HomeUMKMWidget()") {
                      return HomeUMKMWidget(
                        dataPage: 'HomeUMKMWidget()',
                      );
                    } else {
                      return NavBarPage(initialPage: 'Home_Page');
                    }
                  },
                ),
              );
              return true;
            },
          ),
          title: Text(
            'Pencarian Produk',
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.dataPage == 'HomeUMKMWidget()')
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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

                                _model.apiResultija =
                                    await UmkmGroup.searchProdukCall.call(
                                  keyword: _model.textController.text,
                                );

                                if ((_model.apiResultija?.succeeded ?? true)) {
                                  final umkmData = getJsonField(
                                          _model.apiResultija?.jsonBody,
                                          r'$.data.umkm') ??
                                      [];
                                  // Lanjutkan dengan logika setelah mendapatkan hasil pencarian

                                  Get.to(() => SearchResultWidget(
                                        dataPage: widget.dataPage,
                                        searchData: _model.textController.text,
                                        keyData: umkmData,
                                      ));

                                  _model.setLoading(false);}
                              } catch (e) {
                                // Menyembunyikan indikator loading setelah proses pencarian selesai, termasuk jika terjadi kesalahan
                                _model.setLoading(false);
                              }
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Cari...',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(24, 16, 0, 16),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                              ),
                              suffixIcon: _model.textController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.textController?.clear();
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
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
                  ],
                ),
              ),
              // Visibility(
              //   visible: _model.isLoading,
              //   child: CircularProgressIndicator(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
