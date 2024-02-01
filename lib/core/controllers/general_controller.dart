import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kelotimaja/components/general_info_screen.dart';
import 'package:kelotimaja/core/constants/storage.dart';
import 'package:kelotimaja/core/constants/subdomain.dart';
import 'package:kelotimaja/core/controllers/gps_controller.dart';
import 'package:kelotimaja/core/helpers/common_helper.dart';
import 'package:kelotimaja/core/helpers/currency_format.dart';
import 'package:kelotimaja/core/services/api_client.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_util.dart';
import 'package:kelotimaja/flutter_flow/form_field_controller.dart';

class GeneralController extends GetxController {
  GPSController gpsC = Get.isRegistered<GPSController>()
      ? Get.find<GPSController>()
      : Get.put(GPSController());
  ApiClient apiClient = Get.find<ApiClient>();

  var isLoading = false.obs, infoData = {}.obs;

  TextEditingController? namaPenyediaController = TextEditingController();
  String? Function(BuildContext, String?)? namaPenyediaControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for GoogleMap widget.
  FFLatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for detailAlamat widget.
  TextEditingController? detailAlamatController = TextEditingController();
  String? Function(BuildContext, String?)? detailAlamatControllerValidator;
  String? imageBanner;
  double? latitude, longitude;

  int? foodShippingType;
  FormFieldController<int>? foodShippingTypeController;

  TextEditingController? foodShippingPriceController;
  String? Function(BuildContext, String?)? foodShippingPriceValidator;

  List<String> umkmDelivery = [
    'Ambil di Tempat',
    'J&T Express',
    'JNE YES',
    'JNE REG',
    'JNE Reguler',
    'TIKI',
    'POS Indonesia'
  ];
  RxList<bool> umkmDeliverySelection =
      <bool>[false, false, false, false, false, false, false].obs;

  @override
  void onInit() {
    super.onInit();
    apiClient.setSubdomain(USER_API);
    latitude = gpsC.latitude.value;
    longitude = gpsC.longitude.value;
  }

  Future<void> fetchData(Map<String, dynamic> param) async {
    isLoading(true);
    Map<String, dynamic> result = await apiClient.get(
        '/shop-setting/${userStorage.read('uid')}/${param['object_model']}');
    if (result['success']) {
      print(result);
      if (result['body']['success']) {
        infoData.value = result['body']['data'];
        namaPenyediaController.text = infoData['name'];
        detailAlamatController.text = infoData['address'] ?? '';
        imageBanner = infoData['banner']['250x200'];
        double latFromAPI = double.tryParse(infoData['latitude'] ?? '0') ?? 0.0;
        print('lat api $latFromAPI');
        double longFromAPI =
            double.tryParse(infoData['longitude'] ?? '0') ?? 0.0;
        print('long api $longFromAPI');
        if (latFromAPI != 0.0) {
          latitude = latFromAPI;
          print('assigned lat $latitude');
        }
        if (longFromAPI != 0.0) {
          longitude = longFromAPI;
          print('assigned long $longitude');
        }
        update();
        print('fetched lat $latitude');
        print('fetched long $longitude');
      }
    }
    if (param.containsKey('page')) {
      if (infoData.isEmpty) {
        Map<String, dynamic> params = {
          'object_model': param['object_model'],
          'error': 'general_info'
        };
        switch (param['object_model']) {
          case 'umkm':
            params['title'] = 'Toko';
            break;
          case 'food-beverage':
            params['title'] = 'Resto';
            break;
          default:
        }
        await Get.defaultDialog(
            title: "Invalid",
            middleText:
                "Mohon isi Informasi ${params['title']} terlebih dahulu",
            onConfirm: () {
              isLoading(false);
              Get.back(result: params);
            });
        Get.back(result: params);
      } else {
        param['object_model'] == 'umkm'
            ? setUmkmDeliveryValue()
            : setRestoDeliveryValue();
      }
    }
    isLoading(false);
  }

  // fungsi untuk memperbarui koordinat
  Future<void> updateCoordinates(double newLat, double newLng) async {
    final GoogleMapController controller = await googleMapsController.future;
    controller.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(newLat, newLng),
      ),
    );
    update();
  }

  setUmkmDeliveryValue() {
    if (infoData['shipping_type'] != null &&
        infoData['shipping_type'].isNotEmpty) {
      List<String> shippings = infoData['shipping_type'].split(',');
      for (var i = 0; i < umkmDelivery.length; i++) {
        if (shippings.contains(umkmDelivery[i])) {
          umkmDeliverySelection[i] = true;
        }
      }
      update();
    }
  }

  setRestoDeliveryValue() {
    foodShippingType = infoData['shipping_type'] == 'Pesan Antar'
        ? 1
        : infoData['shipping_type'] == 'Pickup'
            ? 2
            : 3;
    foodShippingTypeController = FormFieldController(foodShippingType);
    foodShippingPriceController = TextEditingController(
        text: CurrencyFormat.convertToIdr(
            double.parse(infoData['shipping_cost'].toString()), 0));
    update();
  }

  Future<Map<String, dynamic>> saveData(String objectModel) async {
    isLoading(true);
    Map<String, dynamic> temp = {'object_model': objectModel};
    temp['name'] = namaPenyediaController.text;
    if (detailAlamatController != null &&
        detailAlamatController.text.isNotEmpty) {
      temp['address'] = detailAlamatController.text;
    }
    if (latitude != null) {
      temp['latitude'] = latitude;
    }
    if (longitude != null) {
      temp['longitude'] = longitude;
    }
    print(temp);
    Map<String, dynamic> result = await apiClient.post('/shop-setting/save',
        data: temp, file: uploadedLocalFile);
    isLoading(false);
    return result;
  }

  Future<Map<String, dynamic>> saveUmkmDelivery() async {
    isLoading(true);
    Map<String, dynamic> temp = {'object_model': 'umkm'};
    List<String> selected = [];
    for (int i = 0; i < umkmDeliverySelection.length; i++) {
      if (umkmDeliverySelection[i]) {
        selected.add(umkmDelivery[i]);
      }
    }
    temp['shipping_type'] = selected.join(',');
    Map<String, dynamic> result =
        await apiClient.post('/shop-setting/save', data: temp);
    isLoading(false);
    return result;
  }

  Future<Map<String, dynamic>> saveFoodDelivery() async {
    isLoading(true);
    Map<String, dynamic> temp = {'object_model': 'food-beverage'};
    bool needPrice = false;
    switch (foodShippingType) {
      case 1:
        temp['shipping_type'] = 'Pesan Antar';
        needPrice = true;
        break;
      case 2:
        temp['shipping_type'] = 'Pickup';
        needPrice = false;
        break;
      case 3:
        temp['shipping_type'] = 'Pesan Antar & Pickup';
        needPrice = true;
        break;
      default:
    }
    temp['shipping_cost'] = 0;
    if (needPrice) {
      temp['shipping_cost'] = foodShippingPriceController.text
          .replaceAll('Rp', '')
          .replaceAll('.', '')
          .replaceAll(' ', '');
    }
    Map<String, dynamic> result =
        await apiClient.post('/shop-setting/save', data: temp);
    isLoading(false);
    return result;
  }

  void onBack(Map<String, dynamic> param) {
    switch (param['object_model']) {
      case 'tour':
        apiClient.setSubdomain(TOUR_API);
        break;
      case 'hotel':
        apiClient.setSubdomain(HOTEL_API);
        break;
      case 'transportasi':
        apiClient.setSubdomain(RENT_API);
        break;
      default:
        apiClient.setSubdomain(COMMON_API);
        break;
    }
  }
}
