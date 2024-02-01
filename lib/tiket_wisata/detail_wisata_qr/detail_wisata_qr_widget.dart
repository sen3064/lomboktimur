import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'detail_wisata_qr_model.dart';
export 'detail_wisata_qr_model.dart';

class DetailWisataQrWidget extends StatefulWidget {
  const DetailWisataQrWidget({Key? key}) : super(key: key);

  @override
  _DetailWisataQrWidgetState createState() => _DetailWisataQrWidgetState();
}

class _DetailWisataQrWidgetState extends State<DetailWisataQrWidget> {
  late DetailWisataQrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailWisataQrModel());
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 348,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        'https://www.dewamotorbalirental.com/wp-content/uploads/tempat-wisata-labuan-bajo.jpg',
                        width: double.infinity,
                        height: 347,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: FlutterFlowIconButton(
                        borderRadius: 20,
                        borderWidth: 1,
                        buttonSize: 40,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.9, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          icon: Icon(
                            Icons.share_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Spot Wisata Romantis Bukit Amelia di Labuan Bajo',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Apa yang paling Anda nantikan jika berkunjung ke Labuan Bajo? Biasanya para wisatawan menantikan Pulau Padar, Pantai-pantai, manta point dan Pulau Komodo. Namun kali ini agak berbeda. Terdapat spot wisata yang dinamakan bukit Amelia. Nah, apa kira-kira yang dapat dinikmati di tempat ini?',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Bukit Amelia ini letaknya tidak jauh dari Bukit Cinta, namun rutenya yang harus memutar terlebih dahulu membuat jarak Bukit ini menjadi jauh. Dinamakan Amelia karena tempatnya dekat dengan Villa Amelia, yang awalnya merupakan milik pribadi dan kini dijadikan sebagai tempat wisata umum. Kemiringan Bukit Amelia Labuan Bajo terbilang curam, sehingga harus berhati-hati saat mendakinya.',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://images.tokopedia.net/blog-tokopedia-com/uploads/2019/05/wisata-labuan-bajo-5-Padar-Newsa.jpg',
                            width: 300,
                            height: 261,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Meskipun perlu mengeluarkan tenaga lebih ketika mendaki, tenaga Anda akan terbayarkan oleh pemandangan eksotis, yang dapat dinikmati dari atas bukit. Ukurannya lebih tinggi daripada Bukit Cinta, sehingga Anda dapat melihat sisi timur dan barat wilayah Labuan Bajo Utara. Posisi bukitnya yang berada di tengah, menjadikannya lokasi yang strategis untuk menyaksikan sunset.',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://img.okezone.com/content/2022/08/02/25/2640859/destinasi-wisata-di-labuan-bajo-yang-wajib-kamu-kunjungi-TASCBqNLKa.jpg',
                        width: 371,
                        height: 261,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Text(
                        'Lokasi',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: Text(
                        'Lokasi',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ),
                    Container(
                      width: 313,
                      height: 181,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: FlutterFlowGoogleMap(
                          controller: _model.googleMapsController,
                          onCameraIdle: (latLng) =>
                              _model.googleMapsCenter = latLng,
                          initialLocation: _model.googleMapsCenter ??=
                              FFLatLng(13.106061, -59.613158),
                          markerColor: GoogleMarkerColor.violet,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14,
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
