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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class PlacePicker extends StatefulWidget {
  const PlacePicker({
    Key? key,
    this.width,
    this.height,
    required this.action,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() action;

  @override
  _PlacePickerState createState() => _PlacePickerState();
}

class _PlacePickerState extends State<PlacePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLocationPicker(
          selectLocationButtonText: 'Pilih lokasi',
          initZoom: 11,
          minZoomLevel: 5,
          maxZoomLevel: 16,
          trackMyPosition: true,
          onPicked: (pickedData) {
            setState(() {
              FFAppState().address = pickedData.address;
              FFAppState().locationLatLng = FFLatLng(
                  pickedData.latLong.latitude, pickedData.latLong.longitude);
              widget.action.call();
            });
          }),
    );
  }
}
