import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kolaka/core/helpers/common_helper.dart';

class HttpService {
  static Future<List> fetchFoodb(param) async {
    var apiurl =
        "https://booking-api.kolaka.kabtour.com/v2/food-beverage?" + param;
    // print("api url : $apiurl");
    var response = await http.get(Uri.parse(apiurl));
    if (response.statusCode == 200) {
      // print(response);
      var data = response.body;
      return jsonDecode(data);
    } else {
      throw Exception();
    }
  }

  static Future<List> fetchdetailfood(createuser) async {
    var apiurl =
        "https://booking-api.kolaka.kabtour.com/v2/products/search?category_id=7&create_user=$createuser";
    print("api url : $apiurl");
    var response = await http.get(Uri.parse(apiurl));
    if (response.statusCode == 200) {
      // print(response);
      var data = response.body;
      return jsonDecode(data);
    } else {
      throw Exception();
    }
  }

  static Future<Map<String, dynamic>> sendBooking(token, param) async {
    var apiurl =
        "https://booking-api.kolaka.kabtour.com/v2/booking/food-beverage";
    var response = await http.post(Uri.parse(apiurl),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: param);
    print("sendBooking Status : ${response.statusCode}");
    var data = response.body;
    //  CommonHelper.logPrint("response : ${data}");
    //  CommonHelper.logPrint(param);
    return jsonDecode(data);
  }

  static Future<Map<String, dynamic>> updateBooking(token, param, code) async {
    var apiurl =
        "https://booking-api.kolaka.kabtour.com/v2/booking/food-beverage/update/$code";
    var response = await http.put(Uri.parse(apiurl),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: param);
    print(param);
    print("updateBooking Status : ${response.statusCode}");
    var data = response.body;
    print("response : ");
    print(data);
    return jsonDecode(data);
  }

    static Future<Map<String, dynamic>> sendOrder(token, param) async {
    var apiurl = "https://booking-api.kolaka.kabtour.com/v2/booking/umkm";
    var response = await http.post(Uri.parse(apiurl),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: param);
    print("sendOrder Status : ${response.statusCode}");
    var data = response.body;
    print("response : ");
    return jsonDecode(data);
  }

    static Future<Map<String, dynamic>> updateOrder(token, param, code) async {
    var apiurl = "https://booking-api.kolaka.kabtour.com/v2/booking/umkm/update/$code";
    var response = await http.put(Uri.parse(apiurl),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: param);
    print("updateBooking Status : ${response.statusCode}");
    var data = response.body;
    print("response : ");
    print(data);
    return jsonDecode(data);
  }

}
