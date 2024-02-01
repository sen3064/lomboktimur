import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/core/helpers/common_helper.dart';
import 'package:kelotimaja/home/chat/chat_widget.dart';
import 'package:kelotimaja/makanan/home_makanan/home_makanan_widget.dart';
import 'package:kelotimaja/theme.dart';

import '/components/varian_produk_u_m_k_m_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/penginapan/list_ulasan_rating/list_ulasan_rating_widget.dart';
import '/umkm/home_u_m_k_m/home_u_m_k_m_widget.dart';
import '/umkm/isi_data_u_m_k_m/isi_data_u_m_k_m_widget.dart';
import '/umkm/keranjang/keranjang_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'detail_produk_food_model.dart';
export 'detail_produk_food_model.dart';

class FadeAppBar extends StatelessWidget {
  final double scrollOffset;

  const FadeAppBar({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return SafeArea(
      top: false,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        color: Colors.white
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: SafeArea(child: AppBarNavigasi()),
      ),
    );
  }
}

class AppBarNavigasi extends StatelessWidget {
  const AppBarNavigasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              FFAppState().update(() {
                FFAppState().variantUMKM = null;
              });
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomeUMKMWidget(),
              //   ),
              // );
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_sharp,
              size: 24,
            ),
          ),
          //
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(),
            child: // Generated code for this Stack Widget...
                Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: FlutterFlowIconButton(
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 40,
                    // fillColor: Color(0xBB393939),
                    icon: Icon(
                      FFIcons.kshoppingBagCopy,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KeranjangWidget(
                            dataUmkm: FFAppState().productUmkm,
                            cartData: FFAppState().cartAddJson,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, -1),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).error,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        FFAppState().cartAddJson.length.toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: Colors.white,
                              fontSize: 10,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailProdukFoodWidget extends StatefulWidget {
  const DetailProdukFoodWidget({
    Key? key,
    required this.umkmData,
    required this.umkmId,
    required this.variants,
  }) : super(key: key);

  final dynamic umkmData;
  final String? umkmId;
  final dynamic variants;

  @override
  _DetailProdukFoodWidgetState createState() => _DetailProdukFoodWidgetState();
}

class _DetailProdukFoodWidgetState extends State<DetailProdukFoodWidget> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;
  late DetailProdukFoodModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailProdukFoodModel());
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _model.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async {
        FFAppState().update(() {
          FFAppState().variantUMKM = null;
        });

        Get.back();
        return true; // Jika false, tombol back akan diabaikan
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            // Generated code for this PageView Widget...
                            Container(
                              height: 300,
                              child: Stack(
                                children: [
                                  PageView(
                                    controller: _model.pageViewController2 ??=
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
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
                                                  getJsonField(widget.umkmData,
                                                          r'''$.banner''')[
                                                      '400x350'],
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: getJsonField(
                                                  widget.umkmData,
                                                  r'''$.banner''',
                                                )['400x350'],
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: getJsonField(
                                            widget.umkmData,
                                            r'''$.banner''',
                                          )['400x350'],
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.network(
                                              getJsonField(widget.umkmData,
                                                  r'''$.banner''')['400x350'],
                                              width: 300,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 0, 16),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller:
                                            _model.pageViewController2 ??=
                                                PageController(initialPage: 0),
                                        count: 1,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController2!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect:
                                            smooth_page_indicator.SlideEffect(
                                          spacing: 8,
                                          radius: 16,
                                          dotWidth: 8,
                                          dotHeight: 8,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .accent1,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Builder(
                              builder: (context) {
                                // final detailGallery = getJsonField(
                                //   widget.umkmData,
                                //   r'''$.gallery''',
                                // ).toList();
                                final detailGallery = getJsonField(
                                  widget.umkmData,
                                  r'''$.gallery''',
                                );

                                final bannerImage = getJsonField(
                                  widget.umkmData,
                                  r'''$.banner''',
                                );
                                List<dynamic> galleryData =
                                    detailGallery != null &&
                                            detailGallery is List
                                        ? detailGallery.toList()
                                        : (bannerImage != null
                                            ? [bannerImage]
                                            : []);
                                return Container(
                                  // width: double.infinity,
                                  height: 300,
                                  child: Stack(
                                    children: [
                                      PageView.builder(
                                        controller: _model
                                                .pageViewController ??=
                                            // PageController(
                                            //     initialPage: min(
                                            //         0, galleryData.length - 1)),
                                            PageController(
                                                initialPage:
                                                    galleryData.isNotEmpty
                                                        ? 0
                                                        : 0),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: galleryData.length,
                                        itemBuilder:
                                            (context, detailGalleryIndex) {
                                          final detailGalleryItem =
                                              galleryData[detailGalleryIndex];
                                          final imageUrl =
                                              detailGalleryItem != null
                                                  ? detailGalleryItem
                                                  : bannerImage;
                                          return InkWell(
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
                                                      getJsonField(
                                                        imageUrl,
                                                        r'$..["400x350"]',
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: getJsonField(
                                                      imageUrl,
                                                      r'$..["400x350"]',
                                                    ),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: getJsonField(
                                                imageUrl,
                                                r'$..["400x350"]',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                child: Image.network(
                                                  getJsonField(
                                                    imageUrl,
                                                    r'$..["400x350"]',
                                                  ),
                                                  width: 300,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 16),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        detailGallery.length -
                                                            1)),
                                            count: detailGallery.length,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            },
                                            effect: smooth_page_indicator
                                                .SlideEffect(
                                              spacing: 8,
                                              radius: 16,
                                              dotWidth: 8,
                                              dotHeight: 8,
                                              dotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            //
                          ],
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState().variantUMKM == null)
                                      Expanded(
                                        child: Text(
                                          getJsonField(
                                            widget.umkmData,
                                            r'''$.name''',
                                          ).toString(),
                                          style: semibold12_5.copyWith(
                                              color: dark2),
                                        ),
                                      ),
                                    if (FFAppState().variantUMKM != null)
                                      Expanded(
                                        child: Text(
                                          getJsonField(
                                            FFAppState().variantUMKM,
                                            r'''$.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLargeFamily),
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (FFAppState().variantUMKM == null)
                                      Text(
                                        formatNumber(
                                          double.parse(getJsonField(
                                            widget.umkmData,
                                            r'''$.price''',
                                          ).toString()),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                          currency: 'Rp ',
                                        ),
                                        style: semibold14.copyWith(color: red1),
                                      ),
                                    if (FFAppState().variantUMKM != null)
                                      Text(
                                        formatNumber(
                                          double.parse(getJsonField(
                                            FFAppState().variantUMKM,
                                            r'''$.price''',
                                          ).toString()),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                          currency: 'Rp ',
                                        ),
                                        style: semibold14.copyWith(color: red1),
                                      ),
                                    // ToggleIcon(
                                    //   onPressed: () async {
                                    //     setState(() =>
                                    //         FFAppState().trueFalse =
                                    //             !FFAppState().trueFalse);
                                    //   },
                                    //   value: FFAppState().trueFalse,
                                    //   onIcon: Icon(
                                    //     Icons.favorite_border,
                                    //     color: FlutterFlowTheme.of(context)
                                    //         .primary,
                                    //     size: 25,
                                    //   ),
                                    //   offIcon: Icon(
                                    //     Icons.favorite_rounded,
                                    //     color: FlutterFlowTheme.of(context)
                                    //         .error,
                                    //     size: 25,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Terjual ',
                                            style: regular10.copyWith(
                                                color: dark2),
                                          ),
                                          TextSpan(
                                            text: getJsonField(
                                              widget.umkmData,
                                              r'''$.total_sales''',
                                            ).toString(),
                                            style: regular10.copyWith(
                                                color: dark2),
                                          )
                                        ],
                                        style: regular10.copyWith(color: dark2),
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
                                            10, 0, 0, 0),
                                        child: Container(
                                          width: 70,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Icon(
                                                  Icons.star_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 15,
                                                ),
                                              ),
                                              Text(
                                                '4.5',
                                                style: regular10.copyWith(
                                                    color: dark2),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (getJsonField(
                                          widget.umkmData,
                                          r'''$.variants[:].name''',
                                        ) !=
                                        null)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Pilih varian',
                                                style: semibold12_5.copyWith(
                                                    color: dark2),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final dataVariants =
                                                  widget.variants!.toList();
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      dataVariants.length,
                                                      (dataVariantsIndex) {
                                                    final dataVariantsItem =
                                                        dataVariants[
                                                            dataVariantsIndex];

                                                    bool isSelected =
                                                        FFAppState()
                                                                .variantUMKM ==
                                                            dataVariantsItem;
                                                    return InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          FFAppState()
                                                                  .variantUMKM =
                                                              dataVariantsItem;
                                                        });
                                                      },
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color: isSelected
                                                            ? Colors.white
                                                            : Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          side: BorderSide(
                                                            color: isSelected
                                                                ? Colors
                                                                    .redAccent
                                                                : Colors.grey
                                                                    .withOpacity(
                                                                        0.3),
                                                            width: isSelected
                                                                ? 1
                                                                : 1,
                                                          ),
                                                        ),
                                                        elevation: 0.0,
                                                        child: InkWell(
                                                          onTap: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                      .variantUMKM =
                                                                  dataVariantsItem;
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                                child: dataVariantsItem[
                                                                            'image'] !=
                                                                        null
                                                                    ? Image
                                                                        .network(
                                                                        (dataVariantsItem['image'] as Map<
                                                                            String,
                                                                            dynamic>)['200x150'],
                                                                        width:
                                                                            60,
                                                                        height:
                                                                            70,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )
                                                                    : Container(),
                                                              ),
                                                              Text(
                                                                truncateText(
                                                                  getJsonField(
                                                                          dataVariantsItem,
                                                                          r'''$.name''')
                                                                      .toString(),
                                                                  6,
                                                                ),
                                                                style: regular12_5
                                                                    .copyWith(
                                                                        color:
                                                                            dark2),
                                                              ),
                                                              SizedBox(
                                                                height: 2,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Detail Produk',
                                            style:
                                                bold16.copyWith(color: dark1),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Kategori',
                                                style: regular14.copyWith(
                                                    color: dark2),
                                              ),
                                              Text(
                                                'Min. Pembelian',
                                                style: regular14.copyWith(
                                                    color: dark2),
                                              ),
                                              // Text(
                                              //   'Panjang ',
                                              //   style:
                                              //       FlutterFlowTheme.of(context)
                                              //           .bodyMedium,
                                              // ),
                                              // Text(
                                              //   'Lebar ',
                                              //   style:
                                              //       FlutterFlowTheme.of(context)
                                              //           .bodyMedium,
                                              // ),
                                              // Text(
                                              //   'Tinggi ',
                                              //   style:
                                              //       FlutterFlowTheme.of(context)
                                              //           .bodyMedium,
                                              // ),
                                              Text(
                                                'Berat ',
                                                style: regular14.copyWith(
                                                    color: dark2),
                                              ),
                                              Text(
                                                'Lokasi',
                                                style: regular14.copyWith(
                                                    color: dark2),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      widget.umkmData,
                                                      r'''$.category_name''',
                                                    ).toString(),
                                                    'Tidak ada kategori',
                                                  ),
                                                  style: semibold12_5.copyWith(
                                                      color: red1),
                                                ),
                                                Text(
                                                  '1 Buah',
                                                  style: semibold12_5.copyWith(
                                                      color: dark1),
                                                ),
                                                // Text(
                                                //   '${getJsonField(widget.umkmData, r'''$.length''').toString()} cm',
                                                //   style: FlutterFlowTheme.of(
                                                //           context)
                                                //       .bodyMedium,
                                                // ),
                                                // Text(
                                                //   '${getJsonField(widget.umkmData, r'''$.width''').toString()} cm',
                                                //   style: FlutterFlowTheme.of(
                                                //           context)
                                                //       .bodyMedium,
                                                // ),
                                                // Text(
                                                //   '${getJsonField(widget.umkmData, r'''$.height''').toString()} cm',
                                                //   style: FlutterFlowTheme.of(
                                                //           context)
                                                //       .bodyMedium,
                                                // ),
                                                Text(
                                                  '${getJsonField(widget.umkmData, r'''$.weight''')} Kg',
                                                  style: semibold12_5.copyWith(
                                                      color: dark1),
                                                ),
                                                Text(
                                                  '${getJsonField(widget.umkmData, r'''$.location_name''')}',
                                                  style: semibold12_5.copyWith(
                                                      color: dark1),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Deskripsi Produk',
                                                    style: bold16.copyWith(
                                                        color: dark1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      getJsonField(
                                                        widget.umkmData,
                                                        r'''$.description''',
                                                      ).toString(),
                                                      'Tidak ada deskripsi',
                                                    ),
                                                    style: regular14.copyWith(
                                                        color: dark2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Padding(
                                            //   padding:
                                            //       EdgeInsetsDirectional.fromSTEB(
                                            //           0, 5, 0, 0),
                                            //   child: Text(
                                            //     'Baca Selengkapnya',
                                            //     style: FlutterFlowTheme.of(
                                            //             context)
                                            //         .bodyMedium
                                            //         .override(
                                            //           fontFamily:
                                            //               FlutterFlowTheme.of(
                                            //                       context)
                                            //                   .bodyMediumFamily,
                                            //           color: FlutterFlowTheme.of(
                                            //                   context)
                                            //               .accent1,
                                            //           fontWeight: FontWeight.w500,
                                            //           useGoogleFonts: GoogleFonts
                                            //                   .asMap()
                                            //               .containsKey(
                                            //                   FlutterFlowTheme.of(
                                            //                           context)
                                            //                       .bodyMediumFamily),
                                            //         ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          getJsonField(widget.umkmData,
                                              r'''$.seller.banner'''),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    widget.umkmData,
                                                    r'''$.seller.name''',
                                                  ).toString(),
                                                  'Tidak ada nama penjual',
                                                ),
                                                style: semibold12_5.copyWith(
                                                    color: dark2),
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
                                              //               FlutterFlowTheme.of(
                                              //                       context)
                                              //                   .secondary,
                                              //           fontWeight:
                                              //               FontWeight.w600,
                                              //         ),
                                              //       )
                                              //     ],
                                              //     style:
                                              //         FlutterFlowTheme.of(context)
                                              //             .labelSmall,
                                              //   ),
                                              // ),
                                            ],
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Rating & Ulasan',
                                        style: regular10.copyWith(color: dark2),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFFC107),
                                          size: 15,
                                        ),
                                      ),
                                      Text(
                                        '0',
                                        style: regular10.copyWith(color: dark2),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            '(Belum Ada Ulasan)',
                                            style: regular10.copyWith(
                                                color: dark2),
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
                                                objectId: '28',
                                                objectModel: 'food-beverages',
                                                productsName: getJsonField(
                                                  widget.umkmData,
                                                  r'''$.name''',
                                                ).toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
              PreferredSize(
                child: FadeAppBar(scrollOffset: _scrollControllerOffset),
                preferredSize: Size(MediaQuery.of(context).size.width, 20.0),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                              // spreadRadius: 4,
                            )
                          ],
                        ),

                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (FFAppState().accessToken.isNotEmpty)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    String lastName = widget.umkmData['seller']
                                            ['last_name'] ??
                                        '';
                                    Get.to(() => const ChatWidget(),
                                        arguments: {
                                          'to_username':
                                              '${widget.umkmData['seller']['first_name']}.${lastName.replaceAll(" ", "-")}',
                                          'not_navbar': true
                                        });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.wechat_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 5,
                              ),
                              // Beli langsung ada varian
                              if (getJsonField(
                                    widget.umkmData,
                                    r'''$.variants[:].name''',
                                  ) !=
                                  null)
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (FFAppState().variantUMKM != null) {
                                        setState(() {
                                          FFAppState().variantUMKM =
                                              FFAppState().variantUMKM;
                                        });

                                        var orderItems = {
                                          'items': FFAppState().variantUMKM,
                                          'toko': widget.umkmData['seller'],
                                          'address2': FFAppState().userAddress2,
                                          'address': FFAppState().userAddress,
                                          'shipping_cost':
                                              widget.umkmData['seller']
                                                  ['shipping_cost']
                                        };

                                        Get.to(() => IsiDataUMKMWidget(
                                              items: orderItems,
                                              accessToken:
                                                  FFAppState().accessToken,
                                              userData: FFAppState().userData,
                                            ));
                                      } else {
                                        Get.snackbar(
                                          'Pilih Varian',
                                          'Pilih varian produk yang diinginkan',
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration:
                                              Duration(milliseconds: 4000),
                                          margin: EdgeInsets.only(bottom: 20),
                                          messageText: Text(
                                            'Pilih varian produk yang diinginkan',
                                            style: TextStyle(
                                              fontWeight: FontWeight
                                                  .w400, // Menentukan tebalnya teks
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFFFF0202),
                                        ),
                                      ),
                                      child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Text(
                                            'Beli Langsung',
                                            style:
                                                regular14.copyWith(color: red1),
                                          )),
                                    ),
                                  ),
                                ),

                              SizedBox(
                                width: 5,
                              ),
                              // Beli langsung kalo ga ada varian
                              if (getJsonField(
                                    widget.umkmData,
                                    r'''$.variants[:].name''',
                                  ) ==
                                  null)
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      var orderItems = {
                                        'items': widget.umkmData,
                                        // 'totalPrice':  widget.umkmData['price'],
                                        'toko': widget.umkmData['seller'],
                                        'address2': FFAppState().userAddress2,
                                        'address': FFAppState().userAddress,
                                        'shipping_cost': widget
                                            .umkmData['seller']['shipping_cost']
                                      };
                                      // CommonHelper.logPrint(jsonEncode(orderItems));
                                      Get.to(() => IsiDataUMKMWidget(
                                          items: orderItems,
                                          accessToken: FFAppState().accessToken,
                                          userData: FFAppState().userData));
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFFFF0202),
                                        ),
                                      ),
                                      child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Text(
                                            'Beli Langsung',
                                            style:
                                                regular14.copyWith(color: red1),
                                          )),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 5,
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().productCartUmkm =
                                          widget.umkmData!;
                                    });
                                    if (getJsonField(
                                          widget.umkmData,
                                          r'''$.variants[:].name''',
                                        ) !=
                                        null) {
                                      if (FFAppState().variantUMKM != null) {
                                        bool isAdd = true;
                                        for (int i = 0;
                                            i < FFAppState().cartAddJson.length;
                                            i++) {
                                          if (FFAppState().cartAddJson[i]
                                                  ['id'] ==
                                              FFAppState().variantUMKM['id']) {
                                            if (FFAppState().cartAddJson[i]
                                                    ['product_id'] !=
                                                null) {
                                              if (FFAppState().cartAddJson[i]
                                                      ['product_id'] ==
                                                  FFAppState().variantUMKM[
                                                      'product_id']) {
                                                setState(() {
                                                  isAdd = false;
                                                  FFAppState().cartAddJson[i]
                                                          ['quantity'] =
                                                      (FFAppState().cartAddJson[
                                                                      i][
                                                                  'quantity'] ??
                                                              1) +
                                                          1;
                                                });
                                              }
                                            }
                                          }
                                        }
                                        if (isAdd) {
                                          FFAppState().update(() {
                                            FFAppState().addToCartAddJson(
                                                FFAppState().variantUMKM);
                                            FFAppState().addToProductUmkm(
                                                FFAppState().productCartUmkm);
                                          });
                                        }
                                        if (FFAppState().cartAddJson.contains(
                                                FFAppState().variantUMKM) !=
                                            null) {
                                          FFAppState().update(() {
                                            FFAppState().variantUMKM = null;
                                          });
                                          Get.snackbar(
                                            'Proses pembelian berhasil',
                                            'Produk telah berhasil ditambahkan ke dalam keranjang belanja Anda',
                                            snackPosition: SnackPosition.BOTTOM,
                                            duration:
                                                Duration(milliseconds: 4000),
                                            margin: EdgeInsets.only(bottom: 20),
                                            messageText: Text(
                                              'Produk telah berhasil ditambahkan ke dalam keranjang belanja Anda',
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .w400, // Menentukan tebalnya teks
                                              ),
                                            ),
                                          );
                                        }
                                      } else {
                                        Get.snackbar(
                                          'Pilih Varian',
                                          'Pilih varian produk yang diinginkan',
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration:
                                              Duration(milliseconds: 4000),
                                          margin: EdgeInsets.only(bottom: 20),
                                          messageText: Text(
                                            'Pilih varian produk yang diinginkan',
                                            style: TextStyle(
                                              fontWeight: FontWeight
                                                  .w400, // Menentukan tebalnya teks
                                            ),
                                          ),
                                        );
                                      }
                                    } else {
                                      FFAppState().update(() {
                                        // FFAppState().addToCartAddJson({});
                                        FFAppState().variantUMKM =
                                            FFAppState().productCartUmkm;
                                      });
                                      if (FFAppState().variantUMKM != null) {
                                        bool isAdd = true;
                                        for (int i = 0;
                                            i < FFAppState().cartAddJson.length;
                                            i++) {
                                          if (FFAppState().cartAddJson[i]
                                                  ['id'] ==
                                              FFAppState().variantUMKM['id']) {
                                            if (FFAppState().cartAddJson[i]
                                                    ['product_id'] ==
                                                null) {
                                              setState(() {
                                                isAdd = false;
                                                FFAppState().cartAddJson[i]
                                                        ['quantity'] =
                                                    (FFAppState().cartAddJson[i]
                                                                ['quantity'] ??
                                                            1) +
                                                        1;
                                              });
                                            }
                                          }
                                        }
                                        if (isAdd) {
                                          setState(() {
                                            FFAppState().addToCartAddJson(
                                                FFAppState().variantUMKM);
                                            FFAppState().addToProductUmkm(
                                                FFAppState().productCartUmkm);
                                          });
                                        }
                                        if (FFAppState().cartAddJson.contains(
                                                FFAppState().variantUMKM) !=
                                            null) {
                                          FFAppState().update(() {
                                            FFAppState().variantUMKM = null;
                                          });
                                          Get.snackbar(
                                            'Proses pembelian berhasil',
                                            'Produk telah berhasil ditambahkan ke dalam keranjang belanja Anda',
                                            snackPosition: SnackPosition.BOTTOM,
                                            duration:
                                                Duration(milliseconds: 4000),
                                            margin: EdgeInsets.only(bottom: 20),
                                            messageText: Text(
                                              'Produk telah berhasil ditambahkan ke dalam keranjang belanja Anda',
                                              style: TextStyle(
                                                fontWeight: FontWeight
                                                    .w400, // Menentukan tebalnya teks
                                              ),
                                            ),
                                          );
                                        }
                                      } else {
                                        Get.snackbar(
                                          'Maaf, tidak dapat menambahkan produk pada saat ini',
                                          'Mohon periksa kembali atau coba lagi nanti.',
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration:
                                              Duration(milliseconds: 4000),
                                          margin: EdgeInsets.only(bottom: 20),
                                          messageText: Text(
                                            'Mohon periksa kembali atau coba lagi nanti.',
                                            style: TextStyle(
                                              fontWeight: FontWeight
                                                  .w400, // Menentukan tebalnya teks
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20,
                                          ),
                                          Text(
                                            'Keranjang',
                                            style: regular14.copyWith(
                                                color: white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
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
        ),
      ),
    );
  }
}

String truncateText(String text, int maxLength) {
  return text.length > maxLength ? text.substring(0, maxLength) + '...' : text;
}
