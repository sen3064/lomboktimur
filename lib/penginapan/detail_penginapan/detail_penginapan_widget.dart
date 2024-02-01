import 'package:kelotimaja/theme.dart';

import '/components/fasilitas_penginapan_widget.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/flutter_flow/flutter_flow_google_map.dart';
import '/components/kebijakan_penginapan_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/penginapan/list_kamar/list_kamar_widget.dart';
import '/penginapan/list_ulasan_rating/list_ulasan_rating_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'detail_penginapan_model.dart';
export 'detail_penginapan_model.dart';
import 'package:flutter/material.dart';

class DetailPenginapanWidget extends StatefulWidget {
  const DetailPenginapanWidget({
    Key? key,
    required this.hid,
    required this.homestayData,
    required this.startDate,
    required this.endDate,
    String? rooms,
    String? guests,
    required this.terms,
    required this.mapLat,
    required this.mapLng,
    required this.locationLatLng,
  })  : this.rooms = rooms ?? '1',
        this.guests = guests ?? '2',
        super(key: key);

  final String? hid;
  final dynamic homestayData;
  final String? startDate;
  final String? endDate;
  final String rooms;
  final String guests;
  final dynamic terms;
  final double? mapLat;
  final double? mapLng;
  final FFLatLng? locationLatLng;

  @override
  _DetailPenginapanWidgetState createState() => _DetailPenginapanWidgetState();
}

class _DetailPenginapanWidgetState extends State<DetailPenginapanWidget> {
  late DetailPenginapanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailPenginapanModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
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
                        height: 254.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              '',
                            ).image,
                          ),
                        ),
                        child: Stack(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        getJsonField(
                                          widget.homestayData,
                                          r'''$.banner''',
                                        )['400x350'],
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: getJsonField(
                                        widget.homestayData,
                                        r'''$.banner''',
                                      )['400x350'],
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: getJsonField(
                                  widget.homestayData,
                                  r'''$.banner''',
                                )['400x350'],
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    getJsonField(
                                      widget.homestayData,
                                      r'''$.banner''',
                                    )['400x350'],
                                    width: double.infinity,
                                    height: 259.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
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
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.bookmark,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        Icon(
                                          Icons.share_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final listGallery = getJsonField(
                                    widget.homestayData,
                                    r'''$.gallery''',
                                  ).toList().take(3).toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listGallery.length,
                                    itemBuilder: (context, listGalleryIndex) {
                                      final listGalleryItem =
                                          listGallery[listGalleryIndex];
                                      return Container(
                                        width: 153.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 2.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          listGalleryItem,
                                                          r'$..["400x350"]',
                                                        ),
                                                        'https://cf.bstatic.com/xdata/images/hotel/max1280x900/279832058.jpg?k=e150bfe5bc82bfbd6d2b15b0ccbae7d9dffc2ccb2f4fa4c4710279dd6f46c69d&o=&hp=1',
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: valueOrDefault<String>(
                                                      getJsonField(
                                                        listGalleryItem,
                                                        r'$..["400x350"]',
                                                      ),
                                                      'https://cf.bstatic.com/xdata/images/hotel/max1280x900/279832058.jpg?k=e150bfe5bc82bfbd6d2b15b0ccbae7d9dffc2ccb2f4fa4c4710279dd6f46c69d&o=&hp=1' +
                                                          '$listGalleryIndex',
                                                    ),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: valueOrDefault<String>(
                                                getJsonField(
                                                  listGalleryItem,
                                                  r'$..["400x350"]',
                                                ),
                                                'https://cf.bstatic.com/xdata/images/hotel/max1280x900/279832058.jpg?k=e150bfe5bc82bfbd6d2b15b0ccbae7d9dffc2ccb2f4fa4c4710279dd6f46c69d&o=&hp=1' +
                                                    '$listGalleryIndex',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      listGalleryItem,
                                                      r'$..["400x350"]',
                                                    ),
                                                    'https://cf.bstatic.com/xdata/images/hotel/max1280x900/279832058.jpg?k=e150bfe5bc82bfbd6d2b15b0ccbae7d9dffc2ccb2f4fa4c4710279dd6f46c69d&o=&hp=1',
                                                  ),
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getJsonField(
                            widget.homestayData,
                            r'''$.title''',
                          ).toString(),
                          style: semibold12_5.copyWith(color: dark2),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 15.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      widget.homestayData,
                                      r'''$.location.name''',
                                    ).toString(),
                                    style: regular10.copyWith(color: dark2),
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
                    thickness: 5.0,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Text(
                                        'Deskripsi',
                                        style: bold16.copyWith(color: dark1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: getJsonField(
                                        widget.homestayData,
                                        r'''$.content''',
                                      ).toString(),
                                      style: regular14.copyWith(color: dark2),
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Generated code for this ColumnFasilitas Widget...
                  // Generated code for this ColumnFasilitas Widget...
                  // Generated code for this ColumnFasilitas Widget...
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fasilitas',
                              style: bold16.copyWith(color: dark1),
                            ),
                          ],
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final termsList = widget.terms!.toList();
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 1,
                                        childAspectRatio: 1,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: termsList.length,
                                      itemBuilder: (context, termsListIndex) {
                                        final termsListItem =
                                            termsList[termsListIndex];
                                        return Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  termsListItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                style: regular10.copyWith(
                                                    color: dark2),
                                              ),
                                            ],
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final termsList2 = widget.terms!.toList();
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(termsList2.length,
                                                  (termsList2Index) {
                                            final termsList2Item =
                                                termsList2[termsList2Index];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: getJsonField(
                                                  termsList2Item,
                                                  r'''$.name''',
                                                ).toString(),
                                                options: FFButtonOptions(
                                                  height: 25,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 10, 0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(21),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    thickness: 5.0,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi',
                          style: bold16.copyWith(color: dark1),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: FlutterFlowTheme.of(context).accent1,
                                size: 20.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      widget.homestayData,
                                      r'''$.address''',
                                    ).toString(),
                                    style: regular12_5.copyWith(color: dark2),
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
                              height: 300,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(builder: (context) {
                                final _googleMapMarker = widget.locationLatLng;
                                return FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) =>
                                      _model.googleMapsCenter = latLng,
                                  initialLocation: _model.googleMapsCenter ??=
                                      widget.locationLatLng!,
                                  markers: [
                                    if (_googleMapMarker != null)
                                      FlutterFlowMarker(
                                        _googleMapMarker.serialize(),
                                        _googleMapMarker,
                                      ),
                                  ],
                                  markerColor: GoogleMarkerColor.red,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 14,
                                  allowInteraction: true,
                                  allowZoom: true,
                                  showZoomControls: true,
                                  showLocation: true,
                                  showCompass: false,
                                  showMapToolbar: true,
                                  showTraffic: false,
                                  centerMapOnMarkerTap: true,
                                );
                              }),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(
                        //       0.0, 20.0, 0.0, 0.0),
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         children: [
                        //           Icon(
                        //             Icons.location_on,
                        //             color: FlutterFlowTheme.of(context).accent1,
                        //             size: 20.0,
                        //           ),
                        //           Padding(
                        //             padding: EdgeInsetsDirectional.fromSTEB(
                        //                 5.0, 0.0, 0.0, 0.0),
                        //             child: Text(
                        //               'Disekitar penginapan',
                        //               style: FlutterFlowTheme.of(context)
                        //                   .titleMedium,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       Column(
                        //         mainAxisSize: MainAxisSize.max,
                        //         children: [
                        //           Padding(
                        //             padding: EdgeInsetsDirectional.fromSTEB(
                        //                 0.0, 10.0, 0.0, 0.0),
                        //             child: Column(
                        //               mainAxisSize: MainAxisSize.max,
                        //               children: [
                        //                 Padding(
                        //                   padding:
                        //                       EdgeInsetsDirectional.fromSTEB(
                        //                           0.0, 0.0, 0.0, 1.0),
                        //                   child: Container(
                        //                     width: double.infinity,
                        //                     height: 60.0,
                        //                     decoration: BoxDecoration(
                        //                       color: Colors.white,
                        //                     ),
                        //                     child: Padding(
                        //                       padding: EdgeInsetsDirectional
                        //                           .fromSTEB(
                        //                               12.0, 8.0, 12.0, 8.0),
                        //                       child: Row(
                        //                         mainAxisSize: MainAxisSize.max,
                        //                         children: [
                        //                           Container(
                        //                             width: 44.0,
                        //                             height: 44.0,
                        //                             decoration: BoxDecoration(
                        //                               color: Color(0xFFB9E1EE),
                        //                               borderRadius:
                        //                                   BorderRadius.circular(
                        //                                       8.0),
                        //                               border: Border.all(
                        //                                 color:
                        //                                     FlutterFlowTheme.of(
                        //                                             context)
                        //                                         .accent1,
                        //                                 width: 2.0,
                        //                               ),
                        //                             ),
                        //                             child: Padding(
                        //                               padding:
                        //                                   EdgeInsetsDirectional
                        //                                       .fromSTEB(
                        //                                           2.0,
                        //                                           2.0,
                        //                                           2.0,
                        //                                           2.0),
                        //                               child: ClipRRect(
                        //                                 borderRadius:
                        //                                     BorderRadius
                        //                                         .circular(6.0),
                        //                                 child: Image.network(
                        //                                   'https://asset.kompas.com/crops/EKI_v4h8UXSKGpgtgL5IADboT2E=/5x65:730x548/750x500/data/photo/2020/05/18/5ec27908adb29.jpg',
                        //                                   width: 40.0,
                        //                                   height: 40.0,
                        //                                   fit: BoxFit.cover,
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Expanded(
                        //                             child: Padding(
                        //                               padding:
                        //                                   EdgeInsetsDirectional
                        //                                       .fromSTEB(
                        //                                           12.0,
                        //                                           0.0,
                        //                                           0.0,
                        //                                           0.0),
                        //                               child: Column(
                        //                                 mainAxisSize:
                        //                                     MainAxisSize.max,
                        //                                 mainAxisAlignment:
                        //                                     MainAxisAlignment
                        //                                         .center,
                        //                                 crossAxisAlignment:
                        //                                     CrossAxisAlignment
                        //                                         .start,
                        //                                 children: [
                        //                                   Text(
                        //                                     'Pulau Padar',
                        //                                     style: FlutterFlowTheme
                        //                                             .of(context)
                        //                                         .labelSmall,
                        //                                   ),
                        //                                   Flexible(
                        //                                     child: Padding(
                        //                                       padding:
                        //                                           EdgeInsetsDirectional
                        //                                               .fromSTEB(
                        //                                                   0.0,
                        //                                                   4.0,
                        //                                                   0.0,
                        //                                                   0.0),
                        //                                       child: Text(
                        //                                         'Labuan Bajo',
                        //                                         style: FlutterFlowTheme.of(
                        //                                                 context)
                        //                                             .labelSmall
                        //                                             .override(
                        //                                               fontFamily:
                        //                                                   FlutterFlowTheme.of(context)
                        //                                                       .labelSmallFamily,
                        //                                               color: FlutterFlowTheme.of(
                        //                                                       context)
                        //                                                   .secondary,
                        //                                               useGoogleFonts: GoogleFonts
                        //                                                       .asMap()
                        //                                                   .containsKey(
                        //                                                       FlutterFlowTheme.of(context).labelSmallFamily),
                        //                                             ),
                        //                                       ),
                        //                                     ),
                        //                                   ),
                        //                                 ],
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Text(
                        //                             '194 m',
                        //                             textAlign: TextAlign.end,
                        //                             style: FlutterFlowTheme.of(
                        //                                     context)
                        //                                 .labelSmall
                        //                                 .override(
                        //                                   fontFamily:
                        //                                       FlutterFlowTheme.of(
                        //                                               context)
                        //                                           .labelSmallFamily,
                        //                                   color: FlutterFlowTheme
                        //                                           .of(context)
                        //                                       .secondary,
                        //                                   useGoogleFonts: GoogleFonts
                        //                                           .asMap()
                        //                                       .containsKey(
                        //                                           FlutterFlowTheme.of(
                        //                                                   context)
                        //                                               .labelSmallFamily),
                        //                                 ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding:
                        //                       EdgeInsetsDirectional.fromSTEB(
                        //                           0.0, 0.0, 0.0, 1.0),
                        //                   child: Container(
                        //                     width: double.infinity,
                        //                     height: 60.0,
                        //                     decoration: BoxDecoration(
                        //                       color: Colors.white,
                        //                     ),
                        //                     child: Padding(
                        //                       padding: EdgeInsetsDirectional
                        //                           .fromSTEB(
                        //                               12.0, 8.0, 12.0, 8.0),
                        //                       child: Row(
                        //                         mainAxisSize: MainAxisSize.max,
                        //                         children: [
                        //                           Container(
                        //                             width: 44.0,
                        //                             height: 44.0,
                        //                             decoration: BoxDecoration(
                        //                               color: Color(0xFFB9E1EE),
                        //                               borderRadius:
                        //                                   BorderRadius.circular(
                        //                                       8.0),
                        //                               border: Border.all(
                        //                                 color:
                        //                                     FlutterFlowTheme.of(
                        //                                             context)
                        //                                         .accent1,
                        //                                 width: 2.0,
                        //                               ),
                        //                             ),
                        //                             child: Padding(
                        //                               padding:
                        //                                   EdgeInsetsDirectional
                        //                                       .fromSTEB(
                        //                                           2.0,
                        //                                           2.0,
                        //                                           2.0,
                        //                                           2.0),
                        //                               child: ClipRRect(
                        //                                 borderRadius:
                        //                                     BorderRadius
                        //                                         .circular(6.0),
                        //                                 child: Image.network(
                        //                                   'https://asset.kompas.com/crops/e-BQswJK7zHA0v7ilXk4IkTuxMk=/0x107:1280x960/750x500/data/photo/2020/08/03/5f27bf8eba616.jpeg',
                        //                                   width: 40.0,
                        //                                   height: 40.0,
                        //                                   fit: BoxFit.cover,
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Expanded(
                        //                             child: Padding(
                        //                               padding:
                        //                                   EdgeInsetsDirectional
                        //                                       .fromSTEB(
                        //                                           12.0,
                        //                                           0.0,
                        //                                           0.0,
                        //                                           0.0),
                        //                               child: Column(
                        //                                 mainAxisSize:
                        //                                     MainAxisSize.max,
                        //                                 mainAxisAlignment:
                        //                                     MainAxisAlignment
                        //                                         .center,
                        //                                 crossAxisAlignment:
                        //                                     CrossAxisAlignment
                        //                                         .start,
                        //                                 children: [
                        //                                   Text(
                        //                                     'Wae Rebo',
                        //                                     style: FlutterFlowTheme
                        //                                             .of(context)
                        //                                         .labelSmall,
                        //                                   ),
                        //                                   Flexible(
                        //                                     child: Padding(
                        //                                       padding:
                        //                                           EdgeInsetsDirectional
                        //                                               .fromSTEB(
                        //                                                   0.0,
                        //                                                   4.0,
                        //                                                   0.0,
                        //                                                   0.0),
                        //                                       // child: Text(
                        //                                       //   '3-star hotel',
                        //                                       //   style: FlutterFlowTheme.of(
                        //                                       //           context)
                        //                                       //       .labelSmall
                        //                                       //       .override(
                        //                                       //         fontFamily:
                        //                                       //             FlutterFlowTheme.of(context)
                        //                                       //                 .labelSmallFamily,
                        //                                       //         color: FlutterFlowTheme.of(
                        //                                       //                 context)
                        //                                       //             .secondary,
                        //                                       //         useGoogleFonts: GoogleFonts
                        //                                       //                 .asMap()
                        //                                       //             .containsKey(
                        //                                       //                 FlutterFlowTheme.of(context).labelSmallFamily),
                        //                                       //       ),
                        //                                       // ),
                        //                                     ),
                        //                                   ),
                        //                                 ],
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Text(
                        //                             '50 m',
                        //                             textAlign: TextAlign.end,
                        //                             style: FlutterFlowTheme.of(
                        //                                     context)
                        //                                 .labelSmall
                        //                                 .override(
                        //                                   fontFamily:
                        //                                       FlutterFlowTheme.of(
                        //                                               context)
                        //                                           .labelSmallFamily,
                        //                                   color: FlutterFlowTheme
                        //                                           .of(context)
                        //                                       .secondary,
                        //                                   useGoogleFonts: GoogleFonts
                        //                                           .asMap()
                        //                                       .containsKey(
                        //                                           FlutterFlowTheme.of(
                        //                                                   context)
                        //                                               .labelSmallFamily),
                        //                                 ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding:
                        //                       EdgeInsetsDirectional.fromSTEB(
                        //                           0.0, 0.0, 0.0, 1.0),
                        //                   child: Container(
                        //                     width: double.infinity,
                        //                     height: 60.0,
                        //                     decoration: BoxDecoration(
                        //                       color: Colors.white,
                        //                     ),
                        //                     child: Padding(
                        //                       padding: EdgeInsetsDirectional
                        //                           .fromSTEB(
                        //                               12.0, 8.0, 12.0, 8.0),
                        //                       child: Row(
                        //                         mainAxisSize: MainAxisSize.max,
                        //                         children: [
                        //                           Container(
                        //                             width: 44.0,
                        //                             height: 44.0,
                        //                             decoration: BoxDecoration(
                        //                               color: Color(0xFFB9E1EE),
                        //                               borderRadius:
                        //                                   BorderRadius.circular(
                        //                                       8.0),
                        //                               border: Border.all(
                        //                                 color:
                        //                                     FlutterFlowTheme.of(
                        //                                             context)
                        //                                         .accent1,
                        //                                 width: 2.0,
                        //                               ),
                        //                             ),
                        //                             child: Padding(
                        //                               padding:
                        //                                   EdgeInsetsDirectional
                        //                                       .fromSTEB(
                        //                                           2.0,
                        //                                           2.0,
                        //                                           2.0,
                        //                                           2.0),
                        //                               child: ClipRRect(
                        //                                 borderRadius:
                        //                                     BorderRadius
                        //                                         .circular(6.0),
                        //                                 child: Image.network(
                        //                                   'https://asset.kompas.com/crops/K0wzs8QIsFYqsiEYsX-sXaev9_M=/0x0:0x0/750x500/data/photo/2022/05/08/6277a431342d1.jpg',
                        //                                   width: 40.0,
                        //                                   height: 40.0,
                        //                                   fit: BoxFit.cover,
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Expanded(
                        //                             child: Padding(
                        //                               padding:
                        //                                   EdgeInsetsDirectional
                        //                                       .fromSTEB(
                        //                                           12.0,
                        //                                           0.0,
                        //                                           0.0,
                        //                                           0.0),
                        //                               child: Column(
                        //                                 mainAxisSize:
                        //                                     MainAxisSize.max,
                        //                                 mainAxisAlignment:
                        //                                     MainAxisAlignment
                        //                                         .center,
                        //                                 crossAxisAlignment:
                        //                                     CrossAxisAlignment
                        //                                         .start,
                        //                                 children: [
                        //                                   Text(
                        //                                     'Sawah Lingko',
                        //                                     style: FlutterFlowTheme
                        //                                             .of(context)
                        //                                         .labelSmall,
                        //                                   ),
                        //                                   Flexible(
                        //                                     child: Padding(
                        //                                       padding:
                        //                                           EdgeInsetsDirectional
                        //                                               .fromSTEB(
                        //                                                   0.0,
                        //                                                   4.0,
                        //                                                   0.0,
                        //                                                   0.0),
                        //                                       // child: Text(
                        //                                       //   '5-star hotel',
                        //                                       //   style: FlutterFlowTheme.of(
                        //                                       //           context)
                        //                                       //       .labelSmall
                        //                                       //       .override(
                        //                                       //         fontFamily:
                        //                                       //             FlutterFlowTheme.of(context)
                        //                                       //                 .labelSmallFamily,
                        //                                       //         color: FlutterFlowTheme.of(
                        //                                       //                 context)
                        //                                       //             .secondary,
                        //                                       //         useGoogleFonts: GoogleFonts
                        //                                       //                 .asMap()
                        //                                       //             .containsKey(
                        //                                       //                 FlutterFlowTheme.of(context).labelSmallFamily),
                        //                                       //       ),
                        //                                       // ),
                        //                                     ),
                        //                                   ),
                        //                                 ],
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           Text(
                        //                             '194 m',
                        //                             textAlign: TextAlign.end,
                        //                             style: FlutterFlowTheme.of(
                        //                                     context)
                        //                                 .labelSmall
                        //                                 .override(
                        //                                   fontFamily:
                        //                                       FlutterFlowTheme.of(
                        //                                               context)
                        //                                           .labelSmallFamily,
                        //                                   color: FlutterFlowTheme
                        //                                           .of(context)
                        //                                       .secondary,
                        //                                   useGoogleFonts: GoogleFonts
                        //                                           .asMap()
                        //                                       .containsKey(
                        //                                           FlutterFlowTheme.of(
                        //                                                   context)
                        //                                               .labelSmallFamily),
                        //                                 ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  Divider(
                    thickness: 5.0,
                    color: Color(0xFFF6F5F5),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://cdn.kelotimaja.kabtour.com/storage/user/avatar.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getJsonField(
                                        widget.homestayData,
                                        r'''$.business_name''',
                                      ).toString(),
                                      style: regular12_5.copyWith(color: dark2),
                                    ),
                                    // RichText(
                                    //   text: TextSpan(
                                    //     children: [
                                    //       TextSpan(
                                    //         text: 'Online ',
                                    //         style: TextStyle(),
                                    //       ),
                                    //       TextSpan(
                                    //         text: '1 jam lalu',
                                    //         style: TextStyle(
                                    //           color:
                                    //               FlutterFlowTheme.of(context)
                                    //                   .secondary,
                                    //           fontWeight: FontWeight.w600,
                                    //         ),
                                    //       )
                                    //     ],
                                    //     style: FlutterFlowTheme.of(context)
                                    //         .labelSmall,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          widget.homestayData,
                                          r'''$.review_score''',
                                        ).toString(),
                                        style: regular10.copyWith(color: dark2),
                                      ),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 15.0,
                                    ),
                                  ],
                                ),
                                Text(
                                  'rata-rata ulasan',
                                  style: regular10.copyWith(color: dark2),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Follow',
                                      options: FFButtonOptions(
                                        width: 100.0,
                                        height: 35.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.transparent,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 5.0,
                    color: Color(0xFFF6F5F5),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Rating & Ulasan',
                                  style: regular10.copyWith(color: dark2),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFFC107),
                                    size: 15.0,
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    getJsonField(
                                      widget.homestayData,
                                      r'''$.review_score''',
                                    ).toString(),
                                    '0',
                                  ),
                                  style: regular10.copyWith(color: dark2),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      // '(Belum ada ulasan)',
                                      '',
                                      style: regular10.copyWith(color: dark2),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ListUlasanRatingWidget(
                                          objectModel: 'hotel',
                                          objectId: getJsonField(
                                                  widget.homestayData,
                                                  r'''$.id''')
                                              .toString(),
                                          productsName: getJsonField(
                                            widget.homestayData,
                                            r'''$.title''',
                                          ).toString(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 5.0,
                    color: Color(0xFFF6F5F5),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 100.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kebijakan Penginapan',
                                style: semibold12_5.copyWith(color: dark2),
                              ),
                              // InkWell(
                              //   splashColor: Colors.transparent,
                              //   focusColor: Colors.transparent,
                              //   hoverColor: Colors.transparent,
                              //   highlightColor: Colors.transparent,
                              //   onTap: () async {
                              //     await showModalBottomSheet(
                              //       isScrollControlled: true,
                              //       backgroundColor: Colors.transparent,
                              //       enableDrag: false,
                              //       context: context,
                              //       builder: (context) {
                              //         return GestureDetector(
                              //           onTap: () => FocusScope.of(context)
                              //               .requestFocus(_model.unfocusNode),
                              //           child: Padding(
                              //             padding:
                              //                 MediaQuery.of(context).viewInsets,
                              //             child: KebijakanPenginapanWidget(),
                              //           ),
                              //         );
                              //       },
                              //     ).then((value) => setState(() {}));
                              //   },
                              //   child: Icon(
                              //     Icons.keyboard_arrow_right,
                              //     color: FlutterFlowTheme.of(context).accent1,
                              //     size: 24.0,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.timelapse_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Waktu Check in & Check out',
                                style: semibold12_5.copyWith(color: dark2),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 30.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          'Check in',
                                          style: semibold12_5.copyWith(
                                              color: dark2),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Pukul ${getJsonField(
                                                widget.homestayData,
                                                r'''$.check_in_time''',
                                              ).toString()}',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: regular12_5.copyWith(
                                              color: dark2),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          'Check out',
                                          style: semibold12_5.copyWith(
                                              color: dark2),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Pukul ${getJsonField(
                                                widget.homestayData,
                                                r'''$.check_out_time''',
                                              ).toString()}',
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: regular12_5.copyWith(
                                              color: dark2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 10.0, 30.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Check-in',
                                            style: semibold14.copyWith(
                                                color: red1),
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${widget.startDate}',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: regular12_5.copyWith(
                                                color: dark2),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Check-out',
                                            style: semibold12_5.copyWith(
                                                color: dark2),
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${widget.endDate}',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: semibold12_5.copyWith(
                                                color: dark2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pastikan Anda mengetahui waktu yang telah ditentukan untuk check in dan check out',
                                    style: regular14.copyWith(color: dark2),
                                  ),
                                ],
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      border: Border.all(
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mulai Dari',
                                  style: semibold12_5.copyWith(color: dark2),
                                ),
                                Text(
                                  formatNumber(
                                    double.parse(getJsonField(
                                      widget.homestayData,
                                      r'''$.price''',
                                    ).toString()),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.commaDecimal,
                                    currency: 'Rp ',
                                  ),
                                  style: semibold14.copyWith(color: red1),
                                ),
                                Text(
                                  '/kamar/malam . Termasuk Pajak',
                                  style: regular10.copyWith(color: dark2),
                                ),
                              ],
                            ),
                          ),
                          if (getJsonField(
                                    widget.homestayData,
                                    r'''$.price''',
                                  ) !=
                                  null &&
                              getJsonField(
                                    widget.homestayData,
                                    r'''$.price''',
                                  ) !=
                                  0)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ListKamarWidget(
                                        hid: widget.hid!,
                                        roomData: getJsonField(
                                          widget.homestayData,
                                          r'''$.rooms''',
                                        ),
                                        homestayData: widget.homestayData!,
                                        rooms: widget.rooms,
                                        guests: widget.guests,
                                        startDate: widget.startDate!,
                                        endDate: widget.endDate!,
                                        termsRoom: getJsonField(
                                          widget.homestayData,
                                          r'''$.terms_by_attribute_in_listing_page[:]''',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                text: 'Cari Kamar',
                                options: FFButtonOptions(
                                  width: 120.0,
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).accent1,
                                  textStyle:
                                      semibold12_5.copyWith(color: white),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
          ],
        ),
      ),
    );
  }
}
