import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_testing_model.dart';
export 'map_testing_model.dart';

class MapTestingWidget extends StatefulWidget {
  const MapTestingWidget({Key? key}) : super(key: key);

  @override
  _MapTestingWidgetState createState() => _MapTestingWidgetState();
}

class _MapTestingWidgetState extends State<MapTestingWidget> {
  late MapTestingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapTestingModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Pilih Lokasi',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                  fontSize: 24.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineLargeFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 600.0,
                child: custom_widgets.PlacePicker(
                  width: double.infinity,
                  height: 600.0,
                  action: () async {
                    setState(() {
                      FFAppState().locationLatLng = FFAppState().locationLatLng;
                      FFAppState().address = FFAppState().address;
                    });
                  },
                ),
              ),
              Text(
                valueOrDefault<String>(
                  FFAppState().address,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                valueOrDefault<String>(
                  FFAppState().locationLatLng?.toString(),
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
