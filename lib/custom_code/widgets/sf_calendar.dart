// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SfCalendar extends StatefulWidget {
  const SfCalendar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SfCalendarState createState() => _SfCalendarState();
}

class _SfCalendarState extends State<SfCalendar> {
  DateTime? minDate;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    minDate =
        today.add(const Duration(days: 1)); // Disable dates before tomorrow
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
    setState(() {
      if (args.value is PickerDateRange) {
        FFAppState().startDate = args.value.startDate;
        FFAppState().endDate = args.value.endDate ?? args.value.startDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        monthViewSettings: const DateRangePickerMonthViewSettings(
          firstDayOfWeek: 1,
        ),
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: _onSelectionChanged,
        minDate: minDate, // Set the minimum selectable date
      ),
    );
  }
}
