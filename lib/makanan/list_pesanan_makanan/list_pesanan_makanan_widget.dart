import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kelotimaja/components/add_new_addess.dart';
import 'package:kelotimaja/core/helpers/common_helper.dart';
import 'package:kelotimaja/makanan/isi_data_pemesan/isi_data_pemesan_widget.dart';

import '../../core/controllers/general_controller.dart';
import '../../core/controllers/gps_controller.dart';
import '../../flutter_flow/flutter_flow_google_map.dart';
import '/alamat/pilih_alamat_antar_makanan/pilih_alamat_antar_makanan_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/makanan/home_makanan/home_makanan_widget.dart';
import '/pembayaran/konfirmasi_pembayaran_makanan/konfirmasi_pembayaran_makanan_widget.dart';
import '/pembayaran/metode_pembayaran/metode_pembayaran_widget.dart';
import '/signup_signin_setup/login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'list_pesanan_makanan_model.dart';
export 'list_pesanan_makanan_model.dart';

class ListPesananMakananWidget extends StatefulWidget {
  const ListPesananMakananWidget({Key? key, this.dataToko}) : super(key: key);
  final dynamic dataToko;

  @override
  _ListPesananMakananWidgetState createState() =>
      _ListPesananMakananWidgetState();
}

class _ListPesananMakananWidgetState extends State<ListPesananMakananWidget> {
  GPSController gpsController = Get.isRegistered<GPSController>()
      ? Get.find<GPSController>()
      : Get.put(GPSController());
  late ListPesananMakananModel _model;

  int quantity = 1;
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

  double calculateTotalPrice(List<dynamic> ringkasanPesanan) {
    double totalPrice = 0;
    for (dynamic item in ringkasanPesanan) {
      if (item.containsKey('price')) {
        totalPrice +=
            (double.parse(item['price'].toString()) * (item['quantity'] ?? 1));
      }
    }
    if (totalPrice == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeMakananWidget()),
        );
      });
    }
    return totalPrice;
  }

  Future<void> updateAddress() async {
    try {
      // Simulate an API call or data update delay
      await Future.delayed(Duration(seconds: 2));

      // Update the address in FFAppState with the new value
      FFAppState().address =
          'New Updated Address'; // Replace with the actual updated address

      // Inform Flutter that the state has changed
      setState(() {});

      print('Address updated successfully');
    } catch (error) {
      print('Error updating address: $error');
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic>? addr;

  double? _latitude, _longitude;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPesananMakananModel());

    _model.textController ??= TextEditingController();
    _model.textController1 ??=
        TextEditingController(text: FFAppState().address);
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

  void _openMaps(dynamic dataToko) async {
    // Mendapatkan nilai latitude dan longitude dari data toko
    double latitude = double.parse(getJsonField(dataToko, r'''$.latitude'''));
    double longitude = double.parse(getJsonField(dataToko, r'''$.longitude'''));

    // Format URL untuk membuka Google Maps
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    // Buka aplikasi peta dengan URL yang sudah dibuat
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    // print(widget.dataToko['latitude']);

    // print(FFAppState().addMakananToJson);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
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
            'Pesanan',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  color: FlutterFlowTheme.of(context).primary,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyLargeFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                // Implement the logic to refresh your data here
                // For example, you could refetch data from API or update your data
                await updateAddress(); // Replace with your data fetching logic
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().accessToken == null ||
                                FFAppState().accessToken == '')
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 20, 10, 20),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: UserGroup.userAddressCall.call(
                                      accessToken: FFAppState().accessToken,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary400,
                                            ),
                                          ),
                                        );
                                      }
                                      final columnUserAddressResponse =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Text(
                                                  'Dikirim ke',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0xFFD6EFFF),
                                                  borderRadius: 30,
                                                  borderWidth: 5,
                                                  buttonSize: 50,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.location_on,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginPageWidget(),
                                                          ),
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Masuk untuk set lokasi pengiriman',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 24,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (FFAppState().accessToken != null &&
                                FFAppState().accessToken != '')
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 20, 10, 20),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: UserGroup.userAddressCall.call(
                                      accessToken: FFAppState().accessToken,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary400,
                                            ),
                                          ),
                                        );
                                      }
                                      final columnUserAddressResponse =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (getJsonField(widget.dataToko,
                                                  r'''$.shipping_cost''') !=
                                              0)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Text(
                                                    'Dikirim ke',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    addr = await Get.to(
                                                        () =>
                                                            const AddNewAddress(),
                                                        arguments: {
                                                          'latitude':
                                                              gpsController
                                                                  .latitude
                                                                  .value,
                                                          'longitude':
                                                              gpsController
                                                                  .longitude
                                                                  .value
                                                        });
                                                    print(addr);
                                                    setState(() {
                                                      updateCoordinates(
                                                          addr!['latitude'],
                                                          addr!['longitude']);
                                                      _latitude =
                                                          addr!['latitude'];
                                                      _longitude =
                                                          addr!['longitude'];
                                                    });
                                                  },
                                                  text: 'Atur Lokasi Anda',
                                                  options: FFButtonOptions(
                                                    height: 40,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24, 0, 24, 0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 3,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          if (getJsonField(widget.dataToko,
                                                  r'''$.shipping_cost''') ==
                                              0)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Text(
                                                    'Diambil ke alamat',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          Divider(
                                            thickness: 1,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          if (getJsonField(widget.dataToko,
                                                  r'''$.shipping_cost''') !=
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          addr = await Get.to(
                                                              () =>
                                                                  const AddNewAddress(),
                                                              arguments: {
                                                                'latitude':
                                                                    gpsController
                                                                        .latitude
                                                                        .value,
                                                                'longitude':
                                                                    gpsController
                                                                        .longitude
                                                                        .value
                                                              });
                                                          print(addr);
                                                          setState(() {
                                                            updateCoordinates(
                                                                addr![
                                                                    'latitude'],
                                                                addr![
                                                                    'longitude']);
                                                            _latitude = addr![
                                                                'latitude'];
                                                            _longitude = addr![
                                                                'longitude'];
                                                          });
                                                          print(
                                                              'langlot: ${FFLatLng(gpsController.latitude.value, gpsController.longitude.value)}');
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: Get.width,
                                                              height: 175,
                                                              child:
                                                                  FlutterFlowGoogleMap(
                                                                controller: _model
                                                                    .googleMapsController,
                                                                markers: [
                                                                  FlutterFlowMarker(
                                                                    '1',
                                                                    FFLatLng(
                                                                        _latitude!,
                                                                        _longitude!),
                                                                  )
                                                                ],
                                                                onCameraIdle:
                                                                    (latLng) =>
                                                                        _model.googleMapsCenter =
                                                                            latLng,
                                                                initialLocation: _model.googleMapsCenter ??= FFLatLng(
                                                                    gpsController
                                                                        .latitude
                                                                        .value,
                                                                    gpsController
                                                                        .longitude
                                                                        .value),
                                                                markerColor:
                                                                    GoogleMarkerColor
                                                                        .violet,
                                                                mapType: MapType
                                                                    .normal,
                                                                style:
                                                                    GoogleMapStyle
                                                                        .standard,
                                                                initialZoom:
                                                                    14.0,
                                                                allowInteraction:
                                                                    true,
                                                                allowZoom: true,
                                                                showZoomControls:
                                                                    true,
                                                                showLocation:
                                                                    true,
                                                                showCompass:
                                                                    false,
                                                                showMapToolbar:
                                                                    false,
                                                                showTraffic:
                                                                    false,
                                                                centerMapOnMarkerTap:
                                                                    true,
                                                              ),
                                                            ),
                                                            // Generated code for this Row Widget...
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController1,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode1,
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).titleSmall,
                                                                          hintText:
                                                                              'Masukan alamat lengkap',
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).titleSmall,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        maxLines:
                                                                            null,
                                                                        validator: _model
                                                                            .textController1Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().address = _model
                                                                            .textController1
                                                                            .text;
                                                                      });
                                                                      if (FFAppState()
                                                                          .address
                                                                          .isEmpty) {
                                                                        Get.defaultDialog(
                                                                          title:
                                                                              "Alamat penjemputan kosong",
                                                                          middleText:
                                                                              "Mohon atur alamat penjemputan anda",
                                                                          onConfirm: () =>
                                                                              Get.back(),
                                                                        );
                                                                      } else {
                                                                        Get.defaultDialog(
                                                                            title:
                                                                                "Sukses",
                                                                            middleText:
                                                                                "Detail alamat sudah di atur",
                                                                            onConfirm: () =>
                                                                                Get.back());
                                                                      }
                                                                    },
                                                                    text: '',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .send_outlined,
                                                                      size: 15,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40,
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              15,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      iconPadding:
                                                                          EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                Colors.white,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          3,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (getJsonField(widget.dataToko,
                                                  r'''$.shipping_cost''') ==
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: InkWell(
                                                onTap: () {
                                                  _openMaps(widget.dataToko);
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFECF7FB),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10,
                                                                      10,
                                                                      10,
                                                                      10),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .error_outline,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 20,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child: Text(
                                                                        '${getJsonField(widget.dataToko, r'''$.address''')}')),
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
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       Container(
                      //         height: 35,
                      //         decoration: BoxDecoration(
                      //           color:
                      //               FlutterFlowTheme.of(context).secondaryText,
                      //           borderRadius: BorderRadius.circular(30),
                      //           border: Border.all(
                      //             color: FlutterFlowTheme.of(context).accent1,
                      //           ),
                      //         ),
                      //         child: Padding(
                      //           padding: EdgeInsetsDirectional.fromSTEB(
                      //               10, 5, 10, 5),
                      //           child: Row(
                      //             mainAxisSize: MainAxisSize.min,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Icon(
                      //                 Icons.location_on,
                      //                 color:
                      //                     FlutterFlowTheme.of(context).accent1,
                      //                 size: 20,
                      //               ),
                      //               Text(
                      //                 'Isi Detail Alamat',
                      //                 style: FlutterFlowTheme.of(context)
                      //                     .bodySmall
                      //                     .override(
                      //                       fontFamily:
                      //                           FlutterFlowTheme.of(context)
                      //                               .bodySmallFamily,
                      //                       color: FlutterFlowTheme.of(context)
                      //                           .accent1,
                      //                       fontWeight: FontWeight.normal,
                      //                       useGoogleFonts: GoogleFonts.asMap()
                      //                           .containsKey(
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodySmallFamily),
                      //                     ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding:
                      //             EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      //         child: Container(
                      //           height: 35,
                      //           decoration: BoxDecoration(
                      //             color: FlutterFlowTheme.of(context)
                      //                 .primaryBackground,
                      //             borderRadius: BorderRadius.circular(30),
                      //             border: Border.all(
                      //               color: FlutterFlowTheme.of(context).accent1,
                      //             ),
                      //           ),
                      //           child: Padding(
                      //             padding: EdgeInsetsDirectional.fromSTEB(
                      //                 10, 5, 10, 5),
                      //             child: Row(
                      //               mainAxisSize: MainAxisSize.min,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Icon(
                      //                   Icons.chat,
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .accent1,
                      //                   size: 20,
                      //                 ),
                      //                 Padding(
                      //                   padding: EdgeInsetsDirectional.fromSTEB(
                      //                       5, 0, 0, 0),
                      //                   child: Text(
                      //                     'Catatan',
                      //                     style: FlutterFlowTheme.of(context)
                      //                         .bodySmall
                      //                         .override(
                      //                           fontFamily:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .bodySmallFamily,
                      //                           color:
                      //                               FlutterFlowTheme.of(context)
                      //                                   .accent1,
                      //                           fontWeight: FontWeight.normal,
                      //                           useGoogleFonts: GoogleFonts
                      //                                   .asMap()
                      //                               .containsKey(
                      //                                   FlutterFlowTheme.of(
                      //                                           context)
                      //                                       .bodySmallFamily),
                      //                         ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ringkasan Pesanan',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily),
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
                                    Builder(
                                      builder: (context) {
                                        final ringkasanPesanan = FFAppState()
                                            .addMakananToJson
                                            .map((e) => e)
                                            .toList();
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              ringkasanPesanan.length,
                                              (ringkasanPesananIndex) {
                                            final ringkasanPesananItem =
                                                ringkasanPesanan[
                                                    ringkasanPesananIndex];
                                            ringkasanPesananItem['quantity'] =
                                                ringkasanPesananItem[
                                                        'quantity'] ??
                                                    1;
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              ringkasanPesananItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                          ),
                                                          if (getJsonField(
                                                                ringkasanPesananItem,
                                                                r'''$.variants[:].name''',
                                                              ) !=
                                                              null)
                                                            Text(
                                                              getJsonField(
                                                                ringkasanPesananItem,
                                                                r'''$.variants[:].name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                          if (getJsonField(
                                                                ringkasanPesananItem,
                                                                r'''$.variants[:].name''',
                                                              ) !=
                                                              null)
                                                            Text(
                                                              formatNumber(
                                                                double.parse(
                                                                        getJsonField(
                                                                      ringkasanPesananItem,
                                                                      r'''$.variants[:].price''',
                                                                    )
                                                                            .toString()) +
                                                                    double.parse(
                                                                        getJsonField(
                                                                      ringkasanPesananItem,
                                                                      r'''$.price''',
                                                                    ).toString()),
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
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                          if (getJsonField(
                                                                ringkasanPesananItem,
                                                                r'''$.variants[:].name''',
                                                              ) ==
                                                              null)
                                                            Text(
                                                              formatNumber(
                                                                double.parse(
                                                                        getJsonField(
                                                                      ringkasanPesananItem,
                                                                      r'''$.price''',
                                                                    )
                                                                            .toString()) *
                                                                    ringkasanPesananItem[
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
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 5, 7),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          // FFAppState().variantUMKM =
                                                          //     cartDataItem;
                                                          FFAppState()
                                                              .addMakananToJson
                                                              .removeAt(
                                                                  ringkasanPesananIndex);
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.delete_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.remove),
                                                    onPressed: () =>
                                                        decrementQuantity(
                                                            ringkasanPesananItem),
                                                  ),
                                                  Text(
                                                      '${ringkasanPesananItem['quantity']}'),
                                                  IconButton(
                                                    icon: Icon(Icons.add),
                                                    onPressed: () =>
                                                        incrementQuantity(
                                                            ringkasanPesananItem),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/gradient.048e01e.png',
                                ).image,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 20, 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ringkasan pembayaran',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLargeFamily,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Harga',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                Text(
                                                  NumberFormat.currency(
                                                          locale: 'id_ID',
                                                          symbol: 'Rp ')
                                                      .format(calculateTotalPrice(
                                                          FFAppState()
                                                              .addMakananToJson!))
                                                      .replaceAll(",00", ""),
                                                  //           FFAppState()
                                                  // .addMakananToJson
                                                  // .map((e) => e)
                                                  // .toList();
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (getJsonField(
                                                        widget.dataToko,
                                                        r'''$.shipping_cost''') !=
                                                    0)
                                                  Text(
                                                    'Biaya Antar',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                if (getJsonField(
                                                        widget.dataToko,
                                                        r'''$.shipping_cost''') !=
                                                    0)
                                                  Text(
                                                    // NumberFormat.currency(
                                                    //         locale: 'id_ID',
                                                    //         symbol: 'Rp ')
                                                    //     .format(calculateTotalPrice(
                                                    //             FFAppState()
                                                    //                 .addMakananToJson!) *
                                                    //         double.parse(
                                                    //             FFAppState()
                                                    //                 .taxAdmin))
                                                    //     .replaceAll(",00", ""),
                                                    NumberFormat.currency(
                                                            locale: 'id_ID',
                                                            symbol: 'Rp ')
                                                        .format(double.parse(
                                                            getJsonField(
                                                                    widget
                                                                        .dataToko,
                                                                    r'''$.shipping_cost''')
                                                                .toString()))
                                                        .replaceAll(",00", ""),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // Text(
                                                //   'Pajak',
                                                //   style:
                                                //       FlutterFlowTheme.of(context)
                                                //           .bodyMedium
                                                //           .override(
                                                //             fontFamily:
                                                //                 FlutterFlowTheme.of(
                                                //                         context)
                                                //                     .bodyMediumFamily,
                                                //             fontWeight:
                                                //                 FontWeight.w500,
                                                //             useGoogleFonts: GoogleFonts
                                                //                     .asMap()
                                                //                 .containsKey(
                                                //                     FlutterFlowTheme.of(
                                                //                             context)
                                                //                         .bodyMediumFamily),
                                                //           ),
                                                // ),
                                                // Text(
                                                //   'Sudah termasuk',
                                                //   style:
                                                //       FlutterFlowTheme.of(context)
                                                //           .bodyMedium
                                                //           .override(
                                                //             fontFamily:
                                                //                 FlutterFlowTheme.of(
                                                //                         context)
                                                //                     .bodyMediumFamily,
                                                //             fontWeight:
                                                //                 FontWeight.w500,
                                                //             useGoogleFonts: GoogleFonts
                                                //                     .asMap()
                                                //                 .containsKey(
                                                //                     FlutterFlowTheme.of(
                                                //                             context)
                                                //                         .bodyMediumFamily),
                                                //           ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Subotal Pembayaran',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
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
                                              if (getJsonField(widget.dataToko,
                                                      r'''$.shipping_cost''') !=
                                                  0)
                                                Text(
                                                  NumberFormat.currency(
                                                          locale: 'id_ID',
                                                          symbol: 'Rp ')
                                                      .format((calculateTotalPrice(
                                                              FFAppState()
                                                                  .addMakananToJson!) +
                                                          double.parse(getJsonField(
                                                                  widget
                                                                      .dataToko,
                                                                  r'''$.shipping_cost''')
                                                              .toString())))
                                                      .replaceAll(",00", ""),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
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
                                              if (getJsonField(widget.dataToko,
                                                      r'''$.shipping_cost''') ==
                                                  0)
                                                Text(
                                                  NumberFormat.currency(
                                                          locale: 'id_ID',
                                                          symbol: 'Rp ')
                                                      .format((calculateTotalPrice(
                                                          FFAppState()
                                                              .addMakananToJson!)))
                                                      .replaceAll(",00", ""),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
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
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(4, 4),
                          spreadRadius: 4,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (FFAppState().userData != null)
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  FFAppState().address =
                                      _model.textController1.text;
                                  // FFAppState().hargaTotal = NumberFormat.currency(
                                  //         locale: 'id_ID', symbol: 'Rp ')
                                  //     .format((calculateTotalPrice(FFAppState()
                                  //                 .addMakananToJson!) *
                                  //             double.parse(
                                  //                 FFAppState().biayaPengiriman)) +
                                  //         calculateTotalPrice(
                                  //             FFAppState().addMakananToJson!))
                                  //     .replaceAll(",00", "");
                                  FFAppState()
                                      .hargaTotal = NumberFormat.currency(
                                          locale: 'id_ID', symbol: 'Rp ')
                                      .format((calculateTotalPrice(
                                              FFAppState().addMakananToJson!) +
                                          double.parse(
                                              FFAppState().biayaPengiriman)))
                                      .replaceAll(",00", "");
                                });
                                // await Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         KonfirmasiPembayaranMakananWidget(
                                //           item
                                //         ),
                                //   ),
                                // );
                                var orderItems = {
                                  'items': FFAppState().addMakananToJson,
                                  'totalPrice': calculateTotalPrice(
                                      FFAppState().addMakananToJson!),
                                  'toko': widget.dataToko,
                                  'address2':
                                      '${gpsController.latitude.value.toString()},${gpsController.longitude.value.toString()}',
                                  'address': _model.textController1.text,
                                  'shipping_cost': getJsonField(
                                      widget.dataToko, r'''$.shipping_cost''')
                                };
                                // print('order items: ${orderItems}');
                                CommonHelper.logPrint(
                                    'order items: ${jsonEncode(orderItems)}');

                                Get.to(() =>
                                    IsiDataPemesanWidget(items: orderItems));
                              },
                              text: 'Pesan Sekarang',
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
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
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          if (FFAppState().userData == null)
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPageWidget(),
                                  ),
                                );
                              },
                              text: 'Login untuk melanjutkan',
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
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
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(30),
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
      ),
    );
  }
}
