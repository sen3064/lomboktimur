import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_theme.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:kelotimaja/flutter_flow/lat_lng.dart';

class PickerDemo extends StatefulWidget {
  const PickerDemo({
    Key? key,
    // required this.onGetCurrentLocationPressed,
  }) : super(key: key);
  // final Future<LatLng> Function() onGetCurrentLocationPressed;
  @override
  State<StatefulWidget> createState() => PickerDemoState();
}

class PickerDemoState extends State<PickerDemo> {
  // MapController controller = MapController(
  //                           initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  //                           areaLimit: BoundingBox(
  //                               east: 10.4922941,
  //                               north: 47.8084648,
  //                               south: 45.817995,
  //                               west:  5.9559113,
  //                     ),
  //           );
  FFLatLng? selectedLocation;
  final _mapController = MapController.withUserPosition(
      trackUserLocation: UserTrackingOption(
    enableTracking: true,
    unFollowUser: false,
  ));
// final _mapController = MapController();
  var markerMap = <String, String>{};
  @override
  void initState() {
    super.initState();
    // mapController = OSMFlutterController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.listenerMapSingleTapping.addListener(() async {
        var posisition = _mapController.listenerMapSingleTapping.value;
        if (posisition != null) {
          await _mapController.addMarker(posisition,
              markerIcon: const MarkerIcon(
                icon: Icon(
                  Icons.pin_drop,
                  color: Colors.blue,
                  size: 48,
                ),
              ));

          //add marker to map for hold information
          var key = '${posisition!.latitude}_${posisition!.longitude}';
          markerMap[key] = markerMap.length.toString();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picker Example')),
      body: OSMFlutter(
        controller: _mapController,
        osmOption: OSMOption(
          userTrackingOption: UserTrackingOption(
            enableTracking: true,
            unFollowUser: false,
          ),
          zoomOption: ZoomOption(
            initZoom: 8,
            minZoomLevel: 17,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          // androidHotReloadSupport:  true,
          userLocationMarker: UserLocationMaker(
            personMarker: MarkerIcon(
              icon: Icon(
                Icons.location_history_rounded,
                color: Colors.red,
                size: 48,
              ),
            ),
            directionArrowMarker: MarkerIcon(
              icon: Icon(
                Icons.double_arrow,
                size: 48,
              ),
            ),
          ),
          roadConfiguration: RoadOption(
            roadColor: Colors.yellowAccent,
          ),
          markerOption: MarkerOption(
            defaultMarker: MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 56,
              ),
            ),
          ),
        ),
        onMapIsReady: (isReady) async {
          if (isReady) {
            await Future.delayed(Duration(seconds: 1), () async {
              await _mapController.currentLocation();
            });
          }
        },
        onGeoPointClicked: (geoPoint) {
          // when user click point
        },
      ),
    );
  }
}
