import 'package:get/get.dart';
import 'package:kelotimaja/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'scan_page_model.dart';
export 'scan_page_model.dart';

class ScanPageWidget extends StatefulWidget {
  const ScanPageWidget({Key? key, this.isScannedValue}) : super(key: key);

  final String? isScannedValue;

  @override
  _ScanPageWidgetState createState() => _ScanPageWidgetState();
}

class _ScanPageWidgetState extends State<ScanPageWidget> {
  late ScanPageModel _model;
  TextEditingController namaController = TextEditingController(
      text: FFAppState().accessToken.isEmpty
          ? ''
          : FFAppState().userData['name']);
  TextEditingController dewasaController = TextEditingController(text: '1');
  TextEditingController anakController = TextEditingController(text: '0');
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode? textFieldFocusNode1;
  FocusNode? textFieldFocusNode2;
  FocusNode? textFieldFocusNode3;
  FocusNode? textFieldFocusNode4;
  FocusNode? textFieldFocusNode5;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(40, 30, 20, 10),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x00F6F5F5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
                            child: Text(
                              'Terima Kasih',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ),
                          Text(
                            'Untuk berkunjung di tempat wisata ',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Text(
                              'Mohon untuk mengisi data wisatawan ',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/scan01.png',
                              width: 300,
                              height: 264,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Silahkan mengisi data dibawah untuk  ',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Text(
                              'memasuki area wisata ',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Text(
                              'Data Wisatawan',
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0x7FD6D6D6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.person,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: namaController,
                                        focusNode: textFieldFocusNode1,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Nama ',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                color: Color(0xFFBDBDBD),
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
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
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           width: double.infinity,
                    //           height: 50,
                    //           decoration: BoxDecoration(
                    //             color: Color(0xFFFAFAFA),
                    //             borderRadius: BorderRadius.circular(12),
                    //             border: Border.all(
                    //               color: Color(0x7FD6D6D6),
                    //             ),
                    //           ),
                    //           child: Padding(
                    //             padding: EdgeInsetsDirectional.fromSTEB(
                    //                 12, 0, 12, 0),
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.max,
                    //               children: [
                    //                 Padding(
                    //                   padding: EdgeInsetsDirectional.fromSTEB(
                    //                       0, 0, 10, 0),
                    //                   child: Icon(
                    //                     Icons.person,
                    //                     color: FlutterFlowTheme.of(context)
                    //                         .secondary,
                    //                     size: 24,
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: TextFormField(
                    //                     controller: dewasaController,
                    //                     focusNode: textFieldFocusNode2,
                    //                     autofocus: true,
                    //                     obscureText: false,
                    //                     decoration: InputDecoration(
                    //                       hintText: 'Jumlah wisatawan dewasa',
                    //                       hintStyle: FlutterFlowTheme.of(
                    //                               context)
                    //                           .bodySmall
                    //                           .override(
                    //                             fontFamily:
                    //                                 FlutterFlowTheme.of(context)
                    //                                     .bodySmallFamily,
                    //                             color: Color(0xFFBDBDBD),
                    //                             useGoogleFonts: GoogleFonts
                    //                                     .asMap()
                    //                                 .containsKey(
                    //                                     FlutterFlowTheme.of(
                    //                                             context)
                    //                                         .bodySmallFamily),
                    //                           ),
                    //                       enabledBorder: UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                       focusedBorder: UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                       errorBorder: UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                       focusedErrorBorder:
                    //                           UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     style: FlutterFlowTheme.of(context)
                    //                         .bodySmall
                    //                         .override(
                    //                           fontFamily:
                    //                               FlutterFlowTheme.of(context)
                    //                                   .bodySmallFamily,
                    //                           fontWeight: FontWeight.w500,
                    //                           useGoogleFonts:
                    //                               GoogleFonts.asMap()
                    //                                   .containsKey(
                    //                                       FlutterFlowTheme.of(
                    //                                               context)
                    //                                           .bodySmallFamily),
                    //                         ),
                    //                     keyboardType: TextInputType.number,
                    //                     validator: _model
                    //                         .textController2Validator
                    //                         .asValidator(context),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           width: double.infinity,
                    //           height: 50,
                    //           decoration: BoxDecoration(
                    //             color: Color(0xFFFAFAFA),
                    //             borderRadius: BorderRadius.circular(12),
                    //             border: Border.all(
                    //               color: Color(0x7FD6D6D6),
                    //             ),
                    //           ),
                    //           child: Padding(
                    //             padding: EdgeInsetsDirectional.fromSTEB(
                    //                 12, 0, 12, 0),
                    //             child: Row(
                    //               mainAxisSize: MainAxisSize.max,
                    //               children: [
                    //                 Padding(
                    //                   padding: EdgeInsetsDirectional.fromSTEB(
                    //                       0, 0, 10, 0),
                    //                   child: Icon(
                    //                     Icons.person,
                    //                     color: FlutterFlowTheme.of(context)
                    //                         .secondary,
                    //                     size: 24,
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: TextFormField(
                    //                     controller: anakController,
                    //                     focusNode: textFieldFocusNode3,
                    //                     autofocus: true,
                    //                     obscureText: false,
                    //                     decoration: InputDecoration(
                    //                       hintText: 'Jumlah wisatawan anak',
                    //                       hintStyle: FlutterFlowTheme.of(
                    //                               context)
                    //                           .bodySmall
                    //                           .override(
                    //                             fontFamily:
                    //                                 FlutterFlowTheme.of(context)
                    //                                     .bodySmallFamily,
                    //                             color: Color(0xFFBDBDBD),
                    //                             useGoogleFonts: GoogleFonts
                    //                                     .asMap()
                    //                                 .containsKey(
                    //                                     FlutterFlowTheme.of(
                    //                                             context)
                    //                                         .bodySmallFamily),
                    //                           ),
                    //                       enabledBorder: UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                       focusedBorder: UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                       errorBorder: UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                       focusedErrorBorder:
                    //                           UnderlineInputBorder(
                    //                         borderSide: BorderSide(
                    //                           color: Color(0x00000000),
                    //                           width: 1,
                    //                         ),
                    //                         borderRadius:
                    //                             const BorderRadius.only(
                    //                           topLeft: Radius.circular(4.0),
                    //                           topRight: Radius.circular(4.0),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     style: FlutterFlowTheme.of(context)
                    //                         .bodySmall
                    //                         .override(
                    //                           fontFamily:
                    //                               FlutterFlowTheme.of(context)
                    //                                   .bodySmallFamily,
                    //                           fontWeight: FontWeight.w500,
                    //                           useGoogleFonts:
                    //                               GoogleFonts.asMap()
                    //                                   .containsKey(
                    //                                       FlutterFlowTheme.of(
                    //                                               context)
                    //                                           .bodySmallFamily),
                    //                         ),
                    //                     keyboardType: TextInputType.number,
                    //                     validator: _model
                    //                         .textController3Validator
                    //                         .asValidator(context),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0x7FD6D6D6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.phone,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: phoneController,
                                        focusNode: textFieldFocusNode4,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'No. Telepon',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                color: Color(0xFFBDBDBD),
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .textController4Validator
                                            .asValidator(context),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0x7FD6D6D6),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.email_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 24,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: emailController,
                                        focusNode: textFieldFocusNode5,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                color: Color(0xFFBDBDBD),
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        keyboardType: TextInputType.text,
                                        validator: _model
                                            .textController5Validator
                                            .asValidator(context),
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
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        'Jumlah Wisatawan',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 14,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dewasa',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 12,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(30),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0x25000000),
                                width: 1,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.minus,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 10,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.plus,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 10,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              count: _model.countControllerValue1 ??= 1,
                              updateCount: (count) => setState(
                                  () => _model.countControllerValue1 = count),
                              stepSize: 1,
                              minimum: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Anak (dibawah 5 tahun)',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 12,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(30),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Color(0x25000000),
                                width: 1,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.minus,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 10,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.plus,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                size: 10,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              count: _model.countControllerValue2 ??= 1,
                              updateCount: (count) => setState(
                                  () => _model.countControllerValue2 = count),
                              stepSize: 1,
                              minimum: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.transparent,
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(25, 0, 25, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.apiResult0e56789hi =
                                        await TiketWisataGroup
                                            .beliTiketWisataCall
                                            .call(
                                      tiketId: widget.isScannedValue,
                                      nama: namaController.text,
                                      dewasa: dewasaController.text,
                                      anak: anakController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                    );
                                    print(
                                        'userdata: ${_model.apiResult0e56789hi!.jsonBody}');
                                    if ((_model.apiResult0e56789hi?.succeeded ??
                                        true)) {
                                      await Get.defaultDialog(
                                        title: "Terima Kasih",
                                        content: Center(
                                            child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/detailed-point-exchange-illustration_23-2148850434 copy.png',
                                              height: 200,
                                              width: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                                textAlign: TextAlign.center,
                                                "Selamat Anda mendapatkan 5 poin untuk ditukarkan saat berbelanja")
                                          ],
                                        )),
                                        // middleText:
                                        //     "Terima kasih\nSelamat menikmati kunjungan wisata anda",

                                        onConfirm: () => Get.back(),
                                      );
                                      Get.back();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Tidak boleh kosong',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }
                                  },
                                  text: 'Lanjutkan',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    padding: EdgeInsets.all(0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).accent1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3,
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
            ],
          ),
        ),
      ),
    );
  }
}
