import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolaka/components/add_new_addess.dart';
import 'package:kolaka/core/controllers/gps_controller.dart';
import 'package:kolaka/flutter_flow/flutter_flow_google_map.dart';
import 'package:kolaka/flutter_flow/flutter_flow_icon_button.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/makanan/home_makanan/home_makanan_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pilih_alamat_antar_makanan_model.dart';
export 'pilih_alamat_antar_makanan_model.dart';

class PilihAlamatAntarMakananWidget extends StatefulWidget {
  const PilihAlamatAntarMakananWidget({Key? key}) : super(key: key);

  @override
  _PilihAlamatAntarMakananWidgetState createState() =>
      _PilihAlamatAntarMakananWidgetState();
}

class _PilihAlamatAntarMakananWidgetState
    extends State<PilihAlamatAntarMakananWidget> {
  late PilihAlamatAntarMakananModel _model;
  GPSController gpsController = Get.isRegistered<GPSController>()
      ? Get.find<GPSController>()
      : Get.put(GPSController());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic>? addr;
  double? _latitude, _longitude;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PilihAlamatAntarMakananModel());
    _model.textController1 ??= TextEditingController( text: FFAppState().address);
    _model.textFieldFocusNode1 ??= FocusNode();
    _latitude = gpsController.latitude.value;
    _longitude = gpsController.longitude.value;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  // fungsi untuk memperbarui koordinat
  Future<void> updateCoordinates(double newLat, double newLng) async {
    setState(() async {
      final GoogleMapController controller =
          await _model.googleMapsController.future;
      controller.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(newLat, newLng),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryText,
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
              Get.back();
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Text(
              'Lokasi Pengiriman',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lokasi Anda',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primary,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        addr = await Get.to(() => const AddNewAddress(),
                            arguments: {
                              'latitude': gpsController.latitude.value,
                              'longitude': gpsController.longitude.value
                            });
                        print(addr);
                        setState(() {
                          updateCoordinates(
                              addr!['latitude'], addr!['longitude']);
                          _latitude = addr!['latitude'];
                          _longitude = addr!['longitude'];
                        });
                      },
                      text: 'Atur Lokasi',
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).accent1,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
                if (FFAppState().address == null || FFAppState().address == '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PilihAlamatAntarMakananWidget(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.klocation,
                            color: FlutterFlowTheme.of(context).accent1,
                            size: 24.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Pilih Lokasi',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: 175,
                      child: FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        markers: [
                          FlutterFlowMarker(
                            '1',
                            FFLatLng(_latitude!, _longitude!),
                          )
                        ],
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter = latLng,
                        initialLocation: _model.googleMapsCenter ??= FFLatLng(
                            gpsController.latitude.value,
                            gpsController.longitude.value),
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      ),
                    ),
                    // Generated code for this Row Widget...
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).titleSmall,
                                  hintText: 'Masukan alamat lengkap',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).titleSmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                maxLines: null,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              setState(() {
                                FFAppState().address =
                                    _model.textController1.text;
                              });
                              if (FFAppState().address.isEmpty) {
                                Get.defaultDialog(
                                  title: "Alamat penjemputan kosong",
                                  middleText:
                                      "Mohon atur alamat penjemputan anda",
                                  onConfirm: () => Get.back(),
                                );
                              } else {
                                Get.defaultDialog(
                                    title: "Sukses",
                                    middleText: "Detail alamat sudah di atur",
                                    onConfirm: () => Get.to(() => HomeMakananWidget()));
                              }
                            },
                            text: '',
                            icon: Icon(
                              Icons.send_outlined,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).accent1,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
