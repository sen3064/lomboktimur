import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:kolaka/search_filter/search_produk/search_produk_widget.dart';
import 'package:kolaka/theme.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/pilih_lokasi_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import '/umkm/detail_produk_food/detail_produk_food_widget.dart';
import '/umkm/keranjang/keranjang_widget.dart';
import '/umkm/list_produk_filter/list_produk_filter_widget.dart';
import '/umkm/list_produk_pilihan/list_produk_pilihan_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore: duplicate_import
import '/components/pilih_lokasi_widget.dart';

import 'home_u_m_k_m_model.dart';
export 'home_u_m_k_m_model.dart';

class HomeUMKMWidget extends StatefulWidget {
  const HomeUMKMWidget({
    Key? key,
    this.dataProduct,
    this.dataPage,
  }) : super(key: key);

  final dynamic dataProduct;
  final String? dataPage;

  @override
  _HomeUMKMWidgetState createState() => _HomeUMKMWidgetState();
}

class _HomeUMKMWidgetState extends State<HomeUMKMWidget> {
  late HomeUMKMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeUMKMModel());
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
            await _model.waitForApiRequestCompleted();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              toolbarHeight: 80,
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
                  Navigator.push(
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
                height: 60,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_model.unfocusNode),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: PilihLokasiWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
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
                        if (FFAppState().userData == null)
                          Text(
                            'Login untuk atur alamat',
                            style: semibold12_5.copyWith(color: dark2),
                          ),
                        if (FFAppState().userData != null)
                          FutureBuilder<ApiCallResponse>(
                            future: UserGroup.userAddressCall
                                .call(accessToken: FFAppState().accessToken),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .tertiary400,
                                    ),
                                  ),
                                );
                              }
                              final textUserAddressResponse = snapshot.data!;
                              // print(textUserAddressResponse.jsonBody);
                              final userAddressData =
                                  UserGroup.userAddressCall.userAddressData(
                                textUserAddressResponse.jsonBody,
                              ) as List<dynamic>?;
                              final defaultAddress = userAddressData
                                  ?.where((e) =>
                                      getJsonField(e, r'$.is_default') != 0)
                                  .toList();

                              String addressString = defaultAddress
                                          ?.isNotEmpty ==
                                      true
                                  ? defaultAddress![0]['address']
                                  : 'Mohon atur alamat utama'; // Replace with your desired text

                              // Menggunakan regex untuk mengekstrak nilai lat dan lng
                              RegExp regExp = RegExp(r'-?\d+\.\d+');
                              Iterable<Match> matches =
                                  regExp.allMatches(addressString);

                              if (matches.length == 2) {
                                double lat = double.parse(
                                    matches.elementAt(0).group(0)!);
                                double lng = double.parse(
                                    matches.elementAt(1).group(0)!);

                                // Ubah nilai lat dan lng menjadi string dan gabungkan ke dalam satu string
                                String userAddress2 = '$lat,$lng';

                                // Set nilai ke dalam FFAppState().userAddress2
                                FFAppState().userAddress2 = userAddress2;

                                // Cetak hasil
                                // print('User Address 2: ${FFAppState().userAddress2}');
                              } else {
                                print(
                                    'Latitude or Longitude data not available.');
                              }

                              FFAppState().userAddress =
                                  defaultAddress?.isNotEmpty == true
                                      ? defaultAddress![0]['address_detail']
                                      : 'Mohon atur alamat utama';

                              return AutoSizeText(
                                ((FFAppState().userAddress?.length ?? 0) <= 30)
                                    ? FFAppState().userAddress ??
                                        'Mohon atur alamat utama'
                                    : (FFAppState().userAddress ??
                                                'Mohon atur alamat utama')
                                            .substring(0, 30) +
                                        '...',
                                style: semibold12_5.copyWith(color: dark2),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 30, 10),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KeranjangWidget(
                            cartData: FFAppState().cartAddJson,
                            dataUmkm: FFAppState().productUmkm,
                          ),
                        ),
                      );
                    },
                    child: badges.Badge(
                      badgeContent: Text(
                        valueOrDefault<String>(
                          FFAppState().cartAddJson.length.toString(),
                          '0',
                        ),
                        style: regular12_5.copyWith(color: white),
                      ),
                      showBadge: true,
                      child: Icon(
                        FFIcons.kshoppingBag,
                        color: red1,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchProdukWidget(
                            dataPage: widget.dataPage,
                          ),
                        ),
                      );
                    },
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Mau belanja apa hari ini?',
                                      style:
                                          semibold12_5.copyWith(color: dark2),
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
                                        print('IconButton pressed ...');
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
            body: Stack(
              children: [
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/pilihbrandlokal.png',
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ListProdukFilterWidget(
                                        subcategoryId: 11,
                                        dataPage: 'HomeUMKMWidget()',
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.asset(
                                              'assets/images/Food.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        'Makanan \n& Minuman',
                                        textAlign: TextAlign.center,
                                        style:
                                            regular12_5.copyWith(color: dark2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ListProdukFilterWidget(
                                              subcategoryId: 14,
                                              dataPage: 'HomeUMKMWidget()'),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.asset(
                                              'assets/images/Dekor.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        'Dekorasi',
                                        style:
                                            regular12_5.copyWith(color: dark2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ListProdukFilterWidget(
                                              subcategoryId: 13,
                                              dataPage: 'HomeUMKMWidget()'),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.asset(
                                              'assets/images/Kerajinan.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        'Kerajinan',
                                        style:
                                            regular12_5.copyWith(color: dark2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ListProdukFilterWidget(
                                              subcategoryId: 15,
                                              dataPage: 'HomeUMKMWidget()'),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.asset(
                                              'assets/images/Aksesoris.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        'Aksesoris',
                                        style:
                                            regular12_5.copyWith(color: dark2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ListProdukFilterWidget(
                                              subcategoryId: 12,
                                              dataPage: 'HomeUMKMWidget()'),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.asset(
                                              'assets/images/Fashion.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        'Fashion',
                                        style:
                                            regular12_5.copyWith(color: dark2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ListProdukFilterWidget(
                                              subcategoryId: 16,
                                              dataPage: 'HomeUMKMWidget()'),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.asset(
                                              'assets/images/Kosmetik.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Text(
                                        'Kosmetik',
                                        textAlign: TextAlign.center,
                                        style:
                                            regular12_5.copyWith(color: dark2),
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Resto & Cafe',
                              style: bold16.copyWith(color: dark1),
                            ),
                            InkWell(
                              onTap: () async {
                                // await Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         ListProdukPilihanWidget(),
                                //   ),
                                // );
                                Get.to(
                                  () => ListProdukPilihanWidget(
                                      dataPage: 'HomeUMKMWidget()'),
                                  arguments: {'dataPage': 'HomeUMKMWidget()'},
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                            child: FutureBuilder<ApiCallResponse>(
                              future: _model.dataUMKM(
                                requestFn: () => (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(UmkmGroup
                                              .listProdukUMKMCall
                                              .call()))
                                    .future,
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
                                final rowListProdukUMKMResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final jsonBody =
                                        rowListProdukUMKMResponse.jsonBody;
                                    if (jsonBody == null) {
                                      // Handle the case when jsonBody is null (e.g., show an error message)
                                      return Center(
                                        child: Text("Tidak ada koneksi"),
                                      );
                                    }
                                    final listUmkm = rowListProdukUMKMResponse
                                        .jsonBody
                                        .toList()
                                        .take(4)
                                        .toList();
                                    final random = Random();
                                    listUmkm.shuffle(random);
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        print('refresh bawah');
                                        setState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              listUmkm.length, (listUmkmIndex) {
                                            final listUmkmItem =
                                                listUmkm[listUmkmIndex];
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
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
                                                          DetailProdukFoodWidget(
                                                        umkmData: listUmkmItem,
                                                        umkmId: getJsonField(
                                                          listUmkmItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        variants: getJsonField(
                                                          listUmkmItem,
                                                          r'''$.variants''',
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 160,
                                                  height: 250,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              listUmkmItem,
                                                              r'''$.banner''',
                                                            )['400x350'],
                                                            width:
                                                                double.infinity,
                                                            height: 140,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '1.6 km',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      5, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  getJsonField(
                                                                    listUmkmItem,
                                                                    r'''$.name''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: semibold12_5
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
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .star_purple500_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                  'Belum ada review',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                0.0,
                                                                5.0,
                                                                0.0),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  65,
                                                                  64,
                                                                  64),
                                                      size: 10.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                        listUmkmItem,
                                                        r'''$.location_name''',
                                                      ).toString(),
                                                      style: TextStyle(
                                                        color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  65,
                                                                  64,
                                                                  64),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                                        Expanded(
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
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  formatNumber(
                                                                    double.parse(
                                                                        getJsonField(
                                                                      listUmkmItem,
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Produk Popular',
                                    style: bold16.copyWith(color: dark1),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      Get.to(
                                        () => ListProdukPilihanWidget(
                                            dataPage: 'HomeUMKMWidget()'),
                                        arguments: {
                                          'dataPage': 'HomeUMKMWidget()'
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Lihat semua',
                                      style: regular16.copyWith(color: red1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 10.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState().umkmData(
                                  requestFn: () =>
                                      UmkmGroup.listProdukUMKMCall.call(),
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
                                  final rowListProdukUMKMResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final listUmkm2 =
                                          rowListProdukUMKMResponse.jsonBody
                                              .toList()
                                              .take(5)
                                              .toList();
                                      final random = Random();
                                      listUmkm2.shuffle(random);
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(listUmkm2.length,
                                                  (listUmkm2Index) {
                                            final listUmkm2Item =
                                                listUmkm2[listUmkm2Index];
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
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
                                                          DetailProdukFoodWidget(
                                                        umkmData: listUmkm2Item,
                                                        umkmId: getJsonField(
                                                          listUmkm2Item,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        variants: getJsonField(
                                                          listUmkm2Item,
                                                          r'''$.variants''',
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 160,
                                                  height: 250,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                          child: Image.network(
                                                            getJsonField(
                                                              listUmkm2Item,
                                                              r'''$.banner''',
                                                            )['400x350'],
                                                            width:
                                                                double.infinity,
                                                            height: 140,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '1.6 km',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      5, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  getJsonField(
                                                                    listUmkm2Item,
                                                                    r'''$.name''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: semibold12_5
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
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .star_purple500_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                  'Belum ada review',
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                0.0,
                                                                5.0,
                                                                0.0),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  65,
                                                                  64,
                                                                  64),
                                                      size: 10.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      getJsonField(
                                                        listUmkm2Item,
                                                        r'''$.location_name''',
                                                      ).toString(),
                                                      style: TextStyle(
                                                        color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  65,
                                                                  64,
                                                                  64),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                                        Expanded(
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
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  formatNumber(
                                                                    double.parse(
                                                                        getJsonField(
                                                                      listUmkm2Item,
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
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
                          ],
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
    );
  }
}
