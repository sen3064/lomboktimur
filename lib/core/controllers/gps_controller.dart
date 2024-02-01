import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolaka/core/constants/storage.dart';
import 'package:kolaka/core/services/gps_service.dart';

class GPSController extends GetxController {
  final title = 'Mitra Kolaka';
  // final MapController mapController = MapController();
  List<Marker> markers = [];
  var isRunning = false.obs,
      isInit = true.obs,
      isLoading = false.obs,
      latitude = 0.0.obs,
      longitude = 0.0.obs,
      oldLatitude = 0.0.obs,
      oldLongitude = 0.0.obs,
      speed = 0.0.obs,
      heading = 0.0.obs;

  StreamSubscription<Position>? positionStream;

  LocationAccuracy accuracy = LocationAccuracy.best;

  int distance = 0;
  int interval = 5;

  DateTime? currentBackPressTime;

  final accuracyList = [
    LocationAccuracy.low,
    LocationAccuracy.medium,
    LocationAccuracy.high,
    LocationAccuracy.best
  ];

  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  // double latitude = 0;
  // double longitude = 0;
  bool isShownAlert = false;

  final GPSService service = Get.put(GPSService());

  @override
  void onInit() async {
    await getPosition();
    super.onInit();
  }

  Future<void> getPosition() async {
    final position = await getCurrentPosition();
    if (position != null) {
      if (!isInit.value) {
        oldLatitude(latitude.value);
        oldLongitude(longitude.value);
      }
      latitude(position.latitude);
      longitude(position.longitude);
      speed(position.speed);
      heading(position.heading);
      await localStorage.write('location',
          {'latitude': position.latitude, 'longitude': position.longitude});
      // storeloc = true;
      setMarker();
      update();
    }
    // Timer(Duration(milliseconds: 60000), _getPosition);
    // StreamSubscription<Position> positionStream =
    //     Geolocator.getPositionStream(locationSettings: locationSettings)
    //         .listen((Position position) {
    //   print(position == null
    //       ? 'Unknown'
    //       : '${position.latitude.toString()}, ${position.longitude.toString()}');
    // });
  }

  Future<dynamic> getCurrentPosition() async {
    final hasPermission = await handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    log(position.toString());
    return position;
  }

  showAlert() {
    Get.defaultDialog(
        title: "Location Data Usage",
        middleText: "Mohon aktifkan Lokasi",
        onConfirm: () async {
          await Geolocator.openLocationSettings();
          isShownAlert = true;
          update();
          Get.back();
        });
  }

  Future<bool> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!isShownAlert) {
        await showAlert();
      }
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      log(_kLocationServicesDisabledMessage);

      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (!isShownAlert) {
        await showAlert();
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

  setMarker() {
    markers.clear();
    Marker marker = Marker(
        markerId: MarkerId('me'),
        position: LatLng(latitude.value, longitude.value),
        icon: BitmapDescriptor.defaultMarkerWithHue(200));
    markers.add(marker);
    update();
  }

  setOtherMarker(data) {
    Marker marker = Marker(
        markerId: MarkerId('destination'),
        position: LatLng(
            double.parse(data['latitude']), double.parse(data['longitude'])),
        icon: BitmapDescriptor.defaultMarkerWithHue(150),
        infoWindow: InfoWindow(snippet: '${data['line1']} ${data['line2']}'));
    markers.add(marker);
    update();
  }

  runService() {
    print(Duration(seconds: interval));
    LocationSettings locationSettings = AndroidSettings(
        accuracy: accuracy,
        intervalDuration: Duration(seconds: interval),
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "You can hide this notification by Disable it in Notification Settings",
          notificationTitle: "Mitra Pulo1000",
          enableWakeLock: true,
        ));

    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) async {
      // print(
      //     '${position.latitude.toString()}, ${position.longitude.toString()}');
      print("heading ${position.heading}");
      latitude(position.latitude);
      longitude(position.longitude);
      await localStorage.write('location',
          {'latitude': position.latitude, 'longitude': position.longitude});
      setMarker();
      print('$latitude, $longitude');
      String bookingIds = '';
      List activeBookingIds = await userStorage.read('running_orders');
      if (activeBookingIds.length > 0) {
        activeBookingIds.forEach((element) {
          bookingIds += element.toString() + ',';
        });
        bookingIds = bookingIds.substring(0, (bookingIds.length - 1));
        print(bookingIds);
        FormData body = FormData({
          'latitude': position.latitude.toString(),
          'longitude': position.longitude.toString(),
          'booking_ids': bookingIds.toString()
        });
        print(body);

        var response = await service.sendData(body);
        print(response['status_code']);
        print(response['body']);
      } else {
        stopService();
      }
    });
    // Get.to(() => RunningView());
  }

  startService() async {
    if (!isRunning.value) {
      isRunning(true);
      runService();
    }
  }

  stopService() async {
    await positionStream?.cancel();
    isRunning(false);
  }

  onBack() {
    Get.back();
  }

  updateCoordinates(RxDouble rxDouble, RxDouble rxDouble2) {}
}