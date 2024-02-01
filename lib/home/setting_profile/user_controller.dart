import 'package:kelotimaja/core/constants/listBank.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/core/constants/storage.dart';
import 'package:kelotimaja/core/constants/subdomain.dart';
import 'package:kelotimaja/core/controllers/auth_controller.dart';
import 'package:kelotimaja/core/services/api_client.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_util.dart';
import 'package:kelotimaja/flutter_flow/form_field_controller.dart';
import 'package:kelotimaja/home/setting_profile/verification/verification_waiting_screen.dart';
// import 'package:kelotimaja/modules/welcome/welcome_screen.dart';
import 'package:kelotimaja/signup_signin_setup/login_page/login_page_widget.dart';

class UserController extends GetxController {
  ApiClient apiClient = Get.find<ApiClient>();
  AuthController authController = Get.isRegistered<AuthController>()
      ? Get.find<AuthController>()
      : Get.put(AuthController());

  final unfocusNode = FocusNode();

  var isLoading = false.obs, refreshed = false.obs, hasRekening = false.obs;

  // State field(s) for emailAddress widget.
  TextEditingController emailAddressController = TextEditingController();
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for namaMitra widget.
  TextEditingController namaMitraController = TextEditingController();
  String? Function(BuildContext, String?)? namaMitraControllerValidator;
  // State field(s) for nomorTelepon widget.
  TextEditingController nomorTeleponController = TextEditingController();
  String? Function(BuildContext, String?)? nomorTeleponControllerValidator;
  // State field(s) for namaUsaha widget.
  TextEditingController namaUsahaController = TextEditingController();
  String? Function(BuildContext, String?)? namaUsahaControllerValidator;
  // State field(s) for jabatan widget.
  TextEditingController jabatanController = TextEditingController();
  String? Function(BuildContext, String?)? jabatanControllerValidator;
  // State field(s) for alamat widget.
  TextEditingController alamatController = TextEditingController();
  String? Function(BuildContext, String?)? alamatControllerValidator;
  // State field(s) for CheckboxGroup widget.
  List<String> checkboxGroupValues1 = [];
  FormFieldController<List<String>> checkboxGroupValueController1 =
      FormFieldController<List<String>>([]);
  // State field(s) for CheckboxGroup widget.
  List<String> checkboxGroupValues2 = [];
  FormFieldController<List<String>> checkboxGroupValueController2 =
      FormFieldController<List<String>>([]);
  // State field(s) for nomorKtp widget.
  TextEditingController nomorKtpController = TextEditingController();
  String? Function(BuildContext, String?)? nomorKtpControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String ktpImage = '';

  // State field(s) for nomorNpwp widget.
  TextEditingController nomorNpwpController = TextEditingController();
  String? Function(BuildContext, String?)? nomorNpwpControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String npwpImage = '';

  // State field(s) for nomorTdp widget.
  TextEditingController nomorTdpController = TextEditingController();
  String? Function(BuildContext, String?)? nomorTdpControllerValidator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String tdpImage = '';

  // State field(s) for nomorSiup widget.
  TextEditingController nomorSiupController = TextEditingController();
  String? Function(BuildContext, String?)? nomorSiupControllerValidator;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String siupImage = '';

  // State field(s) for nomorSim widget.
  TextEditingController nomorSimController = TextEditingController();
  String? Function(BuildContext, String?)? nomorSimControllerValidator;
  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String simImage = '';

  // State field(s) for tradeLicense widget.
  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String docImage = '';

  TextEditingController noRek = TextEditingController();
  TextEditingController namaRek = TextEditingController();
  String selectedBank = '';
  int? selectedBankIndex;
  TextEditingController amount = TextEditingController();

  List<Map<String, FFUploadedFile>> files = [];

  Map<String, dynamic> ivmeta = {};

  Map<String, String> transform = {
    'email': 'Email',
    'name': 'Nama',
    'phone': 'Telepon',
    'bussiness_name': 'Nama Usaha',
    'position': 'Jabatan',
    'category': 'Jenis Usaha',
    'address': 'Alamat',
    'nik': 'NIK',
    'id_card': 'KTP',
    'npwp': 'Nomor NPWP',
    'npwp_card': 'NPWP',
    'tdp': 'Nomor TDP',
    'tdp_document': 'Dokumen TDP',
    'siup': 'Nomor SIUP',
    'siup_document': 'Dokumen SIUP',
    'driving_license': 'Nomor SIM',
    'driving_license_card': 'SIM',
    'trade_license': 'Data Pendukung',
    'homestay': 'Penginapan',
    'tour': 'Tour & Travel',
    'food-beverage': 'Makanan & Minuman',
    'umkm': 'UMKM',
    'transportasi': 'Transportasi',
    'tiket-wisata': 'Tiket Wisata',
  };

  @override
  void onInit() {
    super.onInit();
    apiClient.setSubdomain(USER_API);
  }

  Future<void> logout() async {
    isLoading(true);
    Map<String, dynamic> res = await authController.doLogout();
    if (res['success']) {
      isLoading(false);
      Get.offAll(() => const LoginPageWidget());
    }
  }

  void refreshData() async {
    isLoading(true);
    bool res = await authController.refreshUserData();
    // refreshed(await authController.refreshUserData());
    refreshed(res);
    Map<String, dynamic> userRekening =
        FFAppState().userData['user_rekening'] ?? {};
    if (userRekening.isNotEmpty) {
      hasRekening(true);
    }
    isLoading(false);
  }

  void initRekening() {
    var userRekening = FFAppState().userData['user_rekening'];
    noRek.text = userRekening['no_rek'];
    namaRek.text = userRekening['name_rek'];
    selectedBank = userRekening['name_bank'];
    selectedBankIndex = listBank.indexWhere(
        (element) => element['channel_code'] == userRekening['bank_code']);
    if (selectedBankIndex == -1) {
      selectedBankIndex = null;
    }
    update();
  }

  void initVerificationForm() {
    print('init verif form');
    var userData = userStorage.read('user_data');
    var userMeta = userStorage.read('user_meta');
    var userRole = userStorage.read('user_role');
    print(userMeta);
    int roleId = userRole['role_id'];
    if (userMeta.isEmpty) {
      emailAddressController.text = userData['email'];
      namaMitraController.text = userData['name'];
      nomorTeleponController.text = userData['phone'];
      namaUsahaController.text = userData['business_name'];
      update();
    } else {
      for (var element in userMeta) {
        if (element['name']
            .toString()
            .toLowerCase()
            .startsWith('is_verified')) {
          ivmeta[element['name']] = element['val'];
        }
      }
      print('email from meta');
      emailAddressController.text = userMeta.firstWhere(
          (item) => item['name'] == 'verify_data_email',
          orElse: () => {"val": ""})['val'];
      print('name from meta');
      namaMitraController.text = userMeta.firstWhere(
          (item) => item['name'] == 'verify_data_name',
          orElse: () => {"val": ""})['val'];
      print('phone from meta');
      nomorTeleponController.text = userMeta.firstWhere(
          (item) => item['name'] == 'verify_data_phone',
          orElse: () => {"val": ""})['val'];
      print('addr from meta');
      alamatController.text = userMeta.firstWhere(
          (item) => item['name'] == 'verify_data_address',
          orElse: () => {"val": ""})['val'];
      if (roleId != 8) {
        print('buss from meta');
        namaUsahaController.text = userMeta.firstWhere(
            (item) => item['name'] == 'verify_data_bussiness_name',
            orElse: () => {"val": ""})['val'];
        print('jabatan from meta');
        jabatanController.text = userMeta.firstWhere(
            (item) => item['name'] == 'verify_data_position',
            orElse: () => {"val": ""})['val'];
        print('cat from meta');
        List<String> cat = userMeta
            .firstWhere((item) => item['name'] == 'verify_data_category',
                orElse: () => {"val": ""})['val']
            .split(',');
        print('loop cat from meta');
        for (var i = 0; i < cat.length; i++) {
          cat[i] = transform[cat[i]]!;
          switch (cat[i]) {
            case 'Penginapan':
              checkboxGroupValues1.add(cat[i]);
              break;
            case 'Tour & Travel':
              checkboxGroupValues1.add(cat[i]);
              break;
            case 'Makanan & Minuman':
              checkboxGroupValues1.add(cat[i]);
              break;
            case 'UMKM':
              checkboxGroupValues2.add(cat[i]);
              break;
            case 'Transportasi':
              checkboxGroupValues2.add(cat[i]);
              break;
            case 'Tiket Wisata':
              checkboxGroupValues2.add(cat[i]);
              break;
            default:
          }
        }
        print('end loop cat from meta');
        checkboxGroupValueController1 =
            FormFieldController(checkboxGroupValues1);
        checkboxGroupValueController2 =
            FormFieldController(checkboxGroupValues2);
        print('npwp from meta');
        nomorNpwpController.text = userMeta.firstWhere(
            (item) => item['name'] == 'verify_data_npwp',
            orElse: () => {"val": ""})['val'];
        print('npwp img from meta');
        npwpImage =
            'https://user-api.kelotimaja.kabtour.com/storage/private/${jsonDecode(userMeta.firstWhere((item) => item['name'] == 'verify_data_npwp_card', orElse: () => {
                  "val": ""
                })['val'])['path']}';
      }
      print('ktp from meta');
      nomorKtpController.text = userMeta.firstWhere(
          (item) => item['name'] == 'verify_data_nik',
          orElse: () => {"val": ""})['val'];
      print('ktp img from meta');
      ktpImage =
          'https://user-api.kelotimaja.kabtour.com/storage/private/${jsonDecode(userMeta.firstWhere((item) => item['name'] == 'verify_data_id_card', orElse: () => {
                "val": ""
              })['val'])['path']}';
      if (roleId == 1) {
        List tlval = jsonDecode(userMeta.firstWhere(
            (item) => item['name'] == 'verify_data_trade_license',
            orElse: () => {
                  "val": [
                    {'path': ''}
                  ]
                })['val']);
        print('tlval : $tlval');
        if (tlval.isNotEmpty) {
          docImage =
              'https://user-api.kelotimaja.kabtour.com/storage/private/${tlval[0]['path']}';
        }
      }
      if (roleId == 7 || roleId == 9) {
        nomorTdpController.text = userMeta.firstWhere(
            (item) => item['name'] == 'verify_data_tdp',
            orElse: () => {"val": ""})['val'];
        tdpImage =
            'https://user-api.kelotimaja.kabtour.com/storage/private/${jsonDecode(userMeta.firstWhere((item) => item['name'] == 'verify_data_tdp_document', orElse: () => {
                  "val": ""
                })['val'])['path']}';
        nomorSiupController.text = userMeta.firstWhere(
            (item) => item['name'] == 'verify_data_siup',
            orElse: () => {"val": ""})['val'];
        siupImage =
            'https://user-api.kelotimaja.kabtour.com/storage/private/${jsonDecode(userMeta.firstWhere((item) => item['name'] == 'verify_data_siup_document', orElse: () => {
                  "val": ""
                })['val'])['path']}';
      }
      if (roleId == 8) {
        nomorSimController.text = userMeta.firstWhere(
            (item) => item['name'] == 'verify_data_driving_license',
            orElse: () => {"val": ""})['val'];
        simImage =
            'https://user-api.kelotimaja.kabtour.com/storage/private/${jsonDecode(userMeta.firstWhere((item) => item['name'] == 'verify_data_driving_license_card', orElse: () => {
                  "val": ""
                })['val'])['path']}';
      }
      update();
    }
  }

  Future<Map<String, dynamic>> sendMitraVerification() async {
    print(nomorKtpControllerValidator);
    var param = buildParam();
    print(param);
    if (param.isNotEmpty) {
      var res = await apiClient.post('/verification',
          data: param, verificationFiles: files);
      print(res);
      return res['body'];
    }
    return {};
  }

  Map<String, dynamic> buildParam() {
    if (validateForm()) {
      Map<String, dynamic> param = {};

      param['email'] = emailAddressController.text;
      param['name'] = namaMitraController.text;
      param['phone'] = nomorTeleponController.text;

      var userRole = userStorage.read('user_role');
      int roleId = userRole['role_id'];

      if (roleId != 8) {
        param['bussiness_name'] = namaUsahaController.text;
        param['position'] = jabatanController.text;

        List<String> gabung = [];
        gabung.addAll(checkboxGroupValues1);
        gabung.addAll(checkboxGroupValues2);
        List<String> cat = [];
        for (var e in gabung) {
          switch (e) {
            case 'Penginapan':
              cat.add('homestay');
              break;
            case 'Makanan & Minuman':
              cat.add('food-beverage');
              break;
            case 'Tiket Wisata':
              cat.add('tiket-wisata');
              break;
            case 'Tour & Travel':
              cat.add('tour');
              break;
            default:
              cat.add(e.toLowerCase());
              break;
          }
        }
        param['category'] = cat.join(',');
      }

      param['address'] = alamatController.text;

      //document
      param['nik'] = nomorKtpController.text;
      if (uploadedLocalFile1.name != null) {
        files.add({'id_card': uploadedLocalFile1});
      }
      if (roleId == 1) {
        param['npwp'] = nomorNpwpController.text;
        if (uploadedLocalFile2.name != null) {
          files.add({'npwp_card': uploadedLocalFile2});
        }
        if (uploadedLocalFile6.name != null) {
          files.add({'trade_license_1': uploadedLocalFile6});
        }
      }
      if (roleId == 7 || roleId == 9) {
        param['npwp'] = nomorNpwpController.text;
        if (uploadedLocalFile2.name != null) {
          files.add({'npwp_card': uploadedLocalFile2});
        }
        param['tdp'] = nomorTdpController.text;
        if (uploadedLocalFile3.name != null) {
          files.add({'tdp_document': uploadedLocalFile3});
        }
        param['siup'] = nomorSiupController.text;
        if (uploadedLocalFile4.name != null) {
          files.add({'siup_document': uploadedLocalFile4});
        }
      }
      if (roleId == 8) {
        param['driving_license'] = nomorSimController.text;
        if (uploadedLocalFile5.name != null) {
          files.add({'driving_license_card': uploadedLocalFile5});
        }
      }
      return param;
    }
    return {};
  }

  clearRekeningParam() {
    noRek.clear();
    refreshed(false);
    update();
  }

  clearValue() {
    emailAddressController.clear();
    namaMitraController.clear();
    nomorTeleponController.clear();
    namaUsahaController.clear();
    jabatanController.clear();
    alamatController.clear();
    checkboxGroupValues1.clear();
    checkboxGroupValueController1.reset();
    checkboxGroupValues2.clear();
    checkboxGroupValueController2.reset();
    nomorKtpController.clear();
    nomorNpwpController.clear();
    nomorSimController.clear();
    nomorSiupController.clear();
    nomorTdpController.clear();
    uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
    uploadedLocalFile2 = FFUploadedFile(bytes: Uint8List.fromList([]));
    uploadedLocalFile3 = FFUploadedFile(bytes: Uint8List.fromList([]));
    uploadedLocalFile4 = FFUploadedFile(bytes: Uint8List.fromList([]));
    uploadedLocalFile5 = FFUploadedFile(bytes: Uint8List.fromList([]));
    uploadedLocalFile6 = FFUploadedFile(bytes: Uint8List.fromList([]));
    ktpImage = '';
    npwpImage = '';
    simImage = '';
    siupImage = '';
    tdpImage = '';
    docImage = '';
    isDataUploading1 = false;
    isDataUploading2 = false;
    isDataUploading3 = false;
    isDataUploading4 = false;
    isDataUploading5 = false;
    isDataUploading6 = false;
    files = [];
  }

  bool validateForm() {
    bool ready = true;
    var userRole = userStorage.read('user_role');

    // print(test);
    String? validateMessage = validateEmail(emailAddressController.text);
    if (validateMessage != null) {
      ready = false;
      buildDefaultDialog('Error', validateMessage, () => Get.back());
      return ready;
    }
    validateMessage = validateNotEmpty(namaMitraController.text);
    if (validateMessage != null) {
      ready = false;
      buildDefaultDialog('Error', 'Nama tidak boleh kosong', () => Get.back());
      return ready;
    }
    validateMessage = validateNotEmpty(nomorTeleponController.text);
    if (validateMessage != null) {
      ready = false;
      buildDefaultDialog(
          'Error', 'Nomor Telepon tidak boleh kosong', () => Get.back());
      return ready;
    }

    if (userRole['role_id'] != 8) {
      validateMessage = validateNotEmpty(namaUsahaController.text);
      if (validateMessage != null) {
        ready = false;
        buildDefaultDialog(
            'Error', 'Nama Usaha tidak boleh kosong', () => Get.back());
        return ready;
      }
      validateMessage = validateNotEmpty(jabatanController.text);
      if (validateMessage != null) {
        ready = false;
        buildDefaultDialog(
            'Error', 'Jabatan tidak boleh kosong', () => Get.back());
        return ready;
      }
    }

    validateMessage = validateNotEmpty(alamatController.text);
    if (validateMessage != null) {
      ready = false;
      buildDefaultDialog(
          'Error', 'Alamat tidak boleh kosong', () => Get.back());
      return ready;
    }

    if (userRole['role_id'] != 8) {
      List<String> test = [];
      test.addAll(checkboxGroupValues1);
      test.addAll(checkboxGroupValues2);

      if (test.isEmpty) {
        ready = false;
        buildDefaultDialog(
            'Error', 'Mohon pilih Jenis Usaha', () => Get.back());
        return ready;
      }

      if (nomorNpwpController.text.isEmpty) {
        ready = false;
        buildDefaultDialog('Error', 'Mohon isi Nomor NPWP', () => Get.back());
        return ready;
      }
      if (uploadedLocalFile2.name == null) {
        if (npwpImage.isEmpty) {
          ready = false;
          buildDefaultDialog(
              'Error', 'Mohon unggah foto NPWP', () => Get.back());
        }
        return ready;
      }

      if (userRole['role_id'] == 7 || userRole['role_id'] == 9) {
        if (nomorTdpController.text.isEmpty) {
          ready = false;
          buildDefaultDialog('Error', 'Mohon isi Nomor TDP', () => Get.back());
          return ready;
        }
        if (uploadedLocalFile3.name == null) {
          if (tdpImage.isEmpty) {
            ready = false;
            buildDefaultDialog(
                'Error', 'Mohon unggah Dokumen TDP', () => Get.back());
          }
          return ready;
        }

        if (nomorSiupController.text.isEmpty) {
          ready = false;
          buildDefaultDialog('Error', 'Mohon isi Nomor SIUP', () => Get.back());
          return ready;
        }
        if (uploadedLocalFile4.name == null) {
          if (siupImage.isEmpty) {
            ready = false;
            buildDefaultDialog(
                'Error', 'Mohon unggah Dokumen SIUP', () => Get.back());
          }
          return ready;
        }
      }
    } else {
      if (nomorSimController.text.isEmpty) {
        ready = false;
        buildDefaultDialog('Error', 'Mohon isi Nomor SIM', () => Get.back());
        return ready;
      }
      if (uploadedLocalFile5.name == null) {
        if (simImage.isEmpty) {
          ready = false;
          buildDefaultDialog(
              'Error', 'Mohon unggah Foto SIM', () => Get.back());
        }
        return ready;
      }
    }

    if (nomorKtpController.text.isEmpty) {
      ready = false;
      buildDefaultDialog('Error', 'Mohon isi NIK', () => Get.back());
      return ready;
    }
    if (uploadedLocalFile1.name == null) {
      if (ktpImage.isEmpty) {
        ready = false;
        buildDefaultDialog('Error', 'Mohon unggah foto KTP', () => Get.back());
      }
      return ready;
    }
    return ready;
  }

  buildDefaultDialog(title, message, action) {
    Get.defaultDialog(title: title, middleText: message, onConfirm: action);
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

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field ini tidak boleh kosong';
    }
    return null;
  }
}
