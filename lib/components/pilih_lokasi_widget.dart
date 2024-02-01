import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kelotimaja/alamat/ubah_alamat_antar/picker_demo.dart';
import 'package:url_launcher/url_launcher.dart';

import '/alamat/pilih_alamat_antar/pilih_alamat_antar_widget.dart';
import '/alamat/ubah_alamat_antar/ubah_alamat_antar_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:kelotimaja/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pilih_lokasi_model.dart';
export 'pilih_lokasi_model.dart';

class PilihLokasiWidget extends StatefulWidget {
  const PilihLokasiWidget({Key? key}) : super(key: key);

  @override
  _PilihLokasiWidgetState createState() => _PilihLokasiWidgetState();
}

class _PilihLokasiWidgetState extends State<PilihLokasiWidget> {
  late PilihLokasiModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFLatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PilihLokasiModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  LatLng? parseLatLngFromString(String addressString) {
    final regex = RegExp(r'LatLng\(lat: (.*), lng: (.*)\)');
    final match = regex.firstMatch(addressString);

    if (match != null && match.groupCount == 2) {
      final lat = double.tryParse(match.group(1)!);
      final lng = double.tryParse(match.group(2)!);

      if (lat != null && lng != null) {
        return LatLng(lat, lng);
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Divider(
                              thickness: 3.0,
                              indent: 150.0,
                              endIndent: 150.0,
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Pilih Lokasi',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
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
                  FutureBuilder<ApiCallResponse>(
                    future: UserGroup.userAddressCall.call(
                      accessToken: FFAppState().accessToken,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).tertiary400,
                            ),
                          ),
                        );
                      }
                      final listViewUserAddressResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final userAddress = UserGroup.userAddressCall
                                  .userAddressData(
                                    listViewUserAddressResponse.jsonBody,
                                  )
                                  ?.toList() ??
                              [];
                          if (userAddress.isNotEmpty) {
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: userAddress.length,
                              itemBuilder: (context, userAddressIndex) {
                                final userAddressItem =
                                    userAddress[userAddressIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(
                                                userAddressItem,
                                                r'''$.label''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                userAddressItem,
                                                r'''$.receiver_name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                userAddressItem,
                                                r'''$.address_detail''',
                                              ).toString().maybeHandleOverflow(
                                                    maxChars: 30,
                                                    replacement: '…',
                                                  ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              getJsonField(
                                                userAddressItem,
                                                r'''$.receiver_phone''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            if (getJsonField(
                                                  userAddressItem,
                                                  r'''$.is_default''',
                                                ) !=
                                                FFAppState().zeroVal)
                                              Text(
                                                'Alamat Utama',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                        InkWell(
                                          onTap: () async {
                                            // final url =
                                            //     'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

                                            // // Buka aplikasi peta dengan URL yang sudah dibuat
                                            // if (await canLaunch(url)) {
                                            //   await launch(url);
                                            // } else {
                                            //   print('Could not launch $url');
                                            // }
                                            final addressString = getJsonField(
                                                userAddressItem,
                                                r'''$.address''');

                                            if (addressString != null) {
                                              // Parse string "address" menjadi objek LatLng
                                              final latLng =
                                                  parseLatLngFromString(
                                                      addressString);

                                              if (latLng != null) {
                                                // Dapatkan nilai latitude dan longitude dari objek LatLng
                                                final latitude =
                                                    latLng.latitude;
                                                final longitude =
                                                    latLng.longitude;

                                                // Buat URL untuk Google Maps
                                                final url =
                                                    'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

                                                // Buka aplikasi peta dengan URL yang sudah dibuat
                                                if (await canLaunch(url)) {
                                                  await launch(url);
                                                } else {
                                                  print(
                                                      'Could not launch $url');
                                                }
                                              } else {
                                                print(
                                                    'Invalid LatLng format in API response');
                                              }
                                            } else {
                                              print(
                                                  'Invalid or missing "address" field in userAddressItem');
                                            }
                                          },
                                          child: FaIcon(
                                            FontAwesomeIcons.diamondTurnRight,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            size: 36,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().userAddress =
                                                    getJsonField(
                                                  userAddressItem,
                                                  r'''$.address''',
                                                ).toString();
                                              });
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UbahAlamatAntarWidget(
                                                    userAddressData:
                                                        userAddressItem,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Ubah',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary400,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.apiResultftf =
                                                  await UserGroup
                                                      .userAddressDeleteCall
                                                      .call(
                                                addressId: getJsonField(
                                                  userAddressItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                accessToken:
                                                    FFAppState().accessToken,
                                              );

                                              if ((_model.apiResultftf
                                                      ?.jsonBody['success'] ??
                                                  true)) {
                                                Navigator.pop(context);
                                                // Get.back();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        'Alamat dihapus',
                                                        textAlign: TextAlign
                                                            .center, // Mengatur teks menjadi di tengah
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                  ),
                                                );
                                              } else {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        'Alamat utama tidak dapat di hapus',
                                                        textAlign: TextAlign
                                                            .center, // Mengatur teks menjadi di tengah
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Lato',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                  ),
                                                );
                                              }

                                              setState(() {});
                                            },
                                            child: Text(
                                              'Hapus',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontWeight: FontWeight.bold,
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
                                  ],
                                );
                              },
                            );
                          } else {
                            return Container(
                              width: 130.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: Color(0x18000000),
                                ),
                              ),
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
                                          PilihAlamatAntarWidget(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.map_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 20.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Tambah',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
