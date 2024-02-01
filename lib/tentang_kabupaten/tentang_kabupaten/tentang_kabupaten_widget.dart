import 'package:kolaka/backend/api_requests/api_calls.dart';
import 'package:kolaka/backend/api_requests/api_manager.dart';
import 'package:http/http.dart' as http;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'tentang_kabupaten_model.dart';
export 'tentang_kabupaten_model.dart';

class TentangKabupatenWidget extends StatefulWidget {
  const TentangKabupatenWidget({Key? key}) : super(key: key);

  @override
  _TentangKabupatenWidgetState createState() => _TentangKabupatenWidgetState();
}

class _TentangKabupatenWidgetState extends State<TentangKabupatenWidget> {
  late TentangKabupatenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TentangKabupatenModel());
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
        body: FutureBuilder<ApiCallResponse>(
            future: TentangKabupatenGroup.tentangKabCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).tertiary400,
                      ),
                    ),
                  ),
                );
              }
              final tentangKabResponse = snapshot.data!;
              final tentangKabData = tentangKabResponse.jsonBody['data'];
              // print(tentangKabData);
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 348,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                tentangKabData['banner']['250x200'],
                                width: double.infinity,
                                height: 347,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20,
                                borderWidth: 1,
                                buttonSize: 40,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                      // Generated code for this Column Widget...
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tentangKabData['title'],
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  tentangKabData['content'],
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),

                              Builder(
                                builder: (context) {
                                  final listGallery =
                                      tentangKabData['gallery'].toList();
                                  // print(listGallery);

                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Column(
                                      children: List.generate(
                                        listGallery.length,
                                        (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              listGallery[index]['250x200'],
                                              width: double.infinity,
                                              height: 261,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              // Text(
                              //   'Kecamatan-kecamatan di kabupaten Kolaka',
                              //   textAlign: TextAlign.start,
                              //   style: FlutterFlowTheme.of(context)
                              //       .titleMedium
                              //       .override(
                              //         fontFamily: FlutterFlowTheme.of(context)
                              //             .titleMediumFamily,
                              //         fontWeight: FontWeight.w600,
                              //         useGoogleFonts: GoogleFonts.asMap().containsKey(
                              //             FlutterFlowTheme.of(context)
                              //                 .titleMediumFamily),
                              //       ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              //   child: Text(
                              //     'Ada 7 kecamatan yang berada di dalam kabupaten Kolaka, yaitu: kecamatan Komodo, kecamatan Sano Nggoang, kecamatan Boleng, kecamatan Lembor, kecamatan Welak, kecamatan Kuwus, dan kecamatan Macang Pacar.\n\nSalah satu bukti prasejarah yang masih ada sampai sekarang di Kolaka berada di kecamatan Komodo yang memiliki peranan penting sebagai sebuah kawasan pelestarian hewan langka yaitu Komodo (Varanus komodoensis) yang merupakan kadal tertua yang masih hidup. Satwa ini hidup di pulau Komodo dan beberapa pulau lainnya, seperti pulau Rinca dan Gili Motang. Pulau Komodo merupakan habitat asli satwa ini dan telah ditetapkan sebagai Taman Nasional Komodo yang dikelola oleh pemerintah. Pada tahun 1986, pulau Komodo ditetapkan sebagai situs warisan dunia oleh UNESCO. Pada tahun 2009, pulau Komodo juga menerima penghargaan New Seven Wonders of Nature.\n\nSelanjutnya pada tahun 2011, terjadi pemekaran wilayah dengan tambahan 3 kecamatan lagi, yaitu: kecamatan Lembor Selatan, kecamatan Mbeliling dan kecamatan Ndoso.\nWilayah kabupaten Kolaka menambah 2 kecamatan lagi pada tahun 2017, yaitu: kecamatan Pacar dan kecamatan Kuwus Barat.\n',
                              //     style: FlutterFlowTheme.of(context).bodySmall,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              //   child: Container(
                              //     width: double.infinity,
                              //     height: 200,
                              //     decoration: BoxDecoration(
                              //       color: FlutterFlowTheme.of(context)
                              //           .secondaryBackground,
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(8),
                              //       child: Image.network(
                              //         tentangKabData['gallery'][1]['250x200'],
                              //         width: 300,
                              //         height: 261,
                              //         fit: BoxFit.cover,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              //   child: Text(
                              //     'Tempat wisata favorit yang wajib dikunjungi',
                              //     textAlign: TextAlign.start,
                              //     style: FlutterFlowTheme.of(context)
                              //         .titleMedium
                              //         .override(
                              //           fontFamily: FlutterFlowTheme.of(context)
                              //               .titleMediumFamily,
                              //           fontWeight: FontWeight.w600,
                              //           useGoogleFonts: GoogleFonts.asMap()
                              //               .containsKey(FlutterFlowTheme.of(context)
                              //                   .titleMediumFamily),
                              //         ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              //   child: Text(
                              //     'Kabupaten Kolaka yang terletak di bagian Timur Indonesia, tepatnya di Nusa Tenggara Timur, menyimpan pesona alam yang sangat fantastis. \nTidak heran jika wilayah ini menjadi salah satu destinasi paling favorit yang banyak dikunjungi oleh wisatawan domestik maupun mancanegara.\nTempat-tempat wisata favorit yang wajib dikunjungi di wilayah ini, adalah:\n',
                              //     style: FlutterFlowTheme.of(context).bodySmall,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              //   child: Container(
                              //     width: double.infinity,
                              //     decoration: BoxDecoration(),
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.max,
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         Padding(
                              //           padding: EdgeInsetsDirectional.fromSTEB(
                              //               0, 0, 0, 5),
                              //           child: Text(
                              //             tentangKabData['title_gallery'] ?? '',
                              //             textAlign: TextAlign.start,
                              //             style: FlutterFlowTheme.of(context)
                              //                 .titleMedium
                              //                 .override(
                              //                   fontFamily:
                              //                       FlutterFlowTheme.of(context)
                              //                           .titleMediumFamily,
                              //                   fontWeight: FontWeight.w600,
                              //                   useGoogleFonts: GoogleFonts.asMap()
                              //                       .containsKey(
                              //                           FlutterFlowTheme.of(context)
                              //                               .titleMediumFamily),
                              //                 ),
                              //           ),
                              //         ),
                              //         ClipRRect(
                              //           borderRadius: BorderRadius.circular(8),
                              //           child: Image.network(
                              //             tentangKabData['gallery'][2]['250x200'],
                              //             width: double.infinity,
                              //             height: 261,
                              //             fit: BoxFit.cover,
                              //           ),
                              //         ),
                              //         Padding(
                              //           padding: EdgeInsetsDirectional.fromSTEB(
                              //               0, 10, 0, 0),
                              //           child: Text(
                              //             tentangKabData['content_gallery'] ?? '',
                              //             style:
                              //                 FlutterFlowTheme.of(context).bodySmall,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
