import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kelotimaja/core/constants/storage.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_util.dart';
import 'package:path/path.dart';

class ApiClient extends GetxService {
  dio.Dio dioClient = dio.Dio();

  Future<ApiClient> init() async {
    dioClient = dio.Dio();
    dioClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          // Do something before request is sent
          return handler.next(request);
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response);
        },
        onError: (dioError, handler) async {
          // Do something with response error
          if (!await checkInternetConnectivity()) {
            Get.defaultDialog(
                title: 'No Internet Connection',
                middleText:
                    'You are offline, Please check Your internet connection',
                onConfirm: () => Get.back());
          }
          if (dioError.response?.statusCode == 401) {
            print('authentication error');
          }
          if (dioError.response?.statusCode == 403) {
            print('You do not have the necessary permissions.');
          }
          if (dioError.response?.statusCode == 500) {
            print('Server Error 500');
            print(dioError.response?.data);
          }
          return handler.next(dioError); //continue with error handling
        },
      ),
    );
    return this;
  }

  void setSubdomain(String subdomain) {
    dioClient.options.baseUrl = _getBaseUrl(subdomain);
  }

  String _getBaseUrl(String subdomain) {
    return 'https://$subdomain.kelotimaja.kabtour.com/v2';
  }

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters, bool requireToken = true}) async {
    try {
      final response = await dioClient.get(endpoint,
          queryParameters: queryParameters,
          options: Options(headers: _getHeaders(requireToken)));
      return _processResponse(response);
    } catch (e) {
      if (e is DioException) {
        return _processError(e);
      } else {
        rethrow;
      }
    }
  }

  Future<Map<String, dynamic>> post(String endpoint,
      {dynamic data,
      FFUploadedFile? file,
      List<FFUploadedFile>? files,
      List<FFUploadedFile>? variantImages,
      bool requireToken = true,
      List<Map<String, FFUploadedFile>>? verificationFiles}) async {
    var formData = dio.FormData.fromMap(data);

    if (file != null) {
      if (_isValidFileType(file.name)) {
        formData.files.add(MapEntry(
            'banner',
            dio.MultipartFile.fromBytes(file.bytes!,
                filename: basename(file.name!))));
      }
    }

    if (files != null) {
      for (FFUploadedFile file in files) {
        if (_isValidFileType(file.name)) {
          formData.files.add(MapEntry(
              'gallery[]',
              dio.MultipartFile.fromBytes(file.bytes!,
                  filename: basename(file.name!))));
        }
      }
    }

    if (variantImages != null) {
      for (FFUploadedFile file in variantImages) {
        if (_isValidFileType(file.name)) {
          formData.files.add(MapEntry(
              'variant_image[]',
              dio.MultipartFile.fromBytes(file.bytes!,
                  filename: basename(file.name!))));
        }
      }
    }

    if (verificationFiles != null && verificationFiles.isNotEmpty) {
      for (Map<String, FFUploadedFile> map in verificationFiles) {
        for (String key in map.keys) {
          FFUploadedFile file = map[key]!;
          if (_isValidFileType(file.name)) {
            formData.files.add(MapEntry(
                key,
                dio.MultipartFile.fromBytes(file.bytes!,
                    filename: basename(file.name!))));
          }
        }
      }
    }

    try {
      final response = await dioClient.post(endpoint,
          data: formData, options: Options(headers: _getHeaders(requireToken)));
      return _processResponse(response);
    } catch (e) {
      if (e is DioException) {
        return _processError(e);
      } else {
        rethrow;
      }
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, dynamic>? queryParameters, bool requireToken = true}) async {
    try {
      final response = await dioClient.delete(endpoint,
          queryParameters: queryParameters,
          options: Options(headers: _getHeaders(requireToken)));
      return _processResponse(response);
    } catch (e) {
      if (e is DioException) {
        return _processError(e);
      } else {
        rethrow;
      }
    }
  }

  Map<String, String> _getHeaders(bool requireToken) {
    if (requireToken) {
      String? token = FFAppState().accessToken;
      if (token != null) {
        return {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        };
      }
    }
    return {'Content-Type': 'application/json'};
  }

  Map<String, dynamic> _processResponse(dio.Response response) {
    if (response.statusCode == 200) {
      return {'success': true, 'body': response.data ?? {}};
    } else {
      String message = response.statusMessage ?? 'Something went wrong.';
      return {
        'success': false,
        'status': response.statusCode,
        'message': message
      };
    }
  }

  Map<String, dynamic> _processError(DioException e) {
    String message = e.message ?? 'Something went wrong.';
    if (e.response != null) {
      message = e.response!.statusMessage ?? 'Something went wrong.';
    }
    return {
      'success': false,
      'status': e.response?.statusCode,
      'message': message
    };
  }

  bool _isValidFileType(String? filename) {
    if (filename == null) {
      return false;
    }
    // List ekstensi file yang diizinkan
    List<String> allowedExtensions = [
      '.jpg',
      '.png',
      '.jpeg',
      '.gif',
      '.pdf',
      '.doc',
      '.docx'
    ];

    for (var extension in allowedExtensions) {
      if (filename!.toLowerCase().endsWith(extension)) {
        return true;
      }
    }

    return false;
  }
}
