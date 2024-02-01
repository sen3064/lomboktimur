import 'package:get/get.dart';
import 'package:kolaka/core/constants/storage.dart';

class GPSService extends GetConnect {
  @override
  void onInit() {
    // // add your local storage here to load for every request
    // var token = userStorage.read('access_token');
    //1.base_url
    httpClient.baseUrl = "https://api.kolaka.kabtour.com/v2/";
    //2.
    httpClient.defaultContentType = "application/json";
    // // httpClient.timeout = Duration(seconds: 8);
    // var headers = {'Authorization': "Bearer $token"};
    // httpClient.addAuthenticator((request) async {
    //   request.headers.addAll(headers);
    //   print('headers : ${request.headers}');
    //   return request;
    // });
    // // httpClient.addResponseModifier((request, response) async {
    // //   print(response.body);
    // // });
    // httpClient.addRequestModifier((request) async {
    //   request.headers.addAll(headers);
    //   // add request here
    //   print(request.url);
    //   print(request.method);
    //   print(request.decoder);
    //   print(request.headers);
    //   return request;
    // });
    super.onInit();
  }

  // Future<Map<String, dynamic>> sendData(FormData param) async {
  //   final response = await post('store-courier-location', param);
  //   print(response.statusCode);
  //   print(response.body);
  //   return {'status_code': response.statusCode, 'body': response.body};
  // }

  Future<Map<String, dynamic>> sendData(FormData param) async {
    var token = userStorage.read('access_token');
    final response = await post(
      'store-courier-location',
      param,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    print(response.body);
    return {'status_code': response.statusCode, 'body': response.body};
  }
}
