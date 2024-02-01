import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:intl/intl.dart';

class CommonHelper {
  static void logPrint(Object? object) async {
    int defaultPrintLength = 1020;
    if (object == null || object.toString().length <= defaultPrintLength) {
      print(object);
    } else {
      String log = object.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        print(log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        print(log.substring(start, logLength));
      }
    }
  }

  static String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    // Mengatur locale ke Bahasa Indonesia
    Intl.defaultLocale = 'id_ID';

    // Mengubah format tanggal
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(date);
  }

  static String formatDateTime(String dateTimeStr) {
    final date = DateTime.parse(dateTimeStr);
    // Mengatur locale ke Bahasa Indonesia
    Intl.defaultLocale = 'id_ID';

    // Mengubah format tanggal
    final formatter = DateFormat('E, MMMM d HH:mm:ss');
    return formatter.format(date);
  }

  static Future<Map<String, dynamic>> storePlayerId(
      String playerId, String uid) async {
    final GetConnect connect = GetConnect();
    var apiurl = "https://api.kolaka.kabtour.com/v2/store-player-id";
    var response = await connect.put(apiurl, {"uid": uid, "token": playerId},
        headers: {"accept": "application/json"});
    var data = response.body;
    // print(data);
    // Map<String, dynamic> parsed = jsonDecode(data);
    return data;
  }

  static Future<List> getNotification(String uid) async {
    var apiurl =
        "https://pg-api.kolaka.kabtour.com/v2/get-notification/$uid";
    print(apiurl);
    final GetConnect connect = GetConnect();
    var response =
        await connect.get(apiurl, headers: {"accept": "application/json"});
    var data = response.body;
    var parsed = jsonDecode(data);
    return parsed;
  }

  static Future<List> getReview(String type, String id) async {
    var apiurl =
        "https://api.kolaka.kabtour.com/v2/review?object_model=$type&object_id=$id";
    print(apiurl);
    final GetConnect connect = GetConnect();
    var response =
        await connect.get(apiurl, headers: {"accept": "application/json"});
    var data = response.body;
    var parsed = jsonDecode(data);
    return parsed['data'];
  }

  static unimplementedMethod() {
    Get.snackbar('Unimplemented', 'Method has not been implemented');
  }
 static implementedMethod() {
    Get.snackbar('Sukses', 'No. Rek sudah di simpan');
  }
  static String getRoleName(int roleId) {
    String roleName = 'Pelaku usaha';
    switch (roleId) {
      case 1:
        roleName = 'Pelaku Usaha';
        break;
      case 3:
        roleName = 'Admin';
        break;
      case 5:
        roleName = 'Pokdarwis';
        break;
      case 7:
        roleName = 'Badan Usaha';
        break;
      case 8:
        roleName = 'Kurir';
        break;
      default:
    }
    return roleName;
  }

  static bool isURL(String value) {
    return Uri.tryParse(value)?.hasAbsolutePath ?? false;
  }

  static String getAvatarUrl(String avatarUrl) {
    if (avatarUrl == null || avatarUrl.isEmpty || avatarUrl == "avatar.png") {
      avatarUrl = 'https://kolaka.kabtour.com/images/avatar.png';
    } else if (!isURL(avatarUrl)) {
      avatarUrl =
          'https://kolaka.kabtour.com/images/avatar.png'; // default URL for invalid URLs
    }
    return avatarUrl;
  }

  static Future<List> getListLocation() async {
    var apiurl = "https://api.kolaka.kabtour.com/v2/location";
    print(apiurl);
    final GetConnect connect = GetConnect();
    var response =
        await connect.get(apiurl, headers: {"accept": "application/json"});
    var data = response.body;
    // print(data);
    // var parsed = jsonDecode(data);
    return data;
  }
}
