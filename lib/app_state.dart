import 'package:flutter/material.dart';
import 'package:kelotimaja/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

import 'flutter_flow/request_manager.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _accessToken = prefs.getString('ff_accessToken') ?? _accessToken;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userData')) {
        try {
          _userData = jsonDecode(prefs.getString('ff_userData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userDataChat')) {
        try {
          _userDataChat = jsonDecode(prefs.getString('ff_userDataChat') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _uid = prefs.getString('ff_uid') ?? _uid;
    });
    _safeInit(() {
      _isFirst = prefs.getBool('ff_isFirst') ?? _isFirst;
    });
    _safeInit(() {
      _zeroVal = prefs.getInt('ff_zeroVal') ?? _zeroVal;
    });
    _safeInit(() {
      _Value = prefs.getInt('ff_Value') ?? _Value;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    prefs.setString('ff_accessToken', _value);
  }

  dynamic _userData;
  dynamic get userData => _userData;
  set userData(dynamic _value) {
    _userData = _value;
    prefs.setString('ff_userData', jsonEncode(_value));
  }

  dynamic _userDataChat;
  dynamic get userDataChat => _userDataChat;
  set userDataChat(dynamic _value) {
    _userDataChat = _value;
    prefs.setString('ff_userDataChat', jsonEncode(_value));
  }

  String _uid = '';
  String get uid => _uid;
  set uid(String _value) {
    _uid = _value;
    prefs.setString('ff_uid', _value);
  }

  bool _isFirst = true;
  bool get isFirst => _isFirst;
  set isFirst(bool _value) {
    _isFirst = _value;
    prefs.setBool('ff_isFirst', _value);
  }

  int _zeroVal = 0;
  int get zeroVal => _zeroVal;
  set zeroVal(int _value) {
    _zeroVal = _value;
    prefs.setInt('ff_zeroVal', _value);
  }

  String _location = '';
  String get location => _location;
  set location(String _value) {
    _location = _value;
  }

  String _hargaTotal = '';
  String get hargaTotal => _hargaTotal;
  set hargaTotal(String _value) {
    _hargaTotal = _value;
  }

  String _hargaTotalTour = '';
  String get hargaTotalTour => _hargaTotalTour;
  set hargaTotalTour(String _value) {
    _hargaTotalTour = _value;
  }

  String _hargaTotalUmkm = '';
  String get hargaTotalUmkm => _hargaTotalUmkm;
  set hargaTotalUmkm(String _value) {
    _hargaTotalUmkm = _value;
  }

  final _umkmManger = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> umkmData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _umkmManger.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUmkmDataCache() => _umkmManger.clear();
  void clearGetUmkmDataCacheKey(String? uniqueKey) =>
      _umkmManger.clearRequest(uniqueKey);

  String _hargaTotalMakanan = '';
  String get hargaTotalMakanan => _hargaTotalMakanan;
  set hargaTotalMakanan(String _value) {
    _hargaTotalMakanan = _value;
  }

  final _tokoMakananManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> tokoMakanan({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _tokoMakananManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTokoMakananCache() => _tokoMakananManager.clear();
  void clearGetTokoMakananCacheKey(String? uniqueKey) =>
      _tokoMakananManager.clearRequest(uniqueKey);

  final _listMakananManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> listMakanan({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _listMakananManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListMakananCache() => _listMakananManager.clear();
  void clearListMakananCacheKey(String? uniqueKey) =>
      _listMakananManager.clearRequest(uniqueKey);

  dynamic _listLocation;
  dynamic get listLocation => _listLocation;
  set listLocation(dynamic _value) {
    _listLocation = _value;
  }

  dynamic _userAddressData;
  dynamic get userAddressData => _userAddressData;
  set userAddressData(dynamic _value) {
    _userAddressData = _value;
    prefs.setString('ff_userData', jsonEncode(_value));
  }

  String _formatedTime = '';
  String get formatedTime => _formatedTime;
  set formatedTime(String _value) {
    _formatedTime = _value;
  }

  String _locationId = '';
  String get locationId => _locationId;
  set locationId(String _value) {
    _locationId = _value;
  }

  dynamic _dataHomestay;
  dynamic get dataHomestay => _dataHomestay;
  set dataHomestay(dynamic _value) {
    _dataHomestay = _value;
  }

  dynamic _paymentGate;
  dynamic get paymentGate => _paymentGate;
  set paymentGate(dynamic _value) {
    _paymentGate = _value;
  }

  double _totPrice = 0.0;
  double get totPrice => _totPrice;
  set totPrice(double _value) {
    _totPrice = _value;
  }

  String _rooms = '';
  String get rooms => _rooms;
  set rooms(String _value) {
    _rooms = _value;
  }

  String _guests = '';
  String get guests => _guests;
  set guests(String _value) {
    _guests = _value;
  }

  String _taxAdmin = '10840';
  String get taxAdmin => _taxAdmin;
  set taxAdmin(String _value) {
    _taxAdmin = _value;
  }

  String _biayaPengiriman = '15000';
  String get biayaPengiriman => _biayaPengiriman;
  set biayaPengiriman(String _value) {
    _biayaPengiriman = _value;
  }

  String _biayaPenanganan = '2880';
  String get biayaPenanganan => _biayaPenanganan;
  set biayaPenanganan(String _value) {
    _biayaPenanganan = _value;
  }

  int _termsParkir = 96;
  int get termsParkir => _termsParkir;
  set termsParkir(int _value) {
    _termsParkir = _value;
  }

  int _termsKolam = 681;
  int get termsKolam => _termsKolam;
  set termsKolam(int _value) {
    _termsKolam = _value;
  }

  int _termsResto = 682;
  int get termsResto => _termsResto;
  set termsResto(int _value) {
    _termsResto = _value;
  }

  int _termsLaundry = 43;
  int get termsLaundry => _termsLaundry;
  set termsLaundry(int _value) {
    _termsLaundry = _value;
  }

  int _termsPlayground = 45;
  int get termsPlayground => _termsPlayground;
  set termsPlayground(int _value) {
    _termsPlayground = _value;
  }

  int _termsInet = 47;
  int get termsInet => _termsInet;
  set termsInet(int _value) {
    _termsInet = _value;
  }

  String _nullValue = 'null';
  String get nullValue => _nullValue;
  set nullValue(String _value) {
    _nullValue = _value;
  }

  dynamic _variantUMKM;
  dynamic get variantUMKM => _variantUMKM;
  set variantUMKM(dynamic _value) {
    _variantUMKM = _value;
  }

  dynamic _productCartUmkm;
  dynamic get productCartUmkm => _productCartUmkm;
  set productCartUmkm(dynamic _value) {
    _productCartUmkm = _value;
  }

  bool _trueFalse = true;
  bool get trueFalse => _trueFalse;
  set trueFalse(bool _value) {
    _trueFalse = _value;
  }

  List<String> _listVariant = [];
  List<String> get listVariant => _listVariant;
  set listVariant(List<String> _value) {
    _listVariant = _value;
  }

  List<String> _tourHari = [];
  List<String> get tourHari => _tourHari;
  set tourHari(List<String> _value) {
    _tourHari = _value;
  }

  void addToListVariant(String _value) {
    _listVariant.add(_value);
  }

  void removeFromListVariant(String _value) {
    _listVariant.remove(_value);
  }

  void removeAtIndexFromListVariant(int _index) {
    _listVariant.removeAt(_index);
  }

  void updateListVariantAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listVariant[_index] = updateFn(_listVariant[_index]);
  }

  String _biayaTransfer = '7500';
  String get biayaTransfer => _biayaTransfer;
  set biayaTransfer(String _value) {
    _biayaTransfer = _value;
  }

  String _variantPrice = '';
  String get variantPrice => _variantPrice;
  set variantPrice(String _value) {
    _variantPrice = _value;
  }

  dynamic _variantsJson;
  dynamic get variantsJson => _variantsJson;
  set variantsJson(dynamic _value) {
    _variantsJson = _value;
  }

  List<dynamic> _cartAddJson = [];
  List<dynamic> get cartAddJson => _cartAddJson;
  set cartAddJson(List<dynamic> _value) {
    _cartAddJson = _value;
  }

  void addToCartAddJson(dynamic _value) {
    _cartAddJson.add(_value);
  }

  void removeFromCartAddJson(dynamic _value) {
    _cartAddJson.remove(_value);
  }

  void removeAtIndexFromCartAddJson(int _index) {
    _cartAddJson.removeAt(_index);
  }

  void updateCartAddJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _cartAddJson[_index] = updateFn(_cartAddJson[_index]);
  }

  List<String> _cartAdds = [];
  List<String> get cartAdds => _cartAdds;
  set cartAdds(List<String> _value) {
    _cartAdds = _value;
  }

  void addToCartAdds(String _value) {
    _cartAdds.add(_value);
  }

  void removeFromCartAdds(String _value) {
    _cartAdds.remove(_value);
  }

  void removeAtIndexFromCartAdds(int _index) {
    _cartAdds.removeAt(_index);
  }

  void updateCartAddsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _cartAdds[_index] = updateFn(_cartAdds[_index]);
  }

  int _status = 0;
  int get status => _status;
  set status(int _value) {
    _status = _value;
  }

  int _CountController = 0;
  int get CountController => _CountController;
  set CountController(int _value) {
    _CountController = _value;
  }

  String _zeroValueString = '0.00';
  String get zeroValueString => _zeroValueString;
  set zeroValueString(String _value) {
    _zeroValueString = _value;
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? _value) {
    _startDate = _value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? _value) {
    _endDate = _value;
  }

  String _placepickervalue = '';
  String get placepickervalue => _placepickervalue;
  set placepickervalue(String _value) {
    _placepickervalue = _value;
  }

  String _address = '';
  String get address => _address;
  set address(String _value) {
    _address = _value;
  }

  FFLatLng? _locationLatLng;
  FFLatLng? get locationLatLng => _locationLatLng;
  set locationLatLng(FFLatLng? _value) {
    _locationLatLng = _value;
  }

  String _userAddress = '';
  String get userAddress => _userAddress;
  set userAddress(String _value) {
    _userAddress = _value;
  }

  String _userAddress2 = '';
  String get userAddress2 => _userAddress2;
  set userAddress2(String _value) {
    _userAddress2 = _value;
  }

  int _count = 0;
  int get count => _count;
  set count(int _value) {
    _count = _value;
  }

  int _createUser = 0;
  int get createUser => _createUser;
  set createUser(int _value) {
    _createUser = _value;
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  List<dynamic> _productUmkm = [];
  List<dynamic> get productUmkm => _productUmkm;
  set productUmkm(List<dynamic> _value) {
    _productUmkm = _value;
  }

  void addToProductUmkm(dynamic _value) {
    _productUmkm.add(_value);
  }

  void removeFromProductUmkm(dynamic _value) {
    _productUmkm.remove(_value);
  }

  void removeAtIndexFromProductUmkm(int _index) {
    _productUmkm.removeAt(_index);
  }

  void updateProductUmkmAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _productUmkm[_index] = updateFn(_productUmkm[_index]);
  }

  int _subcategoryIdMakanan = 8;
  int get subcategoryIdMakanan => _subcategoryIdMakanan;
  set subcategoryIdMakanan(int _value) {
    _subcategoryIdMakanan = _value;
  }

  int _subcategoryIdMinuman = 9;
  int get subcategoryIdMinuman => _subcategoryIdMinuman;
  set subcategoryIdMinuman(int _value) {
    _subcategoryIdMinuman = _value;
  }

  int _subcategoryIdPaket = 10;
  int get subcategoryIdPaket => _subcategoryIdPaket;
  set subcategoryIdPaket(int _value) {
    _subcategoryIdPaket = _value;
  }

  dynamic _filterMakanan;
  dynamic get filterMakanan => _filterMakanan;
  set filterMakanan(dynamic _value) {
    _filterMakanan = _value;
  }

  dynamic _filterMinuman;
  dynamic get filterMinuman => _filterMinuman;
  set filterMinuman(dynamic _value) {
    _filterMinuman = _value;
  }

  dynamic _filterMenuPaket;
  dynamic get filterMenuPaket => _filterMenuPaket;
  set filterMenuPaket(dynamic _value) {
    _filterMenuPaket = _value;
  }

  int _Value = 0;
  int get Value => _Value;
  set Value(int _value) {
    _Value = _value;
    prefs.setInt('ff_Value', _value);
  }

  List<dynamic> _addMakananToJson = [];
  List<dynamic> get addMakananToJson => _addMakananToJson;
  set addMakananToJson(List<dynamic> _value) {
    _addMakananToJson = _value;
  }

  void addToAddMakananToJson(dynamic _value) {
    _addMakananToJson.add(_value);
  }

  void removeFromAddMakananToJson(dynamic _value) {
    _addMakananToJson.remove(_value);
  }

  void removeAtIndexFromAddMakananToJson(int _index) {
    _addMakananToJson.removeAt(_index);
  }

  void updateAddMakananToJsonAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _addMakananToJson[_index] = updateFn(_addMakananToJson[_index]);
  }

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  set totalPrice(double _value) {
    _totalPrice = _value;
  }
}

FFLatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return FFLatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
