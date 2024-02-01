import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pick_date_checkin_model.dart';
export 'pick_date_checkin_model.dart';

class PickDateCheckinWidget extends StatefulWidget {
  const PickDateCheckinWidget({Key? key}) : super(key: key);

  @override
  _PickDateCheckinWidgetState createState() => _PickDateCheckinWidgetState();
}

class _PickDateCheckinWidgetState extends State<PickDateCheckinWidget> {
  late PickDateCheckinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickDateCheckinModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlutterFlowCalendar(
            color: Color(0xFF1F72C5),
            iconColor: FlutterFlowTheme.of(context).secondaryText,
            weekFormat: false,
            weekStartsMonday: false,
            rowHeight: 64.0,
            onChange: (DateTimeRange? newSelectedDate) {
              setState(() => _model.calendarSelectedDay = newSelectedDate);
            },
            titleStyle: FlutterFlowTheme.of(context).headlineSmall,
            dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
            dateStyle: FlutterFlowTheme.of(context).bodyMedium,
            selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  color: FlutterFlowTheme.of(context).gray200,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleSmallFamily),
                ),
            inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
          ),
          FFButtonWidget(
            onPressed: () async {
              final _datePickedDate = await showDatePicker(
                context: context,
                initialDate: _model.calendarSelectedDay!.start,
                firstDate: _model.calendarSelectedDay!.start,
                lastDate: DateTime(2050),
              );

              if (_datePickedDate != null) {
                setState(() {
                  _model.datePicked = DateTime(
                    _datePickedDate.year,
                    _datePickedDate.month,
                    _datePickedDate.day,
                  );
                });
              }
              FFAppState().startDate = _model.datePicked;
              Navigator.pop(context);
            },
            text: 'Pilih Tanggal',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFF1F72C5),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
