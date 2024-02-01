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

import 'package:time_picker_sheet/widget/behaviour/snap_scroll.dart';
import 'package:time_picker_sheet/widget/composition/body.dart';
import 'package:time_picker_sheet/widget/composition/header.dart';
import 'package:time_picker_sheet/widget/composition/indicator.dart';
import 'package:time_picker_sheet/widget/composition/numbers.dart';
import 'package:time_picker_sheet/widget/composition/wheel.dart';
import 'package:time_picker_sheet/widget/provider/time_picker.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class Timepickersheet0021 extends StatefulWidget {
  const Timepickersheet0021({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _Timepickersheet0021State createState() => _Timepickersheet0021State();
}

class _Timepickersheet0021State extends State<Timepickersheet0021> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTimeSelected = DateTime.now();

  void _openTimePickerSheet(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Pilih Tanggal',
        minuteTitle: 'Menit',
        hourTitle: 'Jam',
        saveButtonText: 'Simpan',
      ),
    );

    if (result != null) {
      setState(() {
        dateTimeSelected = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _openTimePickerSheet(context),
              child: Text('show time picker sheet'),
            ),
            Text('Time ${dateTimeSelected.hour}:${dateTimeSelected.minute}'),
          ],
        ),
      ),
    );
  }
}
