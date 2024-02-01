import 'package:get/get.dart';
import 'package:kelotimaja/core/helpers/common_helper.dart';
import 'package:kelotimaja/index.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/signup_signin_setup/login_page/login_page_widget.dart';
import '/umkm/isi_data_u_m_k_m/isi_data_u_m_k_m_widget.dart';
import '/umkm/review_pesanan_u_m_k_m/review_pesanan_u_m_k_m_widget.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'keranjang_model.dart';
export 'keranjang_model.dart';

class KeranjangWidget extends StatefulWidget {
  const KeranjangWidget({
    Key? key,
    required this.dataUmkm,
    required this.cartData,
  }) : super(key: key);

  final List<dynamic>? dataUmkm;
  final List<dynamic>? cartData;

  @override
  _KeranjangWidgetState createState() => _KeranjangWidgetState();
}

class _KeranjangWidgetState extends State<KeranjangWidget> {
  late KeranjangModel _model;
  int quantity = 1;
  String? defaultAddress;

  Future<void> getAddressData() async {
    final addressResponse = await UserGroup.userAddressCall.call(
      accessToken: FFAppState().accessToken,
    );

    final userAddressData = UserGroup.userAddressCall.userAddressDataAddressDet(
      addressResponse.jsonBody,
    ) as List<dynamic>?;

    defaultAddress = userAddressData
        ?.where((e) => getJsonField(e, r'$.is_default') != FFAppState().zeroVal)
        .toList()
        .first
        .toString();
  }

  void incrementQuantity(item) {
    setState(() {
      item['quantity'] = item['quantity'] + 1;
    });
  }

  void decrementQuantity(item) {
    setState(() {
      if (item['quantity'] > 1) {
        item['quantity'] = item['quantity'] - 1;
      }
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KeranjangModel());

    getAddressData();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  double calculateTotalPrice(List<dynamic> cartData) {
    double totalPrice = 0;
    for (dynamic item in cartData) {
      if (item.containsKey('price')) {
        totalPrice +=
            (double.parse(item['price'].toString()) * (item['quantity'] ?? 1));
      }
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    // print(widget.dataUmkm);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 54,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 24,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Keranjang',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleMediumFamily),
                ),
          ),
          actions: [],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Icon(
                          Icons.location_on,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24,
                        ),
                      ),
                      if (FFAppState().userData == null)
                        Text(
                          'Login untuk atur alamat',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
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

                            String addressString = defaultAddress?.isNotEmpty ==
                                    true
                                ? defaultAddress![0]['address']
                                : 'Mohon atur alamat utama'; // Replace with your desired text

                            // Menggunakan regex untuk mengekstrak nilai lat dan lng
                            RegExp regExp = RegExp(r'-?\d+\.\d+');
                            Iterable<Match> matches =
                                regExp.allMatches(addressString);

                            if (matches.length == 2) {
                              double lat =
                                  double.parse(matches.elementAt(0).group(0)!);
                              double lng =
                                  double.parse(matches.elementAt(1).group(0)!);

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

                            return Text(
                              ((FFAppState().userAddress?.length ?? 0) <= 30)
                                  ? FFAppState().userAddress ??
                                      'Mohon atur alamat utama'
                                  : (FFAppState().userAddress ??
                                              'Mohon atur alamat utama')
                                          .substring(0, 30) +
                                      '...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 5,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final cartData = widget.cartData!.toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(cartData.length, (cartDataIndex) {
                            final cartDataItem = cartData[cartDataIndex];
                            cartDataItem['quantity'] =
                                cartDataItem['quantity'] ?? 1;
                            // print(cartDataIndex);
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          getJsonField(
                                            FFAppState()
                                                .productUmkm[cartDataIndex],
                                            r'''$.seller.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
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
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    getJsonField(
                                                      FFAppState().productUmkm[
                                                          cartDataIndex],
                                                      r'''$.banner''',
                                                    )['400x350'],
                                                  ).image,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 20, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Text(
                                                      getJsonField(
                                                        FFAppState()
                                                                .productUmkm[
                                                            cartDataIndex],
                                                        r'''$.name''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Text(
                                                      getJsonField(
                                                        cartDataItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          formatNumber(
                                                            double.parse(
                                                                    getJsonField(
                                                                  cartDataItem,
                                                                  r'''$.price''',
                                                                ).toString()) *
                                                                cartDataItem[
                                                                    'quantity'],
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .commaDecimal,
                                                            currency: 'Rp ',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
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
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Pindahkan ke Wislist',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 7),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              // FFAppState().variantUMKM =
                                              //     cartDataItem;
                                              FFAppState()
                                                  .cartAddJson
                                                  .removeAt(cartDataIndex);
                                              FFAppState()
                                                  .productUmkm
                                                  .removeAt(cartDataIndex);
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () =>
                                            decrementQuantity(cartDataItem),
                                      ),
                                      Text('${cartDataItem['quantity']}'),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () =>
                                            incrementQuantity(cartDataItem),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Harga',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID', symbol: 'Rp ')
                                        .format(calculateTotalPrice(
                                            widget.cartData!))
                                        .replaceAll(",00", ""),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              // InkWell(
                              //   splashColor: Colors.transparent,
                              //   focusColor: Colors.transparent,
                              //   hoverColor: Colors.transparent,
                              //   highlightColor: Colors.transparent,
                              //   onTap: () async {
                              //     if (FFAppState().userData != null ||
                              //         widget.cartData != null) {
                              //       setState(() {
                              //         FFAppState().hargaTotalUmkm =
                              //             NumberFormat.currency(
                              //                     locale: 'id_ID',
                              //                     symbol: 'Rp ')
                              //                 .format(calculateTotalPrice(
                              //                     widget.cartData!))
                              //                 .replaceAll(",00", "");
                              //       });
                              //       await Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               ReviewPesananUMKMWidget(
                              //             dataUmkm: widget.cartData,
                              //             qtyProd: 0,
                              //             userData: FFAppState().userData,
                              //           ),
                              //         ),
                              //       );
                              //     } else {
                              //       ScaffoldMessenger.of(context)
                              //           .showSnackBar(
                              //         SnackBar(
                              //           content: Text(
                              //             'Login untuk melanjutkan',
                              //             style: TextStyle(
                              //               color:
                              //                   FlutterFlowTheme.of(context)
                              //                       .primaryText,
                              //             ),
                              //           ),
                              //           duration:
                              //               Duration(milliseconds: 4000),
                              //           backgroundColor:
                              //               FlutterFlowTheme.of(context)
                              //                   .secondary,
                              //         ),
                              //       );
                              //     }
                              //   },
                              //   child: Container(
                              //     width: 100,
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //       color:
                              //           FlutterFlowTheme.of(context).accent1,
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     child: Padding(
                              //       padding: EdgeInsetsDirectional.fromSTEB(
                              //           20, 0, 20, 0),
                              //       child: Row(
                              //         mainAxisSize: MainAxisSize.max,
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [
                              //           Text(
                              //             'Beli ',
                              //             style: FlutterFlowTheme.of(context)
                              //                 .titleSmall
                              //                 .override(
                              //                   fontFamily:
                              //                       FlutterFlowTheme.of(
                              //                               context)
                              //                           .titleSmallFamily,
                              //                   color: FlutterFlowTheme.of(
                              //                           context)
                              //                       .primaryBackground,
                              //                   useGoogleFonts: GoogleFonts
                              //                           .asMap()
                              //                       .containsKey(
                              //                           FlutterFlowTheme.of(
                              //                                   context)
                              //                               .titleSmallFamily),
                              //                 ),
                              //           ),
                              //           Text(
                              //             widget.cartData!.length.toString(),
                              //             style: FlutterFlowTheme.of(context)
                              //                 .bodyLarge
                              //                 .override(
                              //                   fontFamily:
                              //                       FlutterFlowTheme.of(
                              //                               context)
                              //                           .bodyLargeFamily,
                              //                   color: FlutterFlowTheme.of(
                              //                           context)
                              //                       .secondaryText,
                              //                   fontWeight: FontWeight.w500,
                              //                   useGoogleFonts: GoogleFonts
                              //                           .asMap()
                              //                       .containsKey(
                              //                           FlutterFlowTheme.of(
                              //                                   context)
                              //                               .bodyLargeFamily),
                              //                 ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().userData != null ||
                                      widget.cartData != null) {
                                    setState(() {
                                      FFAppState().userAddressData =
                                          defaultAddress;
                                      FFAppState().hargaTotalUmkm =
                                          NumberFormat.currency(
                                        locale: 'id_ID',
                                        symbol: 'Rp ',
                                      )
                                              .format(calculateTotalPrice(
                                                  widget.cartData!))
                                              .replaceAll(",00", "");
                                    });

                                    var orderItems = {
                                      'items': widget.cartData,
                                      'totalPrice':
                                          calculateTotalPrice(widget.cartData!),
                                      // 'toko': widget.umkmData['seller'],
                                      'address2': FFAppState().userAddress2,
                                      'address': FFAppState().userAddress,
                                      // 'shipping_cost': widget.umkmData['seller']['shipping_cost']
                                    };
                                    // CommonHelper.logPrint(jsonEncode(orderItems));
                                    Get.to(() => ReviewPesananUMKMWidget(
                                        // dataUmkm: widget.cartData,
                                        dataUmkm: widget.cartData,
                                        items: orderItems,
                                        qtyProd: 0,
                                        userData: FFAppState().userData));
                                    // await Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         ReviewPesananUMKMWidget(
                                    //       dataUmkm: widget.cartData,
                                    //       qtyProd: 0,
                                    //       userData: FFAppState().userData,
                                    //     ),
                                    //   ),
                                    // );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Login untuk melanjutkan',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                },
                                child: calculateTotalPrice(widget.cartData!) <=
                                        0
                                    ? SizedBox()
                                    : Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Beli ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                              ),
                                              Text(
                                                widget.cartData!.length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
