import 'dart:async';

import 'package:kelotimaja/core/constants/storage.dart';
import 'package:kelotimaja/core/helpers/common_helper.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/core/controllers/general_controller.dart';
import 'package:kelotimaja/core/controllers/gps_controller.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_google_map.dart';
import 'package:location/location.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class TrackingFoodWidget extends StatefulWidget {
  final dynamic booking;
  const TrackingFoodWidget({super.key, this.booking});

  @override
  State<TrackingFoodWidget> createState() => _TrackingFoodWidgetState();
}

class _TrackingFoodWidgetState extends State<TrackingFoodWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  final GetConnect connect = GetConnect();

  late LatLng sourceLocation;
  static LatLng destination = LatLng(Get.arguments['destination']['latitude'],
      Get.arguments['destination']['longitude']);

  List<LatLng> polylineCoordinates = [];

  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;

  // void getCurrentLocation() async {
  //   Location location = Location();

  //   location.getLocation().then(
  //     (location) {
  //       currentLocation = location;
  //     },
  //   );

  //   GoogleMapController googleMapController = await _controller.future;

  //   location.onLocationChanged.listen((newLoc) {
  //     currentLocation = newLoc;

  //     googleMapController.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //           zoom: 13.5,
  //           target: LatLng(
  //             newLoc.latitude!,
  //             newLoc.longitude!,
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     'AIzaSyDcdaUEAvzRcbpyti4yElPWxKO76NoGByI',
  //     PointLatLng(TrackingFoodWidget.sourceLocation.latitude,
  //         TrackingFoodWidget.sourceLocation.longitude),
  //     PointLatLng(TrackingFoodWidget.destination.latitude,
  //         TrackingFoodWidget.destination.longitude),
  //   );

  //   if (result.points.isNotEmpty) {
  //     result.points.forEach(
  //       (PointLatLng point) => polylineCoordinates.add(
  //         LatLng(point.latitude, point.longitude),
  //       ),
  //     );
  //   }
  // }

  void setCustomMarkerIcon() async {
    // await BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration.empty, "assets/images/marker/pin_source.png")
    //     .then((icon) => sourceIcon = icon);
    // await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
    //         "assets/images/marker/pin_destination.png")
    //     .then((icon) => destinationIcon = icon);
    sourceIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
        "assets/images/marker/food-package-icon-48.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        "assets/images/marker/pin_destination-48.png");
  }

  Stream<LatLng> getCourierLocation() async* {
    print('get courier location start');
    var apiurl =
        "https://api.kelotimaja.kabtour.com/v2/get-courier-location?courier_id=${widget.booking['courier_id']}";
    try {
      print('try to get response');
      var response =
          await connect.get(apiurl, headers: {"accept": "application/json"});
      CommonHelper.logPrint(response);
      var data = response.body;
      CommonHelper.logPrint(data);
      var parsed = data['data'];
      // CommonHelper.logPrint(parsed);
      if (parsed != null) {
        // Tampilkan pesan error
        CommonHelper.logPrint(parsed);
        // return;
      }
      yield LatLng(
          double.parse(parsed['latitude']), double.parse(parsed['longitude']));
    } catch (error) {
      // Tampilkan error di console
      CommonHelper.logPrint(error);
      // return;
    }
  }

  @override
  void initState() {
    super.initState();
    print("set custom marker icon");
    setCustomMarkerIcon();
    print('timer start');
    Timer.periodic(const Duration(seconds: 15), (timer) {
      getCourierLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    // setCustomMarkerIcon();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tracking Map'),
        ),
        body: StreamBuilder(
          stream: getCourierLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              LatLng position = snapshot.data!;
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: position,
                  zoom: 15.0,
                ),
                markers: <Marker>{
                  Marker(
                    markerId: const MarkerId('source'),
                    position: position,
                    icon: sourceIcon,
                  ),
                  Marker(
                    markerId: const MarkerId('destination'),
                    position: destination,
                    icon: destinationIcon,
                  ),
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
