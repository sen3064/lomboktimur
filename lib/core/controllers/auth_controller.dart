// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kolaka/core/constants/storage.dart';
import 'package:kolaka/core/constants/subdomain.dart';
import 'package:kolaka/core/helpers/auth_helper.dart';
import 'package:kolaka/core/helpers/common_helper.dart';
import 'package:kolaka/core/services/api_client.dart';
import 'package:kolaka/flutter_flow/flutter_flow_util.dart';
import 'package:kolaka/flutter_flow/form_field_controller.dart';

class AuthController extends GetxController {
  ApiClient apiClient = Get.isRegistered<ApiClient>()
        ? Get.find<ApiClient>()
        : Get.put(ApiClient());
  var isLogin = false.obs,
      isEmailVerified = false.obs,
      isVerified = false.obs,
      isLoading = false.obs,
      isSuspend = false.obs,
      isAdmin = false.obs,
      isVerificator = false.obs,
      isMitra = false.obs,
      isEntity = false.obs,
      isCourier = false.obs,
      passwordVisibility = false.obs;

  RxString verifySubmitStatus = ''.obs;

  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  // State field(s) for namaMitra widget.
  TextEditingController? namaMitraController;
  String? Function(BuildContext, String?)? namaMitraControllerValidator;
  // State field(s) for nomorTelepon widget.
  TextEditingController? nomorTeleponController;
  String? Function(BuildContext, String?)? nomorTeleponControllerValidator;
  // State field(s) for namaUsaha widget.
  TextEditingController? namaUsahaController;
  String? Function(BuildContext, String?)? namaUsahaControllerValidator;
  // State field(s) for jenisAkun widget.
  int? jenisAkunValue;
  FormFieldController<int>? jenisAkunValueController;
  // State field(s) for lokasiKecamatan widget.
  int? lokasiKecamatanValue;
  FormFieldController<String>? lokasiKecamatanValueController;
  // State field(s) for kataSandi widget.
  TextEditingController? kataSandiController;
  late bool kataSandiVisibility;
  String? Function(BuildContext, String?)? kataSandiControllerValidator;
  // State field(s) for ulangiKatasandi widget.
  TextEditingController? ulangiKatasandiController;
  late bool ulangiKatasandiVisibility;
  String? Function(BuildContext, String?)? ulangiKatasandiControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  String errorText = '';

  Map<String, int> kecamatanMap = {
    'Kec. Toari': 72,
    'Kec. Baula': 73,
    'Kec. Kolaka': 74,
    'Kec. Latambaga': 75,
    'Kec. Pomalaa': 76,
    'Kec. Samaturu': 77,
    'Kec. Tanggetada': 78,
    'Kec. Watubangga': 79,
    'Kec. Wolo': 80,
    'Kec. Wundulako': 81,
    'Kec. Polinggona': 82,
    'Kec. Iwoimendaa': 83
  };

  @override
  void onInit() async {
    super.onInit();
    kataSandiVisibility = false;
    ulangiKatasandiVisibility = false;
    apiClient.setSubdomain(USER_API);
    await checkUser();
  }

  Future<bool> refreshUserData() async {
    final data = await apiClient.get('/profile');
    if (data['success']) {
      await AuthHelper.setUserStorage({'user': data['body']});
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>> getProfile() async {
    Map<String, dynamic> data = await apiClient.get('/profile');
    if (!data['success']) {
      Map<String, dynamic> udata = await userStorage.read('user_data') ?? {};
      String uid = udata.isNotEmpty ? udata['id'].toString() : '0';
      if (uid != '0') {
        data = await apiClient.post('/relogin', data: {'user_id': uid});
        if (data['success']) {
          await AuthHelper.setUserStorage(data);
        } else {
          data = {'success': false, 'message': 'user not found'};
        }
      } else {
        data = {'success': false, 'message': 'user not found'};
      }
    }
    print('get profile : $data');
    return data;
  }

  Future<void> checkUser() async {
    await _isLogin();
    if (isLogin.isTrue) {
      final data = await getProfile();
      print('get profile result : $data');
      if (data['success']) {
        await AuthHelper.setUserStorage({'user': data['body']});
        List<String> playerIds = data['body']['player_id'] != null
            ? data['body']['player_id'].toString().split(',')
            : [];
        String playerId = userStorage.read('player_id') ?? '';
        bool needStore = true;
        if (playerId == '') {
          needStore = false;
        } else {
          for (var pid in playerIds) {
            if (playerId == pid) {
              needStore = false;
            }
          }
        }
        if (needStore) {
          await CommonHelper.storePlayerId(
              playerId, data['body']['id'].toString());
        }
        if (userStorage.read('user_role')['role_id'] != 3) {
          print('role_id : ${userStorage.read('user_role')['role_id']}');
          switch (userStorage.read('user_role')['role_id']) {
            case 1:
              isMitra(true);
              break;
            case 5:
              isVerificator(true);
              break;
            case 7:
              isEntity(true);
              break;
            case 9:
              isEntity(true);
              break;
            case 8:
              isCourier(true);
              break;
            default:
          }
          print('check is verified');
          print(userStorage.read('is_verified'));
          if (userStorage.read('is_verified')) {
            print('is_verified is true');
            isVerified(true);
          } else {
            isVerified(false);
          }
          if (userStorage.read('is_email_verified')) {
            userStorage.read('is_email_verified') == null
                ? isEmailVerified(false)
                : isEmailVerified(true);
          }
          if (userStorage.read('verify_submit_status') != null) {
            verifySubmitStatus.value = userStorage.read('verify_submit_status');
          }
          if (userStorage.read('user_meta') != null) {
            List userMeta = userStorage.read('user_meta');
            if (userMeta.isNotEmpty) {
              for (var meta in userMeta) {
                if (meta['name'] == 'is_suspend') {
                  if (meta['val'] == '1') {
                    isSuspend(true);
                  }
                }
              }
            } else {
              verifySubmitStatus.value = 'incomplete';
            }
          }
        } else {
          isAdmin(true);
        }
      } else {
        await AuthHelper.unsetUserStorage();
        resetBoolStatus();
      }
    }
  }

  Future<void> _isLogin() async {
    String? accessToken = userStorage.read('access_token');
    print(accessToken);
    if (accessToken != null && accessToken.isNotEmpty) {
      isLogin(true);
    } else {
      isLogin(false);
    }
  }

  Future<Map<String, dynamic>> doLogin(String email, String password) async {
    isLoading(true);
    final data = await apiClient.post('/login',
        data: {'email': email, 'password': password}, requireToken: false);
    print(data);
    if (data['success']) {
      await AuthHelper.setUserStorage(data['body']);
      await CommonHelper.storePlayerId(
          await userStorage.read('player_id'), data['body']['id'].toString());
      isLoading(false);
      return {'success': true, 'message': 'OK'};
    }
    isLoading(false);
    return data;
  }

  Future<Map<String, dynamic>> doLogout() async {
    isLoading(true);
    final data =
        await apiClient.post('/logout', data: {'uid': userStorage.read('uid')});
    if (data['success']) {
      await AuthHelper.unsetUserStorage();
      resetBoolStatus();
      isLoading(false);
      return {'success': true, 'message': 'OK'};
    }
    isLoading(false);
    return data;
  }

  Future<bool> doRegister(Map<String, dynamic> param) async {
    isLoading(true);
    final data =
        await apiClient.post('/register', data: param, requireToken: false);
    if (data['success']) {
      CommonHelper.logPrint(data['body']);
      if (data['body']['success']) {
        await AuthHelper.setUserStorage(data['body']);
        await CommonHelper.storePlayerId(
            await userStorage.read('player_id'), data['body']['id'].toString());
        isLoading(false);
        return true;
      }
    }
    isLoading(false);
    return false;
  }

  Future<Map<String, dynamic>> otpVerification() async {
    isLoading(true);
    var res = await apiClient
        .post('/verify-otp', data: {'otp': pinCodeController.text});
    CommonHelper.logPrint(res);
    isLoading(false);
    return res;
  }

  Future<Map<String, dynamic>> resendOTP() async {
    isLoading(true);
    var res = await apiClient.get('/resend-otp');
    CommonHelper.logPrint(res);
    isLoading(false);
    return res;
  }

  Map<String, dynamic> buildRegisterParam() {
    if (registerFormKey.currentState!.validate()) {
      if (jenisAkunValue == null) {
        Get.defaultDialog(
            title: 'Required',
            middleText: 'Mohon pilih jenis akun',
            onConfirm: () => Get.back());
        return {};
      }
      if (lokasiKecamatanValue == null) {
        Get.defaultDialog(
            title: 'Required',
            middleText: 'Mohon pilih lokasi kecamatan',
            onConfirm: () => Get.back());
        return {};
      }
      if (!checkboxValue!) {
        Get.defaultDialog(
            title: 'Required',
            middleText:
                'Mohon setujui Syarat Penggunaan Pelayanan & Kebijakan Privasi',
            onConfirm: () => Get.back());
        return {};
      }
      print(registerFormKey.currentState!.validate());
      return {
        'email': emailAddressController.text,
        'name': namaMitraController.text,
        'phone': nomorTeleponController.text,
        'business_name': namaUsahaController.text,
        'role_id': jenisAkunValue,
        'location_id': lokasiKecamatanValue,
        'password': kataSandiController.text
      };
    }
    return {};
  }

  Future<Map<String, dynamic>> register() async {
    isLoading(true);
    Map<String, dynamic> param = buildRegisterParam();
    if (param.isNotEmpty) {
      bool reg = await doRegister(param);
      if (reg) {
        isLoading(false);
        return {
          'success': true,
          'message':
              'Pendaftaran Berhasil, kode OTP sudah dikirim ke Email Kamu',
          'data': userStorage.read('user_data')
        };
      }
    }
    isLoading(false);
    return {};
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!passwordRegExp.hasMatch(value!)) {
      return 'Kata sandi harus terdiri dari 8 karakter termasuk huruf dan angka';
    }
    return null;
  }

  String? repeatPasswordValidation(String? value) {
    if (value != kataSandiController.text) {
      return 'Kata sandi tidak sama';
    }
    return null;
  }

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field ini tidak boleh kosong';
    }
    return null;
  }

  Future<bool> sendMitraVerification(Map<String, dynamic> param,
      FFUploadedFile ktp, FFUploadedFile npwp) async {
    return false;
  }

  clearValue() {
    loginFormKey.currentState?.reset();
    registerFormKey.currentState?.reset();
    emailAddressController = null;
    passwordController = null;
    namaMitraController = null;
    nomorTeleponController = null;
    namaUsahaController = null;
    jenisAkunValue = null;
    jenisAkunValueController = null;
    lokasiKecamatanValue = null;
    lokasiKecamatanValueController = null;
    kataSandiController = null;
    kataSandiVisibility = false;
    ulangiKatasandiController = null;
    ulangiKatasandiVisibility = false;
    checkboxValue = true;
  }

  resetBoolStatus() {
    isLogin(false);
    isEmailVerified(false);
    isVerified(false);
    isLoading(false);
    isSuspend(false);
    isAdmin(false);
    isVerificator(false);
    isMitra(false);
    isEntity(false);
    isCourier(false);
    passwordVisibility(false);
  }

  onBack(result) {
    clearValue();
    Get.back(result: result);
  }
}
