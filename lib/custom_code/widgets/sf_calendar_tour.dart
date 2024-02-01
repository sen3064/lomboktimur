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

class SfCalendarTour extends StatefulWidget {
  const SfCalendarTour({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SfCalendarTourState createState() => _SfCalendarTourState();
}

class _SfCalendarTourState extends State<SfCalendarTour> {
  List<DateTime> selectedDates = [];

  bool _isDateDisabled(DateTime date) {
    final now = DateTime.now();
    return date.isBefore(DateTime(now.year, now.month, now.day));
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        final selectedDate = args.value as DateTime;
        if (!_isDateDisabled(selectedDate)) {
          if (selectedDates.contains(selectedDate)) {
            selectedDates.remove(selectedDate);
          } else {
            selectedDates.add(selectedDate);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
        selectionMode: DateRangePickerSelectionMode.multiple,
        onSelectionChanged: _onSelectionChanged,
        showActionButtons: true,
        onSubmit: (Object? value) {
          // TODO: Implement your code here
          // You can access the selected dates using the 'selectedDates' list
          print(selectedDates);
        },
      ),
    );
  }
}
