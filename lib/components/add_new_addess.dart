import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kelotimaja/core/constants/constant.dart';
import 'package:kelotimaja/core/constants/storage.dart';
import 'package:kelotimaja/core/controllers/gps_controller.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  GPSController gpsC = Get.find<GPSController>();
  Map<String, dynamic> result = {
    'line1': '',
    'line2': '',
    'latitude': 0,
    'longitude': 0
  };
  TextEditingController addressController = TextEditingController();
  TextEditingController addressDetailController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  Key _k1 = GlobalKey();
  BitmapDescriptor? customIcon;
  Set<Marker>? markers;
  double oldLatitude = Get.arguments['latitude'] ?? 0.0;
  double oldLongitude = Get.arguments['longitude'] ?? 0.0;

  // int locationId = Get.arguments['object_data']['toko']['location_id'];
  int locationId = 73;

  Map<int, dynamic> listCoor = {
    72: {
      "lat": -8.351896155732838,
      "long": 120.18779423257892,
      "zipcode": "14510"
    },
    73: {
      "lat": -8.564261690890259,
      "long": 120.27913171842796,
      "zipcode": "14510"
    },
    74: {
      "lat": -8.4686844248048,
      "long": 120.18480588745125,
      "zipcode": "14510"
    },
    75: {
      "lat": -8.564261690890259,
      "long": 120.27913171842796,
      "zipcode": "14510"
    },
    76: {
      "lat": -8.701056214281598,
      "long": 120.13615844838986,
      "zipcode": "14510"
    },
    77: {
      "lat": -8.695918383431309,
      "long": 119.98349735332057,
      "zipcode": "14510"
    },
    78: {
      "lat": -8.536930406937877,
      "long": 119.4846910456537,
      "zipcode": "14510"
    },
    79: {
      "lat": -8.483984357949048,
      "long": 120.03295591245667,
      "zipcode": "14510"
    },
    80: {
      "lat": -8.616919172510872,
      "long": 120.19870842826826,
      "zipcode": "14510"
    },
    81: {
      "lat": -8.490968788658995,
      "long": 120.32883801927068,
      "zipcode": "14510"
    },
    82: {
      "lat": -8.76650555370864,
      "long": 120.07994037779092,
      "zipcode": "14510"
    },
    83: {
      "lat": -8.667681404271246,
      "long": 120.72198936058139,
      "zipcode": "14510"
    },
  };

  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  double _latitude = 0;
  double _longitude = 0;
  bool _storeloc = false;
  bool _isShownAlert = false;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  @override
  void initState() {
    super.initState();
    _getPosition();
    // print(Get.arguments['object_data']['toko']);
    addressController.text = "";
    markers = Set.from([]);
    if (customIcon == null) {
      // ImageConfiguration configuration =
      //     createLocalImageConfiguration(context, size: Size(48.0, 48.0));
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(1, 1)),
              'assets/images/custom_marker.png')
          .then((icon) {
        customIcon = icon;
      });
    }
    _latitude = oldLatitude != 0.0 ? oldLatitude : gpsC.latitude.value;
    _longitude = oldLongitude != 0.0 ? oldLongitude : gpsC.longitude.value;
  }

  _showAlert(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        setState(() {
          _isShownAlert = true;
        });
        Navigator.of(context).pop();
        _getPosition();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Location Data Usage"),
      content: const Text(
          "kelotimaja collects location data to enable Transaction Feature while this application is in use."),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _getPosition() async {
    final position = await _getCurrentPosition();
    if (position != null) {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      log(jsonEncode(placemarks));
      log(jsonEncode(position));
      await localStorage.write('location', position);
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _storeloc = true;
      });
    }
    // Timer(Duration(milliseconds: 60000), _getPosition);
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
  }

  Future<dynamic> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    // if (!hasPermission) {
    //   return;
    // }
    if (hasPermission == null) {}
    final position = await Geolocator.getCurrentPosition();
    log(position.toString());
    return position;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!_isShownAlert) {
        return _showAlert(context);
      }
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      log(_kLocationServicesDisabledMessage);

      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (!_isShownAlert) {
        return _showAlert(context);
      }
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        log(_kPermissionDeniedMessage);

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      log(_kPermissionDeniedForeverMessage);

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    log(_kPermissionGrantedMessage);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Atur Alamat Antar',
          style: headingStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomSheet: Wrap(
        children: <Widget>[
          Material(
            elevation: 7.0,
            child: Container(
              padding: EdgeInsets.all(fixPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Container(
                        width: 35.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: greyColor,
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding),
                      child: Container(
                        width: width - (fixPadding * 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.7, color: primaryColor),
                        ),
                        child: TextFormField(
                          // key: _k1,
                          controller: addressController,
                          autofocus: false,
                          style: moreStyle,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15.0),
                            // hintText: 'Ketik alamat anda disini',
                            hintStyle: moreStyle,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: InkWell(
                        // onTap: () => Navigator.pop(context),
                        // onTap: () => _sendDataBack(context),
                        onTap: () => Get.back(result: result),
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: primaryColor,
                          ),
                          child: Text(
                            'Simpan',
                            style: buttonWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: GoogleMap(
        markers: markers!,
        onTap: (pos) async {
          List<Placemark> placemarks =
              await placemarkFromCoordinates(pos.latitude, pos.longitude);
          print(placemarks[0]);
          result['line1'] = placemarks[0].street! +
              ', ' +
              placemarks[0].subLocality! +
              ', ' +
              placemarks[0].locality! +
              ', ' +
              placemarks[0].subAdministrativeArea! +
              ', ' +
              placemarks[0].administrativeArea! +
              ', ' +
              placemarks[0].country! +
              ' ' +
              (placemarks[0].postalCode!.isEmpty
                  ? listCoor[locationId]['zipcode']
                  : placemarks[0].postalCode);
          addressController.text = result['line1'];
          print(pos);
          result['latitude'] = pos.latitude;
          result['longitude'] = pos.longitude;
          Marker m = Marker(
              markerId: const MarkerId('1'), icon: customIcon!, position: pos);
          setState(() {
            markers!.add(m);
          });
        },
        onMapCreated: (GoogleMapController controller) {
          Marker m = Marker(
              markerId: const MarkerId('1'),
              icon: customIcon!,
              position: LatLng(_latitude, _longitude));
          setState(() {
            markers!.add(m);
          });
        },
        initialCameraPosition: CameraPosition(
            // target: LatLng(
            //     listCoor[locationId]['lat'], listCoor[locationId]['long']),
            target: LatLng(_latitude, _longitude),
            zoom: 15),
      ),
    );
  }

  void _sendDataBack(BuildContext context) {
    String textTosendBack = addressController.text;
    Navigator.pop(context, textTosendBack);
  }
}
