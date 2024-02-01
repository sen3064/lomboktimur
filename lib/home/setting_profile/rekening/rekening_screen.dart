import 'package:kolaka/core/constants/listBank.dart';
import 'package:kolaka/core/helpers/currency_format.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kolaka/components/reusable_appbar.dart';
import 'package:kolaka/core/constants/storage.dart';
import 'package:kolaka/core/helpers/common_helper.dart';
import 'package:kolaka/flutter_flow/flutter_flow_theme.dart';
import 'package:kolaka/flutter_flow/flutter_flow_widgets.dart';
import 'package:kolaka/home/setting_profile/user_controller.dart';
import 'package:intl/intl.dart';

class RekeningScreen extends GetView<UserController> {
  const RekeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(userStorage.read('user_rekening'));
    Get.isRegistered<UserController>()
        ? Get.find<UserController>()
        : Get.put(UserController());
    List wd = userStorage.read('withdrawals') ?? [];
    CommonHelper.logPrint(wd);
    return GetBuilder<UserController>(
        init: UserController(),
        // initState: (_) => controller.initRekening(),
        builder: (_) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: ReusableAppBar(
              title: 'Dompet Saya',
              onBack: () => Get.back(),
            ),
            body: SafeArea(
              top: true,
              child: RefreshIndicator(
                onRefresh: () async => controller.refreshData(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Obx(
                    () => controller.isLoading.isTrue
                        ? SizedBox(
                            width: Get.width,
                            height: Get.height,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ))
                        : Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 245, 50, 11),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(20, 30, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.moneyBill1,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  size: 24,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          20, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Jumlah Saldo Refund',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        CurrencyFormat.convertToIdr(
                                                            double.parse(
                                                                userStorage.read(
                                                                        'user_wallet')[
                                                                    'balance']),
                                                            0),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
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
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 10, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Icon(
                                              Icons.access_time,
                                              color: Color.fromARGB(
                                                  255, 245, 50, 11),
                                              size: 24,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                10, 0, 0, 0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child:
                                                              ExpandableNotifier(
                                                            initialExpanded:
                                                                false,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Text(
                                                                  'Riwayat Penarikan',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
                                                                collapsed:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                ),
                                                                expanded:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-0.05, -1),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                                                              child: Container(
                                                                                width: 12,
                                                                                height: 12,
                                                                                decoration: const BoxDecoration(
                                                                                  color: Color.fromARGB(255, 245, 50, 11),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    RichText(
                                                                                      text: TextSpan(
                                                                                        children: const [
                                                                                          TextSpan(
                                                                                            // text: DateFormat('D, d M Y').format(DateTime.parse(updatedAt)),
                                                                                            text: 'Rabu, 21 Mei 2023',
                                                                                            style: TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                    RichText(
                                                                                      text: TextSpan(
                                                                                        children: const [
                                                                                          TextSpan(
                                                                                            text: 'Status penarikan di proses',
                                                                                            style: TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Rp 1.000.000',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                theme:
                                                                    const ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
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
                                    Divider(
                                      thickness: 1,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Icon(
                                                  Icons.account_balance_wallet,
                                                  color: Color.fromARGB(
                                                      255, 245, 50, 11),
                                                  size: 24,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child:
                                                                  ExpandableNotifier(
                                                                initialExpanded:
                                                                    false,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10.0),
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Text(
                                                                      'Tambah/Ganti no. rekening',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                          ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                    ),
                                                                    expanded:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                          child: DropdownSearch<Map<String, dynamic>>(
                                                                                            items: listBank,
                                                                                            // popupTitle: Container(
                                                                                            //   padding: EdgeInsets.all(8.0),
                                                                                            //   child: Text("Pilih Bank"),
                                                                                            // ),
                                                                                            itemAsString: (item) => item['channel_name'] as String,
                                                                                            selectedItem: controller.selectedBankIndex!=null? listBank[controller.selectedBankIndex!] : null,
                                                                                            onChanged: (value) {
                                                                                              print(value);
                                                                                            },
                                                                                            dropdownDecoratorProps: DropDownDecoratorProps(
                                                                                              dropdownSearchDecoration: InputDecoration(
                                                                                                labelText: 'Bank',
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                                hintText: 'Nama Bank',
                                                                                                hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    width: 2,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    width: 2,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                    width: 2,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                suffixIcon: controller.selectedBank.isNotEmpty
                                                                                                    ? InkWell(
                                                                                                        onTap: () async {
                                                                                                          controller.selectedBank = '';
                                                                                                          controller.update();
                                                                                                        },
                                                                                                        child: const Icon(
                                                                                                          Icons.clear,
                                                                                                          size: 20,
                                                                                                        ),
                                                                                                      )
                                                                                                    : null,
                                                                                              ),
                                                                                            ),
                                                                                            // popupProps: PopupProps.bottomSheet(bottomSheetProps: BottomSheetProps(elevation: 16, backgroundColor: Color(0xFFAADCEE))),
                                                                                            // showSearchBox: true,
                                                                                            // searchBoxDecoration: InputDecoration(
                                                                                            //   hintText: "Cari Bank",
                                                                                            // ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                          child: TextFormField(
                                                                                            controller: controller.namaRek,
                                                                                            // onChanged: (_) {},
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelText: 'Nama pemilik rekening',
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                              hintText: 'Nama pemilik rekening',
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              suffixIcon: controller.noRek.text.isNotEmpty
                                                                                                  ? InkWell(
                                                                                                      onTap: () async {
                                                                                                        controller.noRek.clear();
                                                                                                        controller.update();
                                                                                                      },
                                                                                                      child: const Icon(
                                                                                                        Icons.clear,
                                                                                                        size: 20,
                                                                                                      ),
                                                                                                    )
                                                                                                  : null,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            keyboardType: TextInputType.number,
                                                                                            // validator: _model.textController1Validator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                          child: TextFormField(
                                                                                            controller: controller.noRek,
                                                                                            // onChanged: (_) {},
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelText: 'No rekening',
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                              hintText: 'No rekening',
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 2,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                              suffixIcon: controller.noRek.text.isNotEmpty
                                                                                                  ? InkWell(
                                                                                                      onTap: () async {
                                                                                                        controller.noRek.clear();
                                                                                                        controller.update();
                                                                                                      },
                                                                                                      child: const Icon(
                                                                                                        Icons.clear,
                                                                                                        size: 20,
                                                                                                      ),
                                                                                                    )
                                                                                                  : null,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            keyboardType: TextInputType.number,
                                                                                            // validator: _model.textController1Validator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () {
                                                                                              CommonHelper.implementedMethod();
                                                                                            },
                                                                                            text: 'Simpan',
                                                                                            options: FFButtonOptions(
                                                                                              width: double.infinity,
                                                                                              height: 40,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                              color: const Color.fromARGB(255, 245, 50, 11),
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                    color: Colors.white,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                  ),
                                                                                              elevation: 3,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 1,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8),
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    theme:
                                                                        const ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                      expandIcon:
                                                                          Icons
                                                                              .add_box,
                                                                      collapseIcon:
                                                                          Icons
                                                                              .close,
                                                                      iconColor:
                                                                          Color(
                                                                              0xFF5BBDD3),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsetsDirectional.fromSTEB(
                                    //           20, 0, 20, 0),
                                    //   child: Column(
                                    //     mainAxisSize: MainAxisSize.max,
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Row(
                                    //         mainAxisSize: MainAxisSize.max,
                                    //         crossAxisAlignment:
                                    //             CrossAxisAlignment.start,
                                    //         children: [
                                    //           const Icon(
                                    //             Icons
                                    //                 .account_balance_wallet_rounded,
                                    //             color: Color.fromARGB(
                                    //                 255, 245, 50, 11),
                                    //             size: 24,
                                    //           ),
                                    //           Expanded(
                                    //             child: Padding(
                                    //               padding:
                                    //                   const EdgeInsetsDirectional
                                    //                       .fromSTEB(
                                    //                       10, 0, 0, 0),
                                    //               child: Column(
                                    //                 mainAxisSize:
                                    //                     MainAxisSize.max,
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   Text(
                                    //                     'Rekening penarikan',
                                    //                     style:
                                    //                         FlutterFlowTheme.of(
                                    //                                 context)
                                    //                             .bodyMedium
                                    //                             .override(
                                    //                               fontFamily: FlutterFlowTheme.of(
                                    //                                       context)
                                    //                                   .bodyMediumFamily,
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w500,
                                    //                               useGoogleFonts: GoogleFonts
                                    //                                       .asMap()
                                    //                                   .containsKey(
                                    //                                       FlutterFlowTheme.of(context)
                                    //                                           .bodyMediumFamily),
                                    //                             ),
                                    //                   ),
                                    //                   Row(
                                    //                     mainAxisSize:
                                    //                         MainAxisSize.max,
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .spaceBetween,
                                    //                     children: [
                                    //                       Text(
                                    //                         'Virtual Account BCA',
                                    //                         style: FlutterFlowTheme
                                    //                                 .of(context)
                                    //                             .bodyMedium,
                                    //                       ),
                                    //                       // ClipRRect(
                                    //                       //   borderRadius:
                                    //                       //       BorderRadius
                                    //                       //           .circular(
                                    //                       //               8),
                                    //                       //   child: Image.asset(
                                    //                       //     'assets/images/Bank_Central_Asia.jpg',
                                    //                       //     width: 60,
                                    //                       //     height: 50,
                                    //                       //     fit: BoxFit
                                    //                       //         .contain,
                                    //                       //   ),
                                    //                       // ),
                                    //                     ],
                                    //                   ),
                                    //                   Text(
                                    //                     '12345789',
                                    //                     style:
                                    //                         FlutterFlowTheme.of(
                                    //                                 context)
                                    //                             .bodyMedium
                                    //                             .override(
                                    //                               fontFamily: FlutterFlowTheme.of(
                                    //                                       context)
                                    //                                   .bodyMediumFamily,
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w600,
                                    //                               useGoogleFonts: GoogleFonts
                                    //                                       .asMap()
                                    //                                   .containsKey(
                                    //                                       FlutterFlowTheme.of(context)
                                    //                                           .bodyMediumFamily),
                                    //                             ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Divider(
                                    //   thickness: 1,
                                    //   color:
                                    //       FlutterFlowTheme.of(context).accent4,
                                    // ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(20, 0, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const FaIcon(
                                                  FontAwesomeIcons.moneyBill1,
                                                  color: Color.fromARGB(
                                                      255, 245, 50, 11),
                                                  size: 24,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            10, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          'Jumlah penarikan dana',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 200,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0, 8, 0, 8),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    controller
                                                                        .amount,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Penarikan dana',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge,
                                                                  hintText:
                                                                      'Penarikan dana',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                // validator: _model
                                                                //     .textController2Validator
                                                                //     .asValidator(
                                                                //         context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '*Minimal penarikan dana Rp. 100.000',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 2),
                                                spreadRadius: 4,
                                              )
                                            ],
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(20, 20, 20, 20),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1, -1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 10, 0, 0),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'PENTING! ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black600,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            const TextSpan(
                                                              text:
                                                                  'Mohon pastikan no. rekening anda dan jumlah penarikan sudah sesuai.',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 10, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      Get.back();
                                                    },
                                                    text: 'Tarik dana',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 0, 0, 0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 0, 0, 0),
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 245, 50, 11),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              21),
                                                    ),
                                                    showLoadingIndicator: false,
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
                            ],
                          ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
