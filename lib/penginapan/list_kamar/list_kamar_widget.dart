import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/core/helpers/common_helper.dart';
import 'package:kelotimaja/home/chat/chat_widget.dart';
import 'package:kelotimaja/main.dart';
import 'package:kelotimaja/theme.dart';

import '/components/ubah_data_booking_backup_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/penginapan/detail_kamar/detail_kamar_widget.dart';
import '/penginapan/isi_data/isi_data_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'list_kamar_model.dart';
export 'list_kamar_model.dart';

class ListKamarWidget extends StatefulWidget {
  const ListKamarWidget({
    Key? key,
    required this.hid,
    required this.roomData,
    required this.homestayData,
    String? rooms,
    String? guests,
    required this.startDate,
    required this.endDate,
    required this.termsRoom,
  })  : this.rooms = rooms ?? '1',
        this.guests = guests ?? '2',
        super(key: key);

  final String? hid;
  final dynamic roomData;
  final dynamic homestayData;
  final String rooms;
  final String guests;
  final String? startDate;
  final String? endDate;
  final dynamic termsRoom;

  @override
  _ListKamarWidgetState createState() => _ListKamarWidgetState();
}

class _ListKamarWidgetState extends State<ListKamarWidget> {
  late ListKamarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListKamarModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              Navigator.pop(context);
            },
          ),

          //

          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        getJsonField(
                          widget.homestayData,
                          r'''$.title''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        functions.viewDate(widget.startDate),
                                        'null',
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: '- ',
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        functions.viewDate(widget.endDate),
                                        'null',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 10.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: ' - ',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '${widget.rooms} kamar',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: ' - ',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '${widget.guests} tamu',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 10.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Text(
                                  '1 Kamar',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 10.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Icon(
                                  Icons.arrow_right_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Text(
                                  '2 Tamu',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 10.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 15,
                      ),
                      GestureDetector(
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
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: UbahDataBookingBackupWidget(
                                    startDate: widget.startDate!,
                                    endDate: widget.endDate!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Text("Ubah",
                            style: regular12_5.copyWith(color: dark1)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Generated code for this Row Widget...
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: Builder(
                      builder: (context) {
                        dynamic termHomestay = widget.termsRoom;
                        if (termHomestay is List) {
                          termHomestay = termHomestay.toList();
                        } else {
                          termHomestay = [termHomestay];
                        }

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(termHomestay.length,
                                (termHomestayIndex) {
                              final termHomestayItem =
                                  termHomestay[termHomestayIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: getJsonField(
                                    termHomestayItem,
                                    r'''$.name''',
                                  ).toString(),
                                  options: FFButtonOptions(
                                    height: 25,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
                  child: Builder(
                    builder: (context) {
                      final roomData = widget.roomData!.toList();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(roomData.length, (roomDataIndex) {
                            final roomDataItem = roomData[roomDataIndex];
                            // CommonHelper.logPrint('room data item: ${roomDataItem['price_final']}');
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
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
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
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
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      (getJsonField(
                                                                    roomDataItem,
                                                                    r'''$.banner''',
                                                                  ) ??
                                                                  const {})[
                                                              '400x350'] ??
                                                          'https://cdn4.iconfinder.com/data/icons/picture-sharing-sites/32/No_Image-1024.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: 'imageTag',
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: 'imageTag',
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(0),
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8),
                                                ),
                                                child: Image.network(
                                                  (getJsonField(
                                                                roomDataItem,
                                                                r'''$.banner''',
                                                              ) ??
                                                              const {})[
                                                          '400x350'] ??
                                                      'https://cdn4.iconfinder.com/data/icons/picture-sharing-sites/32/No_Image-1024.png',
                                                  width: double.infinity,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 20, 10, 10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              roomDataItem,
                                                              r'''$.title''',
                                                            ).toString(),
                                                            'null',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium,
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetailKamarWidget(
                                                                  rid:
                                                                      getJsonField(
                                                                    roomDataItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                  roomData:
                                                                      roomDataItem,
                                                                  startDate: widget
                                                                      .startDate!,
                                                                  endDate: widget
                                                                      .endDate!,
                                                                  rooms: widget
                                                                      .rooms,
                                                                  guests: widget
                                                                      .guests,
                                                                  termsRoom: widget
                                                                      .termsRoom!,
                                                                  homestayData:
                                                                      widget
                                                                          .homestayData!,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'LIHAT DETAIL',
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
                                                      Text(
                                                        'Tidak isa refund & reschedule',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                      ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0x39000000),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.people_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 20,
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                '${valueOrDefault<String>(
                                                                  getJsonField(
                                                                    roomDataItem,
                                                                    r'''$.max_guests''',
                                                                  ).toString(),
                                                                  '0',
                                                                )} tamu/kamar',
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .single_bed_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 20,
                                                        ),
                                                        if (getJsonField(
                                                              roomDataItem,
                                                              r'''$.single_bed''',
                                                            ) !=
                                                            FFAppState()
                                                                .zeroVal)
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Single Bed',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              roomDataItem,
                                                              r'''$.double_bed''',
                                                            ) !=
                                                            FFAppState()
                                                                .zeroVal)
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Double Bed',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              roomDataItem,
                                                              r'''$.twin_bed''',
                                                            ) !=
                                                            FFAppState()
                                                                .zeroVal)
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Twin Bed',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .fastfood_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 20,
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Sarapan',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                //

                                                // yang baru
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                              desktop: false,
                                                            ))
                                                              Text(
                                                                formatNumber(
                                                                  double.parse(
                                                                      getJsonField(
                                                                    roomDataItem,
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
                                                                style: bold16
                                                                    .copyWith(
                                                                        color:
                                                                            red1),
                                                              ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  double.parse(
                                                                    getJsonField(
                                                                          roomDataItem,
                                                                          r'''$.price_final''',
                                                                        )?.toString() ??
                                                                        '0',
                                                                  ),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency:
                                                                      'Rp ',
                                                                ),
                                                                '0',
                                                              ),
                                                              style: bold16
                                                                  .copyWith(
                                                                      color:
                                                                          red1),
                                                            ),
                                                            Text(
                                                              '/malam/kamar',
                                                              style: regular12_5
                                                                  .copyWith(
                                                                      color:
                                                                          dark3),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          5),
                                                              child: Text(
                                                                'Sisa 4 kamar',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          if (getJsonField(
                                                                      roomDataItem,
                                                                      r'''$.price_final''') !=
                                                                  null ||
                                                              getJsonField(
                                                                      roomDataItem,
                                                                      r'''$.price_final''') !=
                                                                  0)
                                                            if (FFAppState()
                                                                .accessToken
                                                                .isNotEmpty)
                                                              FlutterFlowIconButton(
                                                                borderRadius: 6,
                                                                borderWidth: 0,
                                                                buttonSize: 40,
                                                                fillColor: dark3
                                                                    .withOpacity(
                                                                        0.1),
                                                                icon: Icon(
                                                                  Icons
                                                                      .wechat_outlined,
                                                                  color: red1,
                                                                  size: 24,
                                                                ),
                                                                onPressed: () {
                                                                  String
                                                                      lastName =
                                                                      widget.homestayData['seller']
                                                                              [
                                                                              'last_name'] ??
                                                                          '';
                                                                  Get.to(
                                                                      () =>
                                                                          const ChatWidget(),
                                                                      arguments: {
                                                                        'to_username':
                                                                            '${widget.homestayData['seller']['first_name']}.${lastName.replaceAll(" ", "-")}',
                                                                        'not_navbar':
                                                                            true
                                                                      });
                                                                },
                                                              ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Text(
                                                              'Sisa 4 kamar',
                                                              style: regular14,
                                                            ),
                                                          if (getJsonField(
                                                                      roomDataItem,
                                                                      r'''$.price_final''') !=
                                                                  null ||
                                                              getJsonField(
                                                                      roomDataItem,
                                                                      r'''$.price_final''') !=
                                                                  0)
                                                            GestureDetector(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            IsiDataWidget(
                                                                      startDate:
                                                                          widget
                                                                              .startDate!,
                                                                      endDate:
                                                                          widget
                                                                              .endDate!,
                                                                      homestayData:
                                                                          widget
                                                                              .homestayData!,
                                                                      accessToken:
                                                                          FFAppState()
                                                                              .accessToken,
                                                                      rooms: widget
                                                                          .rooms,
                                                                      guests: widget
                                                                          .guests,
                                                                      roomData:
                                                                          roomDataItem,
                                                                      userData:
                                                                          FFAppState()
                                                                              .userData,
                                                                      termsRoom:
                                                                          widget
                                                                              .termsRoom!,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: red1,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              10.0,
                                                                          horizontal:
                                                                              20),
                                                                      child:
                                                                          Text(
                                                                        "Pilih",
                                                                        style: semibold14.copyWith(
                                                                            color:
                                                                                white),
                                                                      ),
                                                                    )),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}




                                                // Column(
                                                //   mainAxisSize:
                                                //       MainAxisSize.max,
                                                //   children: [
                                                //     Padding(
                                                //       padding:
                                                //           EdgeInsetsDirectional
                                                //               .fromSTEB(
                                                //                   0, 20, 0, 20),
                                                //       child: Row(
                                                //         mainAxisSize:
                                                //             MainAxisSize.max,
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         children: [
                                                //           Column(
                                                //             mainAxisSize:
                                                //                 MainAxisSize
                                                //                     .max,
                                                //             crossAxisAlignment:
                                                //                 CrossAxisAlignment
                                                //                     .start,
                                                //             children: [
                                                //               if (responsiveVisibility(
                                                //                 context:
                                                //                     context,
                                                //                 phone: false,
                                                //                 tablet: false,
                                                //                 tabletLandscape:
                                                //                     false,
                                                //                 desktop: false,
                                                //               ))
                                                //                 Text(
                                                //                   formatNumber(
                                                //                     double.parse(
                                                //                         getJsonField(
                                                //                       roomDataItem,
                                                //                       r'''$.price''',
                                                //                     ).toString()),
                                                //                     formatType:
                                                //                         FormatType
                                                //                             .decimal,
                                                //                     decimalType:
                                                //                         DecimalType
                                                //                             .commaDecimal,
                                                //                     currency:
                                                //                         'Rp ',
                                                //                   ),
                                                //                   style: FlutterFlowTheme.of(
                                                //                           context)
                                                //                       .bodyMedium
                                                //                       .override(
                                                //                         fontFamily:
                                                //                             FlutterFlowTheme.of(context).bodyMediumFamily,
                                                //                         decoration:
                                                //                             TextDecoration.lineThrough,
                                                //                         useGoogleFonts:
                                                //                             GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                //                       ),
                                                //                 ),
                                                //               Text(
                                                //                 valueOrDefault<
                                                //                     String>(
                                                //                   formatNumber(
                                                //                     double
                                                //                         .parse(
                                                //                       getJsonField(
                                                //                             roomDataItem,
                                                //                             r'''$.price_final''',
                                                //                           )?.toString() ??
                                                //                           '0',
                                                //                     ),
                                                //                     formatType:
                                                //                         FormatType
                                                //                             .decimal,
                                                //                     decimalType:
                                                //                         DecimalType
                                                //                             .commaDecimal,
                                                //                     currency:
                                                //                         'Rp ',
                                                //                   ),
                                                //                   '0',
                                                //                 ),
                                                //                 style: FlutterFlowTheme.of(
                                                //                         context)
                                                //                     .bodyLarge
                                                //                     .override(
                                                //                       fontFamily:
                                                //                           FlutterFlowTheme.of(context)
                                                //                               .bodyLargeFamily,
                                                //                       color: FlutterFlowTheme.of(
                                                //                               context)
                                                //                           .error,
                                                //                       fontWeight:
                                                //                           FontWeight
                                                //                               .w600,
                                                //                       useGoogleFonts: GoogleFonts
                                                //                               .asMap()
                                                //                           .containsKey(
                                                //                               FlutterFlowTheme.of(context).bodyLargeFamily),
                                                //                     ),
                                                //               ),
                                                //               Text(
                                                //                 '/malam/kamar',
                                                //                 style: FlutterFlowTheme.of(
                                                //                         context)
                                                //                     .labelSmall
                                                //                     .override(
                                                //                       fontFamily:
                                                //                           FlutterFlowTheme.of(context)
                                                //                               .labelSmallFamily,
                                                //                       color: FlutterFlowTheme.of(
                                                //                               context)
                                                //                           .secondary,
                                                //                       fontSize:
                                                //                           10,
                                                //                       useGoogleFonts: GoogleFonts
                                                //                               .asMap()
                                                //                           .containsKey(
                                                //                               FlutterFlowTheme.of(context).labelSmallFamily),
                                                //                     ),
                                                //               ),
                                                //             ],
                                                //           ),
                                                //           Column(
                                                //             mainAxisSize:
                                                //                 MainAxisSize
                                                //                     .max,
                                                //             children: [
                                                //               if (responsiveVisibility(
                                                //                 context:
                                                //                     context,
                                                //                 phone: false,
                                                //                 tablet: false,
                                                //                 tabletLandscape:
                                                //                     false,
                                                //                 desktop: false,
                                                //               ))
                                                //                 Padding(
                                                //                   padding: EdgeInsetsDirectional
                                                //                       .fromSTEB(
                                                //                           0,
                                                //                           0,
                                                //                           0,
                                                //                           5),
                                                //                   child: Text(
                                                //                     'Sisa 4 kamar',
                                                //                     style: FlutterFlowTheme.of(
                                                //                             context)
                                                //                         .labelSmall
                                                //                         .override(
                                                //                           fontFamily:
                                                //                               FlutterFlowTheme.of(context).labelSmallFamily,
                                                //                           color:
                                                //                               FlutterFlowTheme.of(context).error,
                                                //                           useGoogleFonts:
                                                //                               GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                //                         ),
                                                //                   ),
                                                //                 ),
                                                //               if (getJsonField(
                                                //                           roomDataItem,
                                                //                           r'''$.price_final''') !=
                                                //                       null ||
                                                //                   getJsonField(
                                                //                           roomDataItem,
                                                //                           r'''$.price_final''') !=
                                                //                       0)
                                                //                 FFButtonWidget(
                                                //                   onPressed:
                                                //                       () async {
                                                //                     await Navigator
                                                //                         .push(
                                                //                       context,
                                                //                       MaterialPageRoute(
                                                //                         builder:
                                                //                             (context) =>
                                                //                                 IsiDataWidget(
                                                //                           startDate:
                                                //                               widget.startDate!,
                                                //                           endDate:
                                                //                               widget.endDate!,
                                                //                           homestayData:
                                                //                               widget.homestayData!,
                                                //                           accessToken:
                                                //                               FFAppState().accessToken,
                                                //                           rooms:
                                                //                               widget.rooms,
                                                //                           guests:
                                                //                               widget.guests,
                                                //                           roomData:
                                                //                               roomDataItem,
                                                //                           userData:
                                                //                               FFAppState().userData,
                                                //                           termsRoom:
                                                //                               widget.termsRoom!,
                                                //                         ),
                                                //                       ),
                                                //                     );
                                                //                   },
                                                //                   text: 'Pilih',
                                                //                   options:
                                                //                       FFButtonOptions(
                                                //                     height: 30,
                                                //                     padding: EdgeInsetsDirectional
                                                //                         .fromSTEB(
                                                //                             24,
                                                //                             0,
                                                //                             24,
                                                //                             0),
                                                //                     iconPadding:
                                                //                         EdgeInsetsDirectional.fromSTEB(
                                                //                             0,
                                                //                             0,
                                                //                             0,
                                                //                             0),
                                                //                     color: FlutterFlowTheme.of(
                                                //                             context)
                                                //                         .accent1,
                                                //                     textStyle: FlutterFlowTheme.of(
                                                //                             context)
                                                //                         .titleSmall
                                                //                         .override(
                                                //                           fontFamily:
                                                //                               FlutterFlowTheme.of(context).titleSmallFamily,
                                                //                           color:
                                                //                               FlutterFlowTheme.of(context).primaryBackground,
                                                //                           useGoogleFonts:
                                                //                               GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                //                         ),
                                                //                     borderSide:
                                                //                         BorderSide(
                                                //                       color: Colors
                                                //                           .transparent,
                                                //                     ),
                                                //                     borderRadius:
                                                //                         BorderRadius
                                                //                             .circular(8),
                                                //                   ),
                                                //                 ),
                                                //             ],
                                                //           ),
                                                //           Column(
                                                //             mainAxisSize:
                                                //                 MainAxisSize
                                                //                     .max,
                                                //             children: [
                                                //               if (responsiveVisibility(
                                                //                 context:
                                                //                     context,
                                                //                 phone: false,
                                                //                 tablet: false,
                                                //                 tabletLandscape:
                                                //                     false,
                                                //                 desktop: false,
                                                //               ))
                                                //                 Padding(
                                                //                   padding: EdgeInsetsDirectional
                                                //                       .fromSTEB(
                                                //                           0,
                                                //                           0,
                                                //                           0,
                                                //                           5),
                                                //                   child: Text(
                                                //                     'Sisa 4 kamar',
                                                //                     style: FlutterFlowTheme.of(
                                                //                             context)
                                                //                         .labelSmall
                                                //                         .override(
                                                //                           fontFamily:
                                                //                               FlutterFlowTheme.of(context).labelSmallFamily,
                                                //                           color:
                                                //                               FlutterFlowTheme.of(context).error,
                                                //                           useGoogleFonts:
                                                //                               GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                //                         ),
                                                //                   ),
                                                //                 ),
                                                //               if (getJsonField(
                                                //                           roomDataItem,
                                                //                           r'''$.price_final''') !=
                                                //                       null ||
                                                //                   getJsonField(
                                                //                           roomDataItem,
                                                //                           r'''$.price_final''') !=
                                                //                       0)
                                                //                 if (FFAppState()
                                                //                     .accessToken
                                                //                     .isNotEmpty)
                                                //                   FFButtonWidget(
                                                //                     onPressed:
                                                //                         () {
                                                //                       String
                                                //                           lastName =
                                                //                           widget.homestayData['seller']['last_name'] ??
                                                //                               '';
                                                //                       Get.to(
                                                //                           () =>
                                                //                               const ChatWidget(),
                                                //                           arguments: {
                                                //                             'to_username':
                                                //                                 '${widget.homestayData['seller']['first_name']}.${lastName.replaceAll(" ", "-")}',
                                                //                             'not_navbar':
                                                //                                 true
                                                //                           });
                                                //                     },
                                                //                     text:
                                                //                         'Kirim Pesan',
                                                //                     options:
                                                //                         FFButtonOptions(
                                                //                       height:
                                                //                           30,
                                                //                       padding: EdgeInsetsDirectional
                                                //                           .fromSTEB(
                                                //                               24,
                                                //                               0,
                                                //                               24,
                                                //                               0),
                                                //                       iconPadding:
                                                //                           EdgeInsetsDirectional.fromSTEB(
                                                //                               0,
                                                //                               0,
                                                //                               0,
                                                //                               0),
                                                //                       color: FlutterFlowTheme.of(
                                                //                               context)
                                                //                           .accent1,
                                                //                       textStyle: FlutterFlowTheme.of(
                                                //                               context)
                                                //                           .titleSmall
                                                //                           .override(
                                                //                             fontFamily:
                                                //                                 FlutterFlowTheme.of(context).titleSmallFamily,
                                                //                             color:
                                                //                                 FlutterFlowTheme.of(context).primaryBackground,
                                                //                             useGoogleFonts:
                                                //                                 GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                //                           ),
                                                //                       borderSide:
                                                //                           BorderSide(
                                                //                         color: Colors
                                                //                             .transparent,
                                                //                       ),
                                                //                       borderRadius:
                                                //                           BorderRadius.circular(
                                                //                               8),
                                                //                     ),
                                                //                   ),
                                                //             ],
                                                //           ),
                                                //         ],
                                                //       ),
                                                //     ),
                                                //   ],
                                                // )