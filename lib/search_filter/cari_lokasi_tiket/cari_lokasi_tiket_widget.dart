import 'package:get/get.dart';
import 'package:kolaka/components/ubah_data_tiket_widget.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'cari_lokasi_tiket_model.dart';
export 'cari_lokasi_tiket_model.dart';

class CariLokasiTiketWidget extends StatefulWidget {
  const CariLokasiTiketWidget({Key? key}) : super(key: key);

  @override
  _CariLokasiTiketWidgetState createState() => _CariLokasiTiketWidgetState();
}

class _CariLokasiTiketWidgetState extends State<CariLokasiTiketWidget> {
  late CariLokasiTiketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CariLokasiTiketModel());

    // On shake action.
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (shakeActionInProgress) {
          return;
        }
        shakeActionInProgress = true;
        try {
          setState(() {
            FFAppState().searchActive = false;
          });
        } finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    DateTime checkin = DateTime.now().add(Duration(days: 1));
    String formattedStartdate = DateFormat('d/M/y').format(checkin);
    DateTime checkout = DateTime.now().add(Duration(days: 2));
    String formattedEndate = DateFormat('d/M/y').format(checkout);
    DateTime now = DateTime.now();
    String formattedNow = DateFormat('yyyy-MM-dd').format(now);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 80.0,
              pinned: false,
              floating: false,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              title: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Cari lokasi',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            prefixIcon: Icon(
                              FFIcons.kglobalSearchCopy,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 20.0,
                            ),
                            suffixIcon: _model.textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.textController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 20.0,
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
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!FFAppState().searchActive)
                        FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(
                                        ApiHelperGroup.apiLocationCall.call()))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiary400,
                                  ),
                                ),
                              );
                            }
                            final listViewApiLocationResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final locations = listViewApiLocationResponse
                                    .jsonBody
                                    .toList();
                                return RefreshIndicator(
                                  onRefresh: () async {
                                    setState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: locations.length,
                                    itemBuilder: (context, locationsIndex) {
                                      final locationsItem =
                                          locations[locationsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                        Get.bottomSheet(
                                          GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child:
                                                  UbahDataTiketWidget(
                                                startDate: formattedStartdate,
                                                endDate: formattedEndate,
                                              ),
                                            ),
                                          ),
                                          backgroundColor: Colors.transparent,
                                          isDismissible: true,
                                          isScrollControlled: true,
                                        );
                                        setState(() {
                                          FFAppState().location = getJsonField(
                                            locationsItem,
                                            r'''$.name''',
                                          ).toString();
                                          FFAppState().locationId =
                                              getJsonField(
                                            locationsItem,
                                            r'''$.id''',
                                          ).toString();
                                        });
                                        // Navigator.pop(context);
                                        // Get.back();Get.bottomSheet(
                                      },
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.location_pin,
                                          ),
                                          title: Text(
                                            getJsonField(
                                              locationsItem,
                                              r'''$.name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                          subtitle: Text(
                                            getJsonField(
                                              locationsItem,
                                              r'''$.id''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily,
                                                  fontSize: 0.0,
                                                  fontWeight: FontWeight.w100,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily),
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          dense: false,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
