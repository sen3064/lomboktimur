import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/about_us.dart';
import 'package:kelotimaja/home/chat/chat_widget.dart';
import 'package:kelotimaja/scan_page_widget.dart';

import 'package:kelotimaja/theme.dart';

import 'package:kelotimaja/main.dart';
import 'package:kelotimaja/makanan/detail_resto/detail_resto_widget.dart';
import 'package:kelotimaja/transportasi/detail_transpotasi_mobil/detail_transpotasi_mobil_widget.dart';
import 'package:kelotimaja/umkm/detail_produk_food/detail_produk_food_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../search_filter/search.dart';
import '../../tiket_wisata/beli_tiket_wisata/beli_tiket_wisata_widget.dart';

import '/backend/api_requests/api_calls.dart';

import '/tiket_wisata/list_tiket_wisata/list_tiket_wisata_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_icon_button.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_model.dart';

import '/makanan/home_makanan/home_makanan_widget.dart';
import '/penginapan/detail_penginapan/detail_penginapan_widget.dart';
import '/penginapan/list_penginapan/list_penginapan_widget.dart';

import '/signup_signin_setup/login_page/login_page_widget.dart';
import '/tentang_kabupaten/tentang_kabupaten/tentang_kabupaten_widget.dart';
import '/transportasi/home_kendaraan/home_kendaraan_widget.dart';
import '/umkm/home_u_m_k_m/home_u_m_k_m_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
// add new
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.dataPage,
  }) : super(key: key);
  final String? dataPage;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool isExpanded = false;
  late HomePageModel _model;
  TextEditingController namaController = TextEditingController(
      text: FFAppState().accessToken.isEmpty
          ? ''
          : FFAppState().userData['name']);
  TextEditingController dewasaController = TextEditingController(text: '1');
  TextEditingController anakController = TextEditingController(text: '0');
  FocusNode? textFieldFocusNode1;
  FocusNode? textFieldFocusNode2;
  FocusNode? textFieldFocusNode3;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _updatePrices() async {
    if (_model.switchValue == true) {
      // Harga yang ditampilkan saat SwitchListTile aktif (true)
      // ...
    } else {
      // Harga yang ditampilkan saat SwitchListTile nonaktif (false)
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    print(FFAppState().accessToken);
    final mediaqueryheight = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    context.watch<FFAppState>();

    DateTime checkin = DateTime.now().add(Duration(days: 1));
    String formattedStartdate = DateFormat('d/M/y').format(checkin);
    DateTime checkout = DateTime.now().add(Duration(days: 2));
    String formattedEndate = DateFormat('d/M/y').format(checkout);
    DateTime now = DateTime.now();
    String formattedNow = DateFormat('yyyy-MM-dd').format(now);

    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBarPage(initialPage: 'Home_Page'),
            ));
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false, // Set this property to false
          centerTitle: false,
          title: RichText(
            text: TextSpan(
              text: "Hi, ",
              style: regular16,
              children: [
                if (valueOrDefault<bool>(
                  FFAppState().userData == null,
                  true,
                ))
                  TextSpan(
                    text: "Sobat Kelotimaja",
                    style: bold16,
                  ),
                if (valueOrDefault<bool>(
                  FFAppState().userData != null,
                  true,
                ))
                  TextSpan(
                    text:
                        '${getJsonField(FFAppState().userData, r'''$.first_name''')} ${getJsonField(FFAppState().userData, r'''$.last_name''')}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                String scannedValue = await FlutterBarcodeScanner.scanBarcode(
                  '#C62828', // scanning line color
                  'Cancel', // cancel button text
                  true, // whether to show the flash icon
                  ScanMode.QR,
                );

                if (scannedValue != '-1') {
                  print(scannedValue);
                  //scan value di split jadi list string
                  // chek panjang list nya kalo list length 2 (true)
                  //check list index 0 sesuai dengan nama kab nya klo sesuai (true)
                  // -1 is returned when scanning is canceled
                  // setState(() {
                  //   FFAppState().address = scannedValue;
                  // });
                  // Get.to(() => ListTiketWisataWidget());
                  //if()
                  // Get.defaultDialog(
                  //   title: 'Masukan Data',
                  //   content: Column(mainAxisSize: MainAxisSize.max, children: [
                  //     Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Text(
                  //             'Nama',
                  //             style: FlutterFlowTheme.of(context)
                  //                 .titleMedium
                  //                 .override(
                  //                   fontFamily: FlutterFlowTheme.of(context)
                  //                       .titleMediumFamily,
                  //                   fontWeight: FontWeight.w500,
                  //                   useGoogleFonts: GoogleFonts.asMap()
                  //                       .containsKey(
                  //                           FlutterFlowTheme.of(context)
                  //                               .titleMediumFamily),
                  //                 ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  //       child: Container(
                  //         width: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: FlutterFlowTheme.of(context).tertiary,
                  //           borderRadius: BorderRadius.circular(21),
                  //         ),
                  //         child: Padding(
                  //           padding:
                  //               EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  //           child: TextFormField(
                  //             controller: namaController,
                  //             focusNode: textFieldFocusNode1,
                  //             obscureText: false,
                  //             decoration: InputDecoration(
                  //               labelStyle: FlutterFlowTheme.of(context)
                  //                   .bodyLarge
                  //                   .override(
                  //                     fontFamily: FlutterFlowTheme.of(context)
                  //                         .bodyLargeFamily,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: GoogleFonts.asMap()
                  //                         .containsKey(
                  //                             FlutterFlowTheme.of(context)
                  //                                 .bodyLargeFamily),
                  //                   ),
                  //               hintText: 'Nama',
                  //               hintStyle: FlutterFlowTheme.of(context)
                  //                   .bodyLarge
                  //                   .override(
                  //                     fontFamily: FlutterFlowTheme.of(context)
                  //                         .bodyLargeFamily,
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .secondary,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: GoogleFonts.asMap()
                  //                         .containsKey(
                  //                             FlutterFlowTheme.of(context)
                  //                                 .bodyLargeFamily),
                  //                   ),
                  //               enabledBorder: InputBorder.none,
                  //               focusedBorder: InputBorder.none,
                  //               errorBorder: InputBorder.none,
                  //               focusedErrorBorder: InputBorder.none,
                  //             ),
                  //             style: FlutterFlowTheme.of(context).titleMedium,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Text(
                  //             'Wisatawan Dewasa',
                  //             style: FlutterFlowTheme.of(context)
                  //                 .titleMedium
                  //                 .override(
                  //                   fontFamily: FlutterFlowTheme.of(context)
                  //                       .titleMediumFamily,
                  //                   fontWeight: FontWeight.w500,
                  //                   useGoogleFonts: GoogleFonts.asMap()
                  //                       .containsKey(
                  //                           FlutterFlowTheme.of(context)
                  //                               .titleMediumFamily),
                  //                 ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  //       child: Container(
                  //         width: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: FlutterFlowTheme.of(context).tertiary,
                  //           borderRadius: BorderRadius.circular(21),
                  //         ),
                  //         child: Padding(
                  //           padding:
                  //               EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  //           child: TextFormField(
                  //             controller: dewasaController,
                  //             focusNode: textFieldFocusNode2,
                  //             keyboardType: TextInputType.number,
                  //             obscureText: false,
                  //             decoration: InputDecoration(
                  //               labelStyle: FlutterFlowTheme.of(context)
                  //                   .bodyLarge
                  //                   .override(
                  //                     fontFamily: FlutterFlowTheme.of(context)
                  //                         .bodyLargeFamily,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: GoogleFonts.asMap()
                  //                         .containsKey(
                  //                             FlutterFlowTheme.of(context)
                  //                                 .bodyLargeFamily),
                  //                   ),
                  //               hintText: 'Jumlah Wisatawan Dewasa',
                  //               hintStyle: FlutterFlowTheme.of(context)
                  //                   .bodyLarge
                  //                   .override(
                  //                     fontFamily: FlutterFlowTheme.of(context)
                  //                         .bodyLargeFamily,
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .secondary,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: GoogleFonts.asMap()
                  //                         .containsKey(
                  //                             FlutterFlowTheme.of(context)
                  //                                 .bodyLargeFamily),
                  //                   ),
                  //               enabledBorder: InputBorder.none,
                  //               focusedBorder: InputBorder.none,
                  //               errorBorder: InputBorder.none,
                  //               focusedErrorBorder: InputBorder.none,
                  //             ),
                  //             style: FlutterFlowTheme.of(context).titleMedium,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                  //           Text(
                  //             'Wisatawan Anak (dibawah 17 tahun)',
                  //             style: FlutterFlowTheme.of(context)
                  //                 .titleMedium
                  //                 .override(
                  //                   fontFamily: FlutterFlowTheme.of(context)
                  //                       .titleMediumFamily,
                  //                   fontWeight: FontWeight.w500,
                  //                   useGoogleFonts: GoogleFonts.asMap()
                  //                       .containsKey(
                  //                           FlutterFlowTheme.of(context)
                  //                               .titleMediumFamily),
                  //                 ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  //       child: Container(
                  //         width: double.infinity,
                  //         decoration: BoxDecoration(
                  //           color: FlutterFlowTheme.of(context).tertiary,
                  //           borderRadius: BorderRadius.circular(21),
                  //         ),
                  //         child: Padding(
                  //           padding:
                  //               EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  //           child: TextFormField(
                  //             controller: anakController,
                  //             focusNode: textFieldFocusNode3,
                  //             keyboardType: TextInputType.number,
                  //             obscureText: false,
                  //             decoration: InputDecoration(
                  //               labelStyle: FlutterFlowTheme.of(context)
                  //                   .bodyLarge
                  //                   .override(
                  //                     fontFamily: FlutterFlowTheme.of(context)
                  //                         .bodyLargeFamily,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: GoogleFonts.asMap()
                  //                         .containsKey(
                  //                             FlutterFlowTheme.of(context)
                  //                                 .bodyLargeFamily),
                  //                   ),
                  //               hintText:
                  //                   'Jumlah Wisatawan usia 17 tahun kebawah',
                  //               hintStyle: FlutterFlowTheme.of(context)
                  //                   .bodyLarge
                  //                   .override(
                  //                     fontFamily: FlutterFlowTheme.of(context)
                  //                         .bodyLargeFamily,
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .secondary,
                  //                     fontWeight: FontWeight.w500,
                  //                     useGoogleFonts: GoogleFonts.asMap()
                  //                         .containsKey(
                  //                             FlutterFlowTheme.of(context)
                  //                                 .bodyLargeFamily),
                  //                   ),
                  //               enabledBorder: InputBorder.none,
                  //               focusedBorder: InputBorder.none,
                  //               errorBorder: InputBorder.none,
                  //               focusedErrorBorder: InputBorder.none,
                  //             ),
                  //             style: FlutterFlowTheme.of(context).titleMedium,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ]),
                  //   onConfirm: () async {
                  //     _model.apiResult0e56789hi =
                  //         await TiketWisataGroup.beliTiketWisataCall.call(
                  //       tiketId: scannedValue,
                  //       nama: namaController.text,
                  //       dewasa: dewasaController.text,
                  //       anak: anakController.text,
                  //     );
                  //     print('userdata: ${_model.apiResult0e56789hi!.jsonBody}');
                  //     if ((_model.apiResult0e56789hi?.succeeded ?? true)) {
                  //       await Get.defaultDialog(
                  //         title: "Sukses",
                  //         middleText:
                  //             "Terima kasih\nSelamat menikmati kunjungan wisata anda",
                  //         onConfirm: () => Get.back(),
                  //       );
                  //       Get.back();
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           content: Text(
                  //             'Tidak boleh kosong',
                  //             style: TextStyle(
                  //               color: FlutterFlowTheme.of(context).primaryText,
                  //             ),
                  //           ),
                  //           duration: Duration(milliseconds: 4000),
                  //           backgroundColor:
                  //               FlutterFlowTheme.of(context).secondary,
                  //         ),
                  //       );
                  //     }
                  //     setState(() {});
                  //   },
                  // );
                  List<String> scanned = scannedValue.split('/');
                  if (scanned[2] == 'm.kelotimaja.kabtour.com') {
                    if (FFAppState().accessToken.isNotEmpty) {
                      List<String> paramData = scanned[3].split('=');
                      String tiketId = paramData[1];
                      Get.off(() => ScanPageWidget(isScannedValue: tiketId));
                    } else {
                      Get.defaultDialog(
                          title: "Login dulu",
                          middleText:
                              "Silakan login untuk melakukan scan dan mendapatkan poin",
                          onConfirm: () => Get.off(() => LoginPageWidget()));
                    }
                  } else {
                    Get.defaultDialog(
                        title: "Kode QR Tidak Sesuai",
                        middleText:
                            "Silakan silahkan download aplikasi kelotimaja untuk scan",
                        onConfirm: () => Get.off(() => NavBarPage(
                              initialPage: 'Home_page',
                            )));
                  }
                } else {
                  Get.offAll(() => NavBarPage(initialPage: 'Home_Page'));
                }
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                height: 25,
                width: 25,
                child: Image.asset(
                  "assets/images/qrcode.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle notifications action here
              },
              child: Container(
                margin: EdgeInsets.only(right: 20),
                height: 15,
                width: 15,
                child: Icon(
                  Icons.notifications,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          backgroundColor: red1,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: ClipPathClass(),
                        child: Container(
                          height: 180,
                          width: Get.width,
                          color: red1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TentangKabupatenWidget()), // TentangKabupatenWidget AboutUs Gantilah HalamanTujuan dengan halaman yang sesuai
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kabupaten Lombok Timur',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'Kabupaten Lombok Timur dikenal karena keindahan alamnya, termasuk lanskap, pantai, dan warisan budayanya.',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                      maxLines: isExpanded ? null : 2,
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      "Read More",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )

                                    // Tampilkan tombol "Read More" hanya jika teks belum sepenuhnya terbaca.
                                    // isExpanded
                                    //     ? SizedBox.shrink()
                                    //     : InkWell(
                                    //         onTap: () {
                                    //           setState(() {
                                    //             isExpanded = true;
                                    //           });
                                    //         },
                                    //         child: Text(
                                    //           'Read More',
                                    //           style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontWeight: FontWeight.bold,
                                    //           ),
                                    //         ),
                                    //       ),
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/Logo_kelotimaja.png',
                                width: 60,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Column(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(30.0),
                      //       child: Container(
                      //         margin: EdgeInsets.only(top: 100),
                      //         width: Get.width,
                      //         height: 50,
                      //         decoration: BoxDecoration(
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: Colors.black
                      //                   .withOpacity(0.1), // Shadow color
                      //               spreadRadius: 1, // Spread radius
                      //               blurRadius: 5, // Blur radius
                      //               offset: Offset(0,
                      //                   3), // Offset in the x and y direction
                      //             ),
                      //           ],
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(16),
                      //           border: Border.all(
                      //             color: FlutterFlowTheme.of(context)
                      //                 .secondaryText,
                      //           ),
                      //         ),
                      //         child: Padding(
                      //           padding:
                      //               EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      //           child: InkWell(
                      //             onTap: () async {
                      //               Get.to(() => SearchPage());
                      //               // Get.to(()=>ChatWidget());
                      //             },
                      //             // onTap: () async {
                      //             //   Get.to(
                      //             //     () => SearchProdukWidget(
                      //             //         dataPage: 'HomeUMKMWidget()'),
                      //             //     arguments: {
                      //             //       'dataPage': 'HomeUMKMWidget()'
                      //             //     },
                      //             //   );
                      //             // },
                      //             child: Row(
                      //               mainAxisSize: MainAxisSize.min,
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               children: [
                      //                 Icon(
                      //                   Icons.search,
                      //                   color: red1,
                      //                   size: 24,
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Text(
                      //                   "Beragam pilihan UMKM",
                      //                   style:
                      //                       regular12_5.copyWith(color: dark2),
                      //                 )
                      //                 // TextField(
                      //                 //   // controller: _searchController,
                      //                 //   decoration: InputDecoration(
                      //                 //     hintText: 'Cari...',
                      //                 //     border: InputBorder.none,
                      //                 //     prefixIcon: Icon(
                      //                 //       Icons.search,
                      //                 //     ),
                      //                 //   ),
                      //                 //   onChanged: (query) {
                      //                 //     print(query);
                      //                 //   },
                      //                 // ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.to(
                                    () => HomeKendaraanWidget(
                                        dataPage: 'HomeKendaraanWidget()'),
                                    arguments: {
                                      'dataPage': 'HomeKendaraanWidget()'
                                    },
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0281A0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.car_rental_rounded,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 30, // Set the height to 24
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Transportasi',
                                style: regular12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.to(() => HomeMakananWidget());
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF0F00),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.food_bank_rounded,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 30, // Set the height to 24
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Restoran',
                                style: regular12_5.copyWith(color: dark2),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.to(() => ListPenginapanWidget());
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff00880F),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.house_rounded,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 30, // Set the height to 24
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Penginapan',
                                style: regular12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.to(
                                    () => HomeUMKMWidget(
                                        dataPage: 'HomeUMKMWidget()'),
                                    arguments: {'dataPage': 'HomeUMKMWidget()'},
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF0F00),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.storefront_rounded,
                                    color: Colors.white,
                                    size: 30, // Set the height to 24
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'UMKM',
                                style: regular12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.to(() => ListTiketWisataWidget());
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.beach_access_rounded,
                                    color: Colors.white,
                                    size: 30, // Set the height to 24
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Tiket Wisata',
                                style: regular12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.to(() => ListTiketWisataWidget());
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 2, 160, 23),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.supervised_user_circle,
                                    color: Colors.white,
                                    size: 30, // Set the height to 24
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'LayananJasa',
                                style: regular12_5.copyWith(color: dark2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault<bool>(
                        FFAppState().userData == null,
                        true,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFCFCFC),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).accent1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Yuk Login Sekarang',
                                    style: bold16.copyWith(color: dark1),
                                  ),
                                  Text(
                                    'Ada fitur spesial memantimu setelah log in',
                                    textAlign: TextAlign.center,
                                    style: regular14.copyWith(color: dark2),
                                    maxLines: 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPageWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Log in Sekarang',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
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

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tempat Wisata',
                        style: bold16.copyWith(color: dark1),
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListTiketWisataWidget(),
                            ),
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

                // Generated code for this Row Widget...

                Container(
                  width: double.infinity,
                  height: 215,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Row(
                        children: [
                          // Generated code for this ListView Widget...
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Container(
                                    width: 160,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: Image.asset(
                                            'assets/images/611e162fed8b4.jpg',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => DetailWisataWidget(),
                                            //   ),
                                            // );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 10, 0),
                                                      child: Text(
                                                        'Kawah Ijen',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.8, -0.9),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 11,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 0, 0, 0),
                                                  child: Text(
                                                    'Lihat Foto',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 8,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Container(
                                    width: 160,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: Image.network(
                                            'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2023/04/27/pbbwsxog8mvlstcol1rq-1543110654.jpeg',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Sungai Tamborasi',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.8, -0.9),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 11,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 0, 0, 0),
                                                  child: Text(
                                                    'Lihat Foto',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 8,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Container(
                                    width: 160,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: Image.asset(
                                            'assets/images/tipang_169.jpeg',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Danau Toba',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.8, -0.9),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 11,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 0, 0, 0),
                                                  child: Text(
                                                    'Lihat Foto',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 8,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Container(
                                    width: 160,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Text(
                                          'Akhir dari section',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                        // children: [
                        //   FutureBuilder<ApiCallResponse>(
                        //     future: TiketWisataGroup.getTiketWisataCall.call(),
                        //     builder: (context, snapshot) {
                        //       // Customize what your widget looks like when it's loading.
                        //       if (!snapshot.hasData) {
                        //         return Center(
                        //             child: SingleChildScrollView(
                        //           scrollDirection: Axis.horizontal,
                        //           child: Row(
                        //             children: [
                        //               loadingCard(),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               loadingCard(),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               loadingCard(),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               loadingCard(),
                        //             ],
                        //           ),
                        //         ));
                        //       }
                        //       final listViewTourListResponse = snapshot.data!;
                        //       return Builder(
                        //         builder: (context) {
                        //           final jsonBody =
                        //               listViewTourListResponse.jsonBody;
                        //           if (jsonBody == null) {
                        //             // Handle the case when jsonBody is null (e.g., show an error message)
                        //             return Center(
                        //               child: Text("koneksi tidak stabil"),
                        //             );
                        //           }
                        //           final tempatWisata =
                        //               TiketWisataGroup.getTiketWisataCall
                        //                       .dataTiket(
                        //                         listViewTourListResponse
                        //                             .jsonBody,
                        //                       )
                        //                       ?.toList() ??
                        //                   [];
                        //           final filteredTempatWisata =
                        //               tempatWisata.where((item) {
                        //             final price =
                        //                 double.tryParse(item['price'] ?? "0");
                        //             return price != null && price != 0.0;
                        //           }).toList();
                        //           return ListView.builder(
                        //             padding: EdgeInsets.zero,
                        //             primary: false,
                        //             shrinkWrap: true,
                        //             scrollDirection: Axis.horizontal,
                        //             itemCount: filteredTempatWisata.length,
                        //             itemBuilder:
                        //                 (context, filteredTempatWisataIndex) {
                        //               final filteredTempatWisataItem =
                        //                   filteredTempatWisata[
                        //                       filteredTempatWisataIndex];
                        //               return Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     0, 0, 10, 0),
                        //                 child: Container(
                        //                   width: 160,
                        //                   height: 100,
                        //                   decoration: BoxDecoration(
                        //                     color: FlutterFlowTheme.of(context)
                        //                         .accent1,
                        //                     boxShadow: [
                        //                       BoxShadow(
                        //                         blurRadius: 4,
                        //                         color: Color(0x33000000),
                        //                         offset: Offset(0, 2),
                        //                       )
                        //                     ],
                        //                     borderRadius:
                        //                         BorderRadius.circular(7),
                        //                   ),
                        //                   child: Stack(
                        //                     children: [
                        //                       ClipRRect(
                        //                         borderRadius:
                        //                             BorderRadius.circular(7),
                        //                         child: Image.network(
                        //                           getJsonField(
                        //                             filteredTempatWisataItem,
                        //                             r'''$.banner''',
                        //                           )["400x350"],
                        //                           width: double.infinity,
                        //                           height: double.infinity,
                        //                           fit: BoxFit.cover,
                        //                         ),
                        //                       ),
                        //                       InkWell(
                        //                         onTap: () async {
                        //                           DateTime? startDate =
                        //                               FFAppState().startDate;

                        //                           String formattedStartDate =
                        //                               startDate != null
                        //                                   ? DateFormat(
                        //                                           'yyyy-MM-dd')
                        //                                       .format(startDate)
                        //                                   : formattedNow;

                        //                           Get.to(() =>
                        //                               BeliTiketWisataWidget(
                        //                                 dataTiket:
                        //                                     filteredTempatWisataItem,
                        //                                 startDate:
                        //                                     formattedStartDate,
                        //                               ));
                        //                         },
                        //                         child: Column(
                        //                           mainAxisSize:
                        //                               MainAxisSize.max,
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment.center,
                        //                           children: [
                        //                             Row(
                        //                               mainAxisSize:
                        //                                   MainAxisSize.max,
                        //                               mainAxisAlignment:
                        //                                   MainAxisAlignment
                        //                                       .center,
                        //                               children: [
                        //                                 Expanded(
                        //                                   child: Padding(
                        //                                     padding:
                        //                                         EdgeInsetsDirectional
                        //                                             .fromSTEB(
                        //                                                 10,
                        //                                                 0,
                        //                                                 10,
                        //                                                 0),
                        //                                     child: Text(
                        //                                         getJsonField(
                        //                                           filteredTempatWisataItem,
                        //                                           r'''$.title''',
                        //                                         ).toString(),
                        //                                         textAlign:
                        //                                             TextAlign
                        //                                                 .center,
                        //                                         style: regular16
                        //                                             .copyWith(
                        //                                                 color:
                        //                                                     white)),
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                       Align(
                        //                         alignment: AlignmentDirectional(
                        //                             0.80, -0.90),
                        //                         child: Container(
                        //                           width: 70,
                        //                           height: 20,
                        //                           decoration: BoxDecoration(
                        //                             color: FlutterFlowTheme.of(
                        //                                     context)
                        //                                 .accent4,
                        //                             borderRadius:
                        //                                 BorderRadius.circular(
                        //                                     30),
                        //                           ),
                        //                           child: Row(
                        //                             mainAxisSize:
                        //                                 MainAxisSize.max,
                        //                             mainAxisAlignment:
                        //                                 MainAxisAlignment
                        //                                     .center,
                        //                             children: [
                        //                               Icon(
                        //                                 Icons
                        //                                     .remove_red_eye_outlined,
                        //                                 color: FlutterFlowTheme
                        //                                         .of(context)
                        //                                     .primaryBackground,
                        //                                 size: 11,
                        //                               ),
                        //                               Padding(
                        //                                 padding:
                        //                                     EdgeInsetsDirectional
                        //                                         .fromSTEB(
                        //                                             2, 0, 0, 0),
                        //                                 child: Text(
                        //                                     'Lihat Foto',
                        //                                     style: regular10
                        //                                         .copyWith(
                        //                                             color:
                        //                                                 white)),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               );
                        //             },
                        //           );
                        //         },
                        //       );
                        //     },
                        //   ),
                        // ],
                      ),
                    ),
                  ),
                ),
                // Generated code for this ColumPenginapan Widget...
                Flexible(
                  flex: 20,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-0.95, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Text(
                                      'Penginapan',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 20, 0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         AListPenginapanSearchWidget(),
                                        //   ),
                                        // );
                                      },
                                      child: Text(
                                        'Lihat Semua',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              fontSize: 14,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 270,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: Container(
                                    width: 170,
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
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 0, 0, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) =>
                                                  //         BDetailPenginapanWidget(),
                                                  //   ),
                                                  // );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/0468dda1958ffed629fd4f7392cf1300.jpg',
                                                        width: double.infinity,
                                                        height: 130,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 0),
                                                      child: AutoSizeText(
                                                        'Rumah Paron Homestay Barat',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 15,
                                                            ),
                                                          ),
                                                          Text(
                                                            '4.8 ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
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
                                                            Text(
                                                              '(1234)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 1.23.123',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 450.000',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
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
                                                                'Rp 350.000',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
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
                                            Container(
                                              width: double.infinity,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Icon(
                                                        Icons.location_on,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 10,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Nama Kecamatan',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: Container(
                                    width: 170,
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
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 0, 0, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) =>
                                                  //         BDetailPenginapanWidget(),
                                                  //   ),
                                                  // );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/357349573.jpg',
                                                        width: double.infinity,
                                                        height: 130,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 0),
                                                      child: AutoSizeText(
                                                        'Komala Home',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 15,
                                                            ),
                                                          ),
                                                          Text(
                                                            '4.8 ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
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
                                                            Text(
                                                              '(1234)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 1.23.123',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 450.000',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
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
                                                                'Rp 450.000',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
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
                                            Container(
                                              width: double.infinity,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Icon(
                                                        Icons.location_on,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 10,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Nama Kecamatan',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: Container(
                                    width: 170,
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
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 0, 0, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) =>
                                                  //         BDetailPenginapanWidget(),
                                                  //   ),
                                                  // );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/pool-area.jpg',
                                                        width: double.infinity,
                                                        height: 130,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 0),
                                                      child: AutoSizeText(
                                                        'Norton Homestay',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 15,
                                                            ),
                                                          ),
                                                          Text(
                                                            '4.8 ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
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
                                                            Text(
                                                              '(1234)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 1.23.123',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 450.000',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
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
                                                                'Rp 310.000',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
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
                                            Container(
                                              width: double.infinity,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Icon(
                                                        Icons.location_on,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 10,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Nama Kecamatan',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: Container(
                                    width: 170,
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
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 0, 0, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //     builder: (context) =>
                                                  //         BDetailPenginapanWidget(),
                                                  //   ),
                                                  // );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/Cove-T63---Exterior-large.jpg',
                                                        width: double.infinity,
                                                        height: 130,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 5, 5, 0),
                                                      child: AutoSizeText(
                                                        'Cove T63',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 15,
                                                            ),
                                                          ),
                                                          Text(
                                                            '4.8 ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
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
                                                            Text(
                                                              '(1234)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 1.23.123',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            if (false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Rp. 450.000',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
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
                                                                'Rp 270.000',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
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
                                            Container(
                                              width: double.infinity,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Icon(
                                                        Icons.location_on,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 10,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Nama Kecamatan',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 3,
                                    child: Container(
                                      width: 150,
                                      height: 210,
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
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: Text(
                                              'Lihat Penginapan Lainnya',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 30,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: Icon(
                                              Icons.keyboard_arrow_right,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15,
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Penginapan',
                        style: bold16.copyWith(color: dark1),
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListPenginapanWidget(),
                            ),
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

                Container(
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<ApiCallResponse>(
                    future: HomestayGroup.homestayListCall.call(
                      accessToken: FFAppState().accessToken,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  loadingCard(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  loadingCard(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  loadingCard(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  loadingCard(),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      final listViewHomestayListResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final jsonBody =
                              listViewHomestayListResponse.jsonBody;
                          if (jsonBody == null) {
                            // Handle the case when jsonBody is null (e.g., show an error message)
                            return Center(
                              child: Text("koneksi tidak stabil"),
                            );
                          }
                          final homestayList = (HomestayGroup.homestayListCall
                                      .homestayData(
                                        listViewHomestayListResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [])
                              .take(4)
                              .toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homestayList.length,
                            itemBuilder: (context, homestayListIndex) {
                              final homestayListItem =
                                  homestayList[homestayListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  homestayListIndex == 0
                                      ? 20
                                      : 0, // Jarak 20 untuk kartu pertama, 5 untuk yang lainnya
                                  0,
                                  0,
                                  0,
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: Container(
                                    width: 160.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0.r,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(6.0.r),
                                    ),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      1.0, 0.0, 0.0, 0.0.sp),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (homestayListItem[
                                                              'title'] !=
                                                          null &&
                                                      homestayListItem[
                                                              'gallery'] !=
                                                          null) {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailPenginapanWidget(
                                                          hid: getJsonField(
                                                            homestayListItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          homestayData:
                                                              homestayListItem,
                                                          startDate:
                                                              valueOrDefault<
                                                                  String>(
                                                            functions.formatDate(
                                                                formattedStartdate),
                                                            'null',
                                                          ),
                                                          endDate:
                                                              valueOrDefault<
                                                                  String>(
                                                            functions.formatDate(
                                                                formattedEndate),
                                                            'null',
                                                          ),
                                                          rooms: '1',
                                                          guests: '2',
                                                          terms: getJsonField(
                                                            homestayListItem,
                                                            r'''$.terms_by_attribute_in_listing_page''',
                                                          ),
                                                          mapLat: double.parse(
                                                              getJsonField(
                                                            homestayListItem,
                                                            r'''$.map_lat''',
                                                          ).toString()),
                                                          mapLng: double.parse(
                                                              getJsonField(
                                                            homestayListItem,
                                                            r'''$.map_lng''',
                                                          ).toString()),
                                                          locationLatLng: functions
                                                              .locationLatLng(
                                                                  double.parse(
                                                                      getJsonField(
                                                                    homestayListItem,
                                                                    r'''$.map_lat''',
                                                                  ).toString()),
                                                                  double.parse(
                                                                      getJsonField(
                                                                    homestayListItem,
                                                                    r'''$.map_lng''',
                                                                  ).toString()))!,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    Get.to(() =>
                                                        ListPenginapanWidget());
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                      child: homestayListItem[
                                                                      'banner'] !=
                                                                  null &&
                                                              homestayListItem[
                                                                      'banner'] !=
                                                                  ''
                                                          ? Image.network(
                                                              getJsonField(
                                                                homestayListItem,
                                                                r'''$.banner''',
                                                              )['400x350'],
                                                              width: double
                                                                  .infinity,
                                                              height: 130.0,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Image.network(
                                                              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fokcredit-blog-images-prod.storage.googleapis.com%2F2021%2F02%2Fhomestay3.jpg&f=1&nofb=1&ipt=f2ca02e81d6e1ecbcd0abaabe23e1d6d772c9995065222fa134109b4e5afa25e&ipo=images',
                                                              width: double
                                                                  .infinity,
                                                              height: 130.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  0.0.sp),
                                                      child: Text(
                                                        homestayListItem[
                                                                    'title'] !=
                                                                null
                                                            ? getJsonField(
                                                                homestayListItem,
                                                                r'''$.title''',
                                                              )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                  maxChars: 30,
                                                                  replacement:
                                                                      '…',
                                                                )
                                                            : homestayListItem[
                                                                    'business_name']
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        30,
                                                                    replacement:
                                                                        '…'),
                                                        style:
                                                            semibold14.copyWith(
                                                                color: dark2),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  2.0,
                                                                  5.0,
                                                                  5.0.sp),
                                                      child: Text(
                                                        homestayListItem[
                                                                'business_name']
                                                            .toString()
                                                            .maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…'),
                                                        style: regular12_5
                                                            .copyWith(
                                                                color: dark2),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0.sp),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0.sp),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .solidStar,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 10.0.sp,
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              homestayListItem,
                                                              r'''$.review_score''',
                                                            ).toString(),
                                                            style: regular10
                                                                .copyWith(
                                                                    color:
                                                                        dark2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0.sp),
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
                                                                        0.0.sp),
                                                            child: Icon(
                                                              Icons.location_on,
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  65, 64, 64),
                                                              size: 10.0.sp,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              getJsonField(
                                                                homestayListItem,
                                                                r'''$.location.name''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        95,
                                                                        95,
                                                                        95),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    10.0.sp,
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
                                                                    00.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0.sp),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (getJsonField(
                                                                  homestayListItem,
                                                                  r'''$.sale_price''',
                                                                ) !=
                                                                null)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0.sp),
                                                                child: Text(
                                                                  formatNumber(
                                                                    double.parse(
                                                                        getJsonField(
                                                                      homestayListItem,
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
                                                                  homestayListItem,
                                                                  r'''$.sale_price''',
                                                                ) !=
                                                                null)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0.sp),
                                                                child: Text(
                                                                  formatNumber(
                                                                    double.parse(
                                                                        getJsonField(
                                                                      homestayListItem,
                                                                      r'''$.sale_price''',
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
                                                                      homestayListItem,
                                                                      r'''$.sale_price''',
                                                                    ) ==
                                                                    null &&
                                                                double.parse(
                                                                        getJsonField(
                                                                      homestayListItem,
                                                                      r'''$.price''',
                                                                    ).toString()) !=
                                                                    0.0)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0.sp),
                                                                child: Text(
                                                                  formatNumber(
                                                                    double.parse(
                                                                        getJsonField(
                                                                      homestayListItem,
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
                                        // Padding(
                                        //   padding: EdgeInsetsDirectional
                                        //       .fromSTEB(
                                        //           100, 100, -0, 20),
                                        //   child: WishlistWidget(
                                        //     key: Key(
                                        //         'Key4cm_${homestayListIndex}_of_${homestayList.length}'),
                                        //   ),
                                        // ),
                                        // Align(
                                        //   alignment: AlignmentDirectional(
                                        //       0.89, -0.14),
                                        //   child: FaIcon(
                                        //     Icons.favorite_border,
                                        //     color: FlutterFlowTheme.of(
                                        //             context)
                                        //         .primaryBackground,
                                        //     size: 20.0,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'UMKM',
                        style: bold16.copyWith(color: dark1),
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeUMKMWidget(
                                dataPage: 'HomeUMKMWidget()',
                              ),
                            ),
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
                Container(
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(),
                  child: FutureBuilder<ApiCallResponse>(
                    future: FFAppState().umkmData(
                      requestFn: () => UmkmGroup.listProdukUMKMCall.call(),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                loadingCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                loadingCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                loadingCard(),
                                SizedBox(
                                  width: 10,
                                ),
                                loadingCard(),
                              ],
                            ),
                          ),
                        );
                      }
                      final listViewListProdukUMKMResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final jsonBody =
                              listViewListProdukUMKMResponse.jsonBody;
                          if (jsonBody == null) {
                            // Handle the case when jsonBody is null (e.g., show an error message)
                            return Center(
                              child: Text("koneksi tidak stabil"),
                            );
                          }
                          final listUmkm = listViewListProdukUMKMResponse
                              .jsonBody
                              .toList()
                              .take(3)
                              .toList();
                          final random = Random();
                          listUmkm.shuffle(random);
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listUmkm.length,
                            itemBuilder: (context, listUmkmIndex) {
                              final listUmkmItem = listUmkm[listUmkmIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  listUmkmIndex == 0 ? 20.0 : 2.0,
                                  0.0,
                                  0.0,
                                  0.0.sp,
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: Container(
                                    width: 160.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius:
                                          BorderRadius.circular(6.0.r),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0.r,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            InkWell(
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
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(
                                                              0.0.r),
                                                      bottomRight:
                                                          Radius.circular(
                                                              0.0.r),
                                                      topLeft: Radius.circular(
                                                          8.0.r),
                                                      topRight: Radius.circular(
                                                          8.0.r),
                                                    ),
                                                    child: Image.network(
                                                      getJsonField(
                                                        listUmkmItem,
                                                        r'''$.banner''',
                                                      )['400x350'],
                                                      width: double.infinity,
                                                      height: 140.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 0.0.sp),
                                                    child: Text(
                                                      getJsonField(
                                                        listUmkmItem,
                                                        r'''$.name''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 30,
                                                            replacement: '…',
                                                          ),
                                                      style:
                                                          semibold14.copyWith(
                                                              color: dark2),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0.sp),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0.sp),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .solidStar,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 10.0.sp,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            '(Belum ada review)',
                                                            style: regular10
                                                                .copyWith(
                                                                    color:
                                                                        dark2),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                0.0, 0.0.sp),
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
                                                                      0.0.sp),
                                                          child: Icon(
                                                            Icons.location_on,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                65, 64, 64),
                                                            size: 10.0.sp,
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
                                                                  .fromARGB(255,
                                                                  65, 64, 64),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.0.sp,
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
                                                                  00.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0.sp),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          if (getJsonField(
                                                                listUmkmItem,
                                                                r'''$.discount''',
                                                              ) !=
                                                              '0.00')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0.sp),
                                                              child: Text(
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
                                                            ),
                                                          if (getJsonField(
                                                                listUmkmItem,
                                                                r'''$.discount''',
                                                              ) !=
                                                              '0.00')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0.sp),
                                                              child: Text(
                                                                formatNumber(
                                                                  double.parse(
                                                                      getJsonField(
                                                                    listUmkmItem,
                                                                    r'''$.discount''',
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
                                                                listUmkmItem,
                                                                r'''$.discount''',
                                                              ) ==
                                                              '0.00')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0.sp),
                                                              child: Text(
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
                                        // Padding(
                                        //   padding: EdgeInsetsDirectional
                                        //       .fromSTEB(
                                        //           100, 100, -0, 20),
                                        //   child: WishlistWidget(
                                        //     key: Key(
                                        //         'Key4cm_${homestayListIndex}_of_${homestayList.length}'),
                                        //   ),
                                        // ),
                                        // Align(
                                        //   alignment: AlignmentDirectional(
                                        //       0.89, -0.14),
                                        //   child: FaIcon(
                                        //     Icons.favorite_border,
                                        //     color: FlutterFlowTheme.of(
                                        //             context)
                                        //         .primaryBackground,
                                        //     size: 20.0,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeMakananWidget(),
                            ),
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

                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Generated code for this Row Widget...
                      // Generated code for this Row Widget...
                      // Generated code for this Row Widget...

                      Container(
                        width: double.infinity,
                        height: 270.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0.sp),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: FFAppState().tokoMakanan(
                                    requestFn: () => MakananMinumanGroup
                                        .getTokoMakananCall
                                        .call(),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      //return Custom Widget,
                                      return Center(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              loadingCard(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              loadingCard(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              loadingCard(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              loadingCard(),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                    final rowGetMakananResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final jsonBody =
                                            rowGetMakananResponse.jsonBody;
                                        if (jsonBody == null) {
                                          // Handle the case when jsonBody is null (e.g., show an error message)
                                          return Center(
                                            child: Text("koneksi tidak stabil"),
                                          );
                                        }
                                        final dataMakananRec =
                                            rowGetMakananResponse.jsonBody
                                                .toList()
                                                .take(3)
                                                .toList();

                                        final random = Random();
                                        dataMakananRec.shuffle(random);
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: dataMakananRec.length,
                                          itemBuilder:
                                              (context, dataMakananRecIndex) {
                                            final dataMakananRecItem =
                                                dataMakananRec[
                                                    dataMakananRecIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                dataMakananRecIndex == 0
                                                    ? 20.0
                                                    : 2.0,
                                                0.0,
                                                0.0,
                                                0.0.sp,
                                              ),
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 3.0,
                                                child: Container(
                                                  width: 160,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0.r,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0.r),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          InkWell(
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
                                                                          DetailRestoWidget(
                                                                    createUser: getJsonField(
                                                                        dataMakananRecItem,
                                                                        r'''$.create_user'''),
                                                                    dataToko:
                                                                        dataMakananRecItem,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0.r),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0.r),
                                                                  ),
                                                                  child: Center(
                                                                    child: dataMakananRecItem['banner'] !=
                                                                                null &&
                                                                            dataMakananRecItem['banner'] !=
                                                                                ''
                                                                        ? Image
                                                                            .network(
                                                                            getJsonField(
                                                                              dataMakananRecItem,
                                                                              r'''$.banner''',
                                                                            ),
                                                                            height:
                                                                                130.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) {
                                                                              return Image.network(
                                                                                'https://cdn2.iconfinder.com/data/icons/building-vol-2/512/restaurant-512.png',
                                                                                height: 130.0,
                                                                                fit: BoxFit.cover,
                                                                              );
                                                                            },
                                                                          )
                                                                        : Image
                                                                            .network(
                                                                            'https://cdn2.iconfinder.com/data/icons/building-vol-2/512/restaurant-512.png',
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                130.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0.sp),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        dataMakananRecItem,
                                                                        r'''$.business_name''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                30,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      style: semibold12_5.copyWith(
                                                                          color:
                                                                              dark2),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      RichText(
                                                                        text:
                                                                            TextSpan(
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .warning,
                                                                        size:
                                                                            17,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          '${getJsonField(
                                                                            dataMakananRecItem,
                                                                            r'''$.review''',
                                                                          )}',
                                                                          style:
                                                                              regular10.copyWith(color: dark2),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0.sp),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0.sp),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .location_on,
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              65,
                                                                              64,
                                                                              64),
                                                                          size:
                                                                              10.0.sp,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            dataMakananRecItem,
                                                                            r'''$.location_name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                65,
                                                                                64,
                                                                                64),
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                10.0.sp,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       EdgeInsetsDirectional
                                                      //           .fromSTEB(100,
                                                      //               89, -0, 0),
                                                      //   child: WishlistWidget(
                                                      //     key: Key(
                                                      //         'Key4cm_${tourListIndex}_of_${tourList.length}'),
                                                      //   ),
                                                      // ),
                                                      // // Align(
                                                      // //   alignment:
                                                      // //       AlignmentDirectional(
                                                      // //           0.84, -0.15),
                                                      // //   child: FaIcon(
                                                      // //     FontAwesomeIcons
                                                      // //         .bookmark,
                                                      // //     color: FlutterFlowTheme
                                                      // //             .of(context)
                                                      // //         .primaryBackground,
                                                      // //     size: 20.0,
                                                      // //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transportasi',
                        style: bold16.copyWith(color: dark1),
                      ),
                      InkWell(
                        onTap: () async {
                          Get.to(
                            () => HomeKendaraanWidget(
                                dataPage: 'HomeKendaraanWidget()'),
                            arguments: {'dataPage': 'HomeKendaraanWidget()'},
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0.sp),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dengan supir?',
                        style: regular14.copyWith(color: dark1),
                      ),
                      Switch.adaptive(
                        value: _model.switchValue ??= true,
                        // onChanged: (newValue) async {
                        //   setState(
                        //       () => _model.switchValue = newValue!);
                        // },
                        onChanged: (newValue) async {
                          setState(() => _model.switchValue = newValue);
                          await _updatePrices();
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 270,
                      decoration: BoxDecoration(),
                      child: FutureBuilder<ApiCallResponse>(
                        future: RentGroup.rentListCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    loadingCard(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    loadingCard(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    loadingCard(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    loadingCard(),
                                  ],
                                ),
                              ),
                            );
                          }
                          final rowRentListResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final jsonBody = rowRentListResponse.jsonBody;
                              if (jsonBody == null) {
                                // Handle the case when jsonBody is null (e.g., show an error message)
                                return Center(
                                  child: Text("koneksi tidak stabil"),
                                );
                              }
                              final rentList = (RentGroup.rentListCall
                                          .dataRent(
                                            rowRentListResponse.jsonBody,
                                          )
                                          ?.toList() ??
                                      [])
                                  .take(3)
                                  .toList();
                              // print(rentList);
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: rentList.length,
                                itemBuilder: (context, rentListIndex) {
                                  final rentListItem = rentList[rentListIndex];
                                  // print(rentListItem);
                                  var prices =
                                      json.decode(rentListItem['prices']);
                                  // print('ini harga sat: $prices');
                                  var selectedPriceKey =
                                      _model.switchValue == true
                                          ? 'driver'
                                          : 'nodriver';
                                  var selectedPrice = prices[selectedPriceKey];
                                  var displayPrice = selectedPrice != null
                                      ? NumberFormat.currency(
                                                  locale: 'id',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(
                                                  int.parse(selectedPrice)) +
                                          '/hari'
                                      : 'Driver tidak tersedia';

                                  Text(
                                    displayPrice,
                                    style: semibold14.copyWith(color: red1),
                                  );

                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      rentListIndex == 0 ? 20.0 : 2.0,
                                      0.0,
                                      0.0,
                                      0.0.sp,
                                    ),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      child: Container(
                                        width: 160.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0.r,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(6.0.r),
                                        ),
                                        child: Stack(
                                          children: [
                                            Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailTranspotasiMobilWidget(
                                                          rentData:
                                                              rentListItem,
                                                        ),
                                                      ),
                                                    );
                                                  },
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
                                                                  0.0.r),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0.r),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0.r),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0.r),
                                                        ),
                                                        child: Image.network(
                                                          getJsonField(
                                                            rentListItem,
                                                            r'''$.banner''',
                                                          )['200x150'],
                                                          width:
                                                              double.infinity,
                                                          height: 130.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    0.0.sp),
                                                        child: Text(
                                                          getJsonField(
                                                            rentListItem,
                                                            r'''$.title''',
                                                          )
                                                              .toString()
                                                              .maybeHandleOverflow(
                                                                maxChars: 30,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                          style: semibold12_5
                                                              .copyWith(
                                                                  color: dark2),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    0.0.sp),
                                                        child: Text(
                                                          '${getJsonField(rentListItem, r'''$.passenger''').toString()} Kursi',
                                                          style: regular12_5
                                                              .copyWith(
                                                                  color: dark2),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0.sp),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0.sp),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidStar,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                                size: 10.0.sp,
                                                              ),
                                                            ),
                                                            if (getJsonField(
                                                                    rentListItem,
                                                                    r'''$.review_score''') !=
                                                                null)
                                                              Text(
                                                                getJsonField(
                                                                  rentListItem,
                                                                  r'''$.review_score''',
                                                                ).toString(),
                                                                style: regular10
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                            if (getJsonField(
                                                                        rentListItem,
                                                                        r'''$.review_score''') ==
                                                                    null ||
                                                                getJsonField(
                                                                        rentListItem,
                                                                        r'''$.review_score''') ==
                                                                    0)
                                                              Text(
                                                                '0',
                                                                style: regular10
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    0.0.sp),
                                                        child: Text(
                                                          '${getJsonField(rentListItem, r'''$.location.name''').toString()}',
                                                          style: regular12_5
                                                              .copyWith(
                                                                  color: dark2),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      00.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0.sp),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              // if (getJsonField(
                                                              //       rentListItem,
                                                              //       r'''$.sale_price''',
                                                              //     ) !=
                                                              //     null)
                                                              //   Padding(
                                                              //     padding: EdgeInsetsDirectional.fromSTEB(
                                                              //         0.0,
                                                              //         5.0,
                                                              //         0.0,
                                                              //         0.0.sp),
                                                              //     child:
                                                              //         Text(
                                                              //       formatNumber(
                                                              //         double.parse(getJsonField(
                                                              //           rentListItem,
                                                              //           r'''$.price''',
                                                              //         ).toString()),
                                                              //         formatType:
                                                              //             FormatType.decimal,
                                                              //         decimalType:
                                                              //             DecimalType.commaDecimal,
                                                              //         currency:
                                                              //             'Rp ',
                                                              //       ),
                                                              //       style: FlutterFlowTheme.of(context)
                                                              //           .bodySmall
                                                              //           .override(
                                                              //             fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                              //             color: FlutterFlowTheme.of(context).secondary,
                                                              //             decoration: TextDecoration.lineThrough,
                                                              //             useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                              //           ),
                                                              //     ),
                                                              //   ),
                                                              // if (getJsonField(
                                                              //       rentListItem,
                                                              //       r'''$.sale_price''',
                                                              //     ) !=
                                                              //     null)
                                                              //   Padding(
                                                              //     padding: EdgeInsetsDirectional.fromSTEB(
                                                              //         5.0,
                                                              //         0.0,
                                                              //         0.0,
                                                              //         0.0.sp),
                                                              //     child:
                                                              //         Text(
                                                              //       formatNumber(
                                                              //         double.parse(getJsonField(
                                                              //           rentListItem,
                                                              //           r'''$.sale_price''',
                                                              //         ).toString()),
                                                              //         formatType:
                                                              //             FormatType.decimal,
                                                              //         decimalType:
                                                              //             DecimalType.commaDecimal,
                                                              //         currency:
                                                              //             'Rp ',
                                                              //       ),
                                                              //       style: FlutterFlowTheme.of(context)
                                                              //           .bodyLarge
                                                              //           .override(
                                                              //             fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                              //             color: FlutterFlowTheme.of(context).error,
                                                              //             fontWeight: FontWeight.w600,
                                                              //             useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                              //           ),
                                                              //     ),
                                                              //   ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0.sp),
                                                                child: Text(
                                                                  // formatNumber(
                                                                  //   double.parse(
                                                                  //       getJsonField(
                                                                  //     rentListItem,
                                                                  //     r'''$.price''',
                                                                  //   ).toString()),
                                                                  //   formatType:
                                                                  //       FormatType.decimal,
                                                                  //   decimalType:
                                                                  //       DecimalType.commaDecimal,
                                                                  //   currency:
                                                                  //       'Rp ',
                                                                  // ),
                                                                  displayPrice,
                                                                  style: semibold14
                                                                      .copyWith(
                                                                          color:
                                                                              red1),
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
                                            // Padding(
                                            //   padding: EdgeInsetsDirectional
                                            //       .fromSTEB(
                                            //           100, 100, -0, 20),
                                            //   child: WishlistWidget(
                                            //     key: Key(
                                            //         'Key4cm_${homestayListIndex}_of_${homestayList.length}'),
                                            //   ),
                                            // ),
                                            // Align(
                                            //   alignment: AlignmentDirectional(
                                            //       0.89, -0.14),
                                            //   child: FaIcon(
                                            //     Icons.favorite_border,
                                            //     color: FlutterFlowTheme.of(
                                            //             context)
                                            //         .primaryBackground,
                                            //     size: 20.0,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

Widget loadingCard() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      height: 200,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
