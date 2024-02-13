import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ChatGroup {
  static String baseUrl = 'https://chat.kabtour.com/';
  static Map<String, String> headers = {};
  static ChatCall chatCall = ChatCall();
}

class ChatCall {
  Future<ApiCallResponse> call({
    String api_secret_key = '',
    String add = '',
    String email_address = '',
    String full_name = '',
    String username = '',
    String password = '',
    String create_account = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Chat Call',
      apiUrl: '${UserGroup.baseUrl}/api_request',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
      },
      params: {
        'api_secret_key': api_secret_key,
        'add': 'login_session',
        'email_address': email_address,
        'full_name': full_name,
        'username': username,
        'password': '12345678',
        'create_account': 'yes',
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// Start User Group Code

class UserGroup {
  static String baseUrl = 'https://user-api.kabtour.com/v2';
  static Map<String, String> headers = {};
  static UserLoginCall userLoginCall = UserLoginCall();
  static UserForgotCall userForgotCall = UserForgotCall();
  static UserForgotTokenCall userForgotTokenCall = UserForgotTokenCall();
  static UserResetPasswordCall userResetPasswordCall = UserResetPasswordCall();
  static UserProfileCall userProfileCall = UserProfileCall();
  static UserProfileEditCall userProfileEditCall = UserProfileEditCall();
  static UserLogoutCall userLogoutCall = UserLogoutCall();
  static UserRegisterCall userRegisterCall = UserRegisterCall();
  static UserVerifyOTPCall userVerifyOTPCall = UserVerifyOTPCall();
  static UserResendOTPCall userResendOTPCall = UserResendOTPCall();
  static UserAddressCall userAddressCall = UserAddressCall();
  static UserAddressAddCall userAddressAddCall = UserAddressAddCall();
  static UserAddressEditCall userAddressEditCall = UserAddressEditCall();
  static UserAddressDeleteCall userAddressDeleteCall = UserAddressDeleteCall();
}

class UserLoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Login',
      apiUrl: '${UserGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
      },
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userUsr(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.user.id''',
      );
  dynamic userName(dynamic response) => getJsonField(
        response,
        r'''$.user.name''',
      );
  dynamic userEmail(dynamic response) => getJsonField(
        response,
        r'''$.user.email''',
      );
  dynamic userPhone(dynamic response) => getJsonField(
        response,
        r'''$.user.phone''',
      );
  dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
}

class UserForgotCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Forgot',
      apiUrl: '${UserGroup.baseUrl}/forgot-password',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserForgotTokenCall {
  Future<ApiCallResponse> call({
    int? token,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Forgot Token',
      apiUrl: '${UserGroup.baseUrl}/forgot-password/${token}',
      callType: ApiCallType.GET,
      headers: {
        ...UserGroup.headers,
      },
      params: {},
      // bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? confirm_password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Reset Password',
      apiUrl: '${UserGroup.baseUrl}/reset-password?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
      },
      params: {
        'email': email,
        'password': password,
        'confirm_password': confirm_password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserProfileCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Profile',
      apiUrl: '${UserGroup.baseUrl}/profile',
      callType: ApiCallType.GET,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserProfileEditCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    FFUploadedFile? avatar,
    String? uid = '',
    String? name = '',
    String? email = '',
    String? phone = '',
    String? birthday = '',
    String? nik = '',
    String? gender = '',
  }) {
    Map<String, dynamic> postParam = {
      // 'avatar': avatar,
      'name': name,
      'email': email,
      'phone': phone,
      'birthday': birthday,
      'nik': nik,
      'gender': gender,
    };
    if (avatar!.bytes!.length > 0) {
      postParam['avatar'] = avatar;
    }
    return ApiManager.instance.makeApiCall(
      callName: 'User Edit Profile',
      apiUrl: '${UserGroup.baseUrl}/update?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      // params: {
      //   'avatar': avatar,
      //   'name': name,
      //   'email': email,
      //   'phone': phone,
      //   'birthday': birthday,
      // },
      params: postParam,
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserLogoutCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Logout',
      apiUrl: '${UserGroup.baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserRegisterCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? name = '',
    String? email = '',
    String? phone = '',
    String? password = '',
    String? roleId = '',
    String? kabupatenId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Register',
      apiUrl: '${UserGroup.baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
      },
      params: {
        'first_name': firstName,
        'last_name': lastName,
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'role_id': roleId,
        'kabupaten_id': kabupatenId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  dynamic userDataId(dynamic response) => getJsonField(
        response,
        r'''$.user.id''',
      );
  dynamic userDataName(dynamic response) => getJsonField(
        response,
        r'''$.user.name''',
      );
  dynamic userDataFname(dynamic response) => getJsonField(
        response,
        r'''$.user.first_name''',
      );
  dynamic userDataLname(dynamic response) => getJsonField(
        response,
        r'''$.user.last_name''',
      );
  dynamic userDataMail(dynamic response) => getJsonField(
        response,
        r'''$.user.email''',
      );
  dynamic userDataPhn(dynamic response) => getJsonField(
        response,
        r'''$.user.phone''',
      );
  dynamic userDataToken(dynamic response) => getJsonField(
        response,
        r'''$.user.token''',
      );
  dynamic userDataRole(dynamic response) => getJsonField(
        response,
        r'''$.user.user_role''',
      );
  dynamic userDataRoleId(dynamic response) => getJsonField(
        response,
        r'''$.user.user_role.role_id''',
      );
  dynamic userDataRoleModelId(dynamic response) => getJsonField(
        response,
        r'''$.user.user_role.model_id''',
      );
  dynamic userDataWaletId(dynamic response) => getJsonField(
        response,
        r'''$.user.user_wallet.id''',
      );
  dynamic userDataWalet(dynamic response) => getJsonField(
        response,
        r'''$.user.user_wallet''',
      );
  dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
}

class UserVerifyOTPCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? otp,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Verify OTP',
      apiUrl: '${UserGroup.baseUrl}/verify-otp',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'otp': otp,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserResendOTPCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Resend OTP',
      apiUrl: '${UserGroup.baseUrl}/resend-otp',
      callType: ApiCallType.GET,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserAddressCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user address',
      apiUrl: '${UserGroup.baseUrl}/address',
      callType: ApiCallType.GET,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userAddressData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic userAddressDataLabel(dynamic response) => getJsonField(
        response,
        r'''$.data[:].label''',
        true,
      );
  dynamic userAddressDataAddress(dynamic response) => getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      );
  dynamic userAddressDataAddressDet(dynamic response) => getJsonField(
        response,
        r'''$.data[:].address_detail''',
        true,
      );
  dynamic userAddressDataAddressNam(dynamic response) => getJsonField(
        response,
        r'''$.data[:].receiver_name''',
        true,
      );
  dynamic userAddressDataAddressPhone(dynamic response) => getJsonField(
        response,
        r'''$.data[:].receiver_phone''',
        true,
      );
  dynamic userAddressDataDef(dynamic response) => getJsonField(
        response,
        r'''$.data[:].is_default''',
        true,
      );
}

class UserAddressAddCall {
  Future<ApiCallResponse> call({
    String? label = '',
    String? address = '',
    String? addressDetail = '',
    String? receiverName = '',
    String? receiverPhone = '',
    int? isDefault,
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user address add',
      apiUrl: '${UserGroup.baseUrl}/address/save',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'label': label,
        'address': address,
        'address_detail': addressDetail,
        'receiver_name': receiverName,
        'receiver_phone': receiverPhone,
        'is_default': isDefault,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserAddressEditCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? addressId = '',
    String? label = '',
    String? address = '',
    String? addressDetail = '',
    String? receiverName = '',
    String? receiverPhone = '',
    int? isDefault,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user address edit',
      apiUrl: '${UserGroup.baseUrl}/address/update/${addressId}?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'label': label,
        'address': address,
        'address_detail': addressDetail,
        'receiver_name': receiverName,
        'receiver_phone': receiverPhone,
        'is_default': isDefault,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserAddressDeleteCall {
  Future<ApiCallResponse> call({
    String? addressId = '',
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user address delete',
      apiUrl: '${UserGroup.baseUrl}/address/delete/${addressId}',
      callType: ApiCallType.DELETE,
      headers: {
        ...UserGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End User Group Code

/// Start Homestay Group Code

class HomestayGroup {
  static String baseUrl = 'https://hotel-api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static HomestayListCall homestayListCall = HomestayListCall();
  static HomestaySearchCall homestaySearchCall = HomestaySearchCall();
}

class HomestayListCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? nextPage,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Homestay List',
      apiUrl: '${HomestayGroup.baseUrl}/search?page=${nextPage}',
      callType: ApiCallType.GET,
      headers: {
        ...HomestayGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic homestayData(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      );
  dynamic homestayDataId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].id''',
        true,
      );
  dynamic homestayDataTitle(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].title''',
        true,
      );
  dynamic homestayDataSlug(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].slug''',
        true,
      );
  dynamic homestayDataContent(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].content''',
        true,
      );
  dynamic homestayDataLocId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location_id''',
        true,
      );
  dynamic homestayDataAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].address''',
        true,
      );
  dynamic homestayDataStar(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].star_rate''',
        true,
      );
  dynamic homestayDataPrice(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].price''',
        true,
      );
  dynamic homestayDataCkIn(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].check_in_time''',
        true,
      );
  dynamic homestayDataCkOut(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].check_out_time''',
        true,
      );
  dynamic homestayDataStatus(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].status''',
        true,
      );
  dynamic homestayDataCreUser(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].create_user''',
        true,
      );
  dynamic homestayDataRevScore(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].review_score''',
        true,
      );
  dynamic homestayDataBannerOrg(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].banner.original''',
        true,
      );
  dynamic homestayDataBussName(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].business_name''',
        true,
      );
  dynamic homestayDataPrcNorm(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].price_normal''',
        true,
      );
  dynamic homestayDatRooms(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms''',
        true,
      );
  dynamic homestayDatRoomsId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].id''',
        true,
      );
  dynamic homestayDatRoomsTitle(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].title''',
        true,
      );
  dynamic homestayDatRoomsContent(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].content''',
        true,
      );
  dynamic homestayDatRoomsPrice(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].price''',
        true,
      );
  dynamic homestayDatRoomsPriceweek(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].price_weekend''',
        true,
      );
  dynamic homestayDatRoomsholi(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].price_holiday''',
        true,
      );
  dynamic homestayDatRoomsdisc(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].discount''',
        true,
      );
  dynamic homestayDatRoomsdisweek(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].discount_weekend''',
        true,
      );
  dynamic homestayDatRoomsdischoli(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].discount_holiday''',
        true,
      );
  dynamic homestayDatRoomsparentId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].parent_id''',
        true,
      );
  dynamic homestayDatRoomsNumb(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].number''',
        true,
      );
  dynamic homestayDatRoomsSglBed(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].single_bed''',
        true,
      );
  dynamic homestayDatRoomsDblBed(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].double_bed''',
        true,
      );
  dynamic homestayDatRoomsTwnBed(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].twin_bed''',
        true,
      );
  dynamic homestayDatRoomsMaxGuest(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].max_guests''',
        true,
      );
  dynamic homestayDatRoomsStatus(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].status''',
        true,
      );
  dynamic homestayDatRoomsCreUsr(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].create_user''',
        true,
      );
  dynamic homestayDatRoomsBannerOrg(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].banner.original''',
        true,
      );
  dynamic homestayDatRoomsPriceNorm(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].price_normal''',
        true,
      );
  dynamic homestayDatRoomsTerms(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].terms''',
        true,
      );
  dynamic homestayDatRoomsTermsId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].terms[:].id''',
        true,
      );
  dynamic homestayDatRoomsTermsIds(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].terms[:].term_id''',
        true,
      );
  dynamic homestayDatRoomsTermsTarget(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].terms[:].target_id''',
        true,
      );
  dynamic homestayDatRoomsTermsCreUsr(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms[:].terms[:].create_user''',
        true,
      );
  dynamic homestayDatRoomsTermsLocId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location.id''',
        true,
      );
  dynamic homestayDatRoomsTermsLoc(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location''',
        true,
      );
  dynamic homestayDatRoomsTermsLocnAme(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location.name''',
        true,
      );
  dynamic homestayDatRoomsTermsContn(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location.content''',
        true,
      );
  dynamic homestayDatRoomsTermsSlug(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location.slug''',
        true,
      );
  dynamic homestayNextPage(dynamic response) => getJsonField(
        response,
        r'''$.data.next_page_url''',
        true,
      );
}

class HomestaySearchCall {
  Future<ApiCallResponse> call({
    String? locationId = '',
    String? checkout = '',
    String? checkin = '',
    String? locationName = '',
    int? nextPage,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Homestay Search',
      apiUrl:
          '${HomestayGroup.baseUrl}/search?page=${nextPage}&location_id=$locationId',
      callType: ApiCallType.GET,
      headers: {
        ...HomestayGroup.headers,
      },
      params: {
        'location_id': locationId,
        'checkout': checkout,
        'checkin': checkin,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataHomestay(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      );
  dynamic dataRoomHomestay(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].rooms''',
        true,
      );
  dynamic dataHomestayId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].id''',
        true,
      );
  dynamic dataHomestayLoc(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location''',
        true,
      );
  dynamic dataHomestayLocName(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location.name''',
        true,
      );
  dynamic dataHomestayLocId(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].location.id''',
        true,
      );
}

/// End Homestay Group Code

/// Start Rent Group Code
class RentGroup {
  static String baseUrl = 'https://rent-api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static RentListCall rentListCall = RentListCall();
}

class RentListCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Rent List',
      apiUrl: '${RentGroup.baseUrl}/search',
      callType: ApiCallType.GET,
      headers: {
        ...RentGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataRent(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

/// End Rent Group Code

/// Start Tour Group Code

class EventGroup {
  static String baseUrl = 'https://tour-api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static EventListCall eventListCall = EventListCall();
}

class EventListCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tour List',
      apiUrl: '${EventGroup.baseUrl}/tour/search',
      callType: ApiCallType.GET,
      headers: {
        ...EventGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataTour(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic dataItinerary(dynamic response) => getJsonField(
        response,
        r'''$.data[:].itinerary''',
        true,
      );
  dynamic dataItineraryHari(dynamic response) => getJsonField(
        response,
        r'''$.data[:].itinerary[:].hari''',
        true,
      );
}

/// End Tour Group Code

/// Start Api Helper Group Code

class ApiHelperGroup {
  static String baseUrl = 'https://api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static GetReviewHandlerCall getReviewHandlerCall = GetReviewHandlerCall();
  static ApiLocationCall apiLocationCall = ApiLocationCall();
  static AddReviewHandlerCall addReviewHandlerCall = AddReviewHandlerCall();
  static UpdateReviewHandlerCall updateReviewHandlerCall =
      UpdateReviewHandlerCall();
}

class GetReviewHandlerCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? objectModel = '',
    String? appId = '3',
    // String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Api Homestay Review',
      apiUrl:
          '${ApiHelperGroup.baseUrl}/review?object_model=${objectModel}&object_id=${objectId}&app_id=${appId}',
      callType: ApiCallType.GET,
      headers: {
        ...ApiHelperGroup.headers,
        // 'Authorization': 'Bearer ${accessToken}',
      },
      params: {'object_model': objectModel, 'object_id': objectId},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic reviewData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class ApiLocationCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Api Location',
      apiUrl: '${ApiHelperGroup.baseUrl}/location',
      callType: ApiCallType.GET,
      headers: {
        ...ApiHelperGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic locationId(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic locationName(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
}

class AddReviewHandlerCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? bookingId = '',
    String? bookingCode = '',
    String? objectId = '',
    String? objectModel = '',
    String? content = '',
    String? rateNumber = '',
    String? vendorId = '',
    String? appId = '3',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Add Review handler',
      apiUrl: '${ApiHelperGroup.baseUrl}/review/add',
      callType: ApiCallType.POST,
      headers: {
        ...ApiHelperGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'booking_id': bookingId,
        'booking_code': bookingCode,
        'object_id': objectId,
        'object_model': objectModel,
        'content': content,
        'rate_number': rateNumber,
        'vendor_id': vendorId,
        'app_id': appId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateReviewHandlerCall {
  Future<ApiCallResponse> call({
    int? revid,
    String? content = '',
    String? rateNumber = '',
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Review Handler',
      apiUrl: '${ApiHelperGroup.baseUrl}/review/update/${revid}?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...ApiHelperGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'content': content,
        'rate_number': rateNumber,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Api Helper Group Code
///
/// Start API Search

class SearchKeyGroup {
  static String baseUrl = 'https://api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static ListAllProdukCall listAllProdukCall = ListAllProdukCall();
}

class ListAllProdukCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Lokasi Produk All',
      apiUrl: '${SearchKeyGroup.baseUrl}/keyword-search?keyword=${keyword}',
      callType: ApiCallType.GET,
      headers: {
        ...SearchKeyGroup.headers,
      },
      params: {
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Keyword Search

/// Start UMKM Group Code

class UmkmGroup {
  static String baseUrl = 'https://api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static ListProdukUMKMCall listProdukUMKMCall = ListProdukUMKMCall();
  static LokasiProdukUMKMCall lokasiProdukUMKMCall = LokasiProdukUMKMCall();
  static SearchProdukCall searchProdukCall = SearchProdukCall();
  static ListTokoCall listTokoCall = ListTokoCall();
  static FilterKategoriCall filterKategoriCall = FilterKategoriCall();
}

class ListProdukUMKMCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'List Produk UMKM',
      apiUrl: '${UmkmGroup.baseUrl}/products/search?category_id=5',
      callType: ApiCallType.GET,
      headers: {
        ...UmkmGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LokasiProdukUMKMCall {
  Future<ApiCallResponse> call({
    int? locationId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Lokasi Produk UMKM',
      apiUrl:
          '${UmkmGroup.baseUrl}/products/search?category_id=5&location_id=${locationId}',
      callType: ApiCallType.GET,
      headers: {
        ...UmkmGroup.headers,
      },
      params: {
        'locationId': locationId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchProdukCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Produk',
      apiUrl: '${UmkmGroup.baseUrl}/keyword-search?keyword=${keyword}',
      callType: ApiCallType.GET,
      headers: {
        ...UmkmGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListTokoCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'list Toko',
      apiUrl: '${UmkmGroup.baseUrl}/umkm',
      callType: ApiCallType.GET,
      headers: {
        ...UmkmGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FilterKategoriCall {
  Future<ApiCallResponse> call({
    int? umkmid,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'filter kategori',
      apiUrl:
          '${UmkmGroup.baseUrl}/products/search?category_id=5&subcategory_id=${umkmid}',
      callType: ApiCallType.GET,
      headers: {
        ...UmkmGroup.headers,
      },
      params: {
        'umkmid': umkmid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End UMKM Group Code

/// Start Makanan minuman Group Code

class MakananMinumanGroup {
  static String baseUrl = 'https://api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static GetMakananCall getMakananCall = GetMakananCall();
  static ListMakananCall listMakananCall = ListMakananCall();
  static GetTokoMakananCall getTokoMakananCall = GetTokoMakananCall();
  static FilterMakananCall filterMakananCall = FilterMakananCall();
  static FilterMinumanCall filterMinumanCall = FilterMinumanCall();
  static FilterPaketCall filterPaketCall = FilterPaketCall();
}

class GetTokoMakananCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'get toko makanan',
      apiUrl: '${MakananMinumanGroup.baseUrl}/food-beverage',
      callType: ApiCallType.GET,
      headers: {
        ...MakananMinumanGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetMakananCall {
  Future<ApiCallResponse> call({
    int? createUser,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get makanan',
      apiUrl:
          '${MakananMinumanGroup.baseUrl}/products/search?category_id=7&create_user=${createUser}',
      callType: ApiCallType.GET,
      headers: {
        ...MakananMinumanGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ListMakananCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'List makanan',
      apiUrl: '${MakananMinumanGroup.baseUrl}/products/search?category_id=7',
      callType: ApiCallType.GET,
      headers: {
        ...MakananMinumanGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FilterMakananCall {
  Future<ApiCallResponse> call({
    int? createUser,
    int? sid,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'filter makanan',
      apiUrl:
          '${MakananMinumanGroup.baseUrl}/products/search?category_id=7&subcategory_id=${sid}&create_user=${createUser}',
      callType: ApiCallType.GET,
      headers: {
        ...MakananMinumanGroup.headers,
      },
      params: {
        // 'create_user': createUser,
        // 'id': sid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FilterMinumanCall {
  Future<ApiCallResponse> call({
    int? createUser,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'filter minuman',
      apiUrl:
          '${MakananMinumanGroup.baseUrl}/products/search?category_id=7&subcategory_id=9&create_user=${createUser}',
      callType: ApiCallType.GET,
      headers: {
        ...MakananMinumanGroup.headers,
      },
      params: {
        'create_user': createUser,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FilterPaketCall {
  Future<ApiCallResponse> call({
    int? createUser,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'filter paket',
      apiUrl:
          '${MakananMinumanGroup.baseUrl}/products/search?category_id=7&subcategory_id=10&create_user=${createUser}',
      callType: ApiCallType.GET,
      headers: {
        ...MakananMinumanGroup.headers,
      },
      params: {
        'create_user': createUser,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Makanan minuman Group Code

/// Start Tiket Group

class TiketWisataGroup {
  static String baseUrl = 'https://api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static GetTiketWisataCall getTiketWisataCall = GetTiketWisataCall();
  static FilterTiketWisataCall filterTiketWisataCall = FilterTiketWisataCall();
  static BeliTiketWisataCall beliTiketWisataCall = BeliTiketWisataCall();
}

class GetTiketWisataCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Tiket Wisata',
      apiUrl: '${TiketWisataGroup.baseUrl}/tiket-wisata',
      callType: ApiCallType.GET,
      headers: {
        ...TiketWisataGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataTiket(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class FilterTiketWisataCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    int? loc_id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Tiket Wisata Filter',
      apiUrl:
          '${TiketWisataGroup.baseUrl}/tiket-wisata?date=${startDate}&location_id=${loc_id}',
      callType: ApiCallType.GET,
      headers: {
        ...TiketWisataGroup.headers,
      },
      params: {
        'date': startDate,
        'location_id': loc_id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataTiket(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class BeliTiketWisataCall {
  Future<ApiCallResponse> call({
    String? tiketId,
    String? nama = '',
    String? dewasa = '',
    String? anak = '',
    String? phone = '',
    String? email = '',
  }) {
    Map<String, dynamic> postParam = {
      'tiket_id': tiketId,
      'nama': nama,
      'dewasa': dewasa,
      'anak': anak,
      'phone': phone,
      'email': email,
    };
    if (FFAppState().accessToken.isNotEmpty) {
      postParam['user_id'] = FFAppState().userData['id'];
    }
    return ApiManager.instance.makeApiCall(
      callName: 'User Reset Password',
      apiUrl: '${TiketWisataGroup.baseUrl}/checkin-wisata',
      callType: ApiCallType.POST,
      headers: {
        ...TiketWisataGroup.headers,
      },
      params: postParam,
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End tiket group
///
/// Start Tentng kabupaten
///

class TentangKabupatenGroup {
  static String baseUrl = 'https://api.kabtour.com/public/v2';
  static Map<String, String> headers = {};
  static TentangKabCall tentangKabCall = TentangKabCall();
}

class TentangKabCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Tentang Kabupaten',
      apiUrl: '${TentangKabupatenGroup.baseUrl}/location/kabupaten-lombok-timur',
      callType: ApiCallType.GET,
      headers: {
        ...TentangKabupatenGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// Start Booking Handler Group Code

class BookingHandlerGroup {
  static String baseUrl = 'https://booking-api.lotim.kabtour.com/v2';
  static Map<String, String> headers = {};
  static HomestayCall homestayCall = HomestayCall();
  static TransaksiCall transaksiCall = TransaksiCall();
  static HistoryTransaksiCall historyTransaksiCall = HistoryTransaksiCall();
  static PaymentHomestayCall paymentHomestayCall = PaymentHomestayCall();
  static TourCall tourCall = TourCall();
  static PaymentTourCall paymentTourCall = PaymentTourCall();
  static WisataCall wisataCall = WisataCall();
  static PaymentWisataCall paymentWisataCall = PaymentWisataCall();
  static RentCall rentCall = RentCall();
  static PaymentRentCall paymentRentCall = PaymentRentCall();
  static MakananMinumanUMKMCall makananMinumanUMKMCall =
      MakananMinumanUMKMCall();
  static PaymentMakananMinumanUMKMCall paymentMakananMinumanUMKMCall =
      PaymentMakananMinumanUMKMCall();
}

class HomestayCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? hotelId = '',
    String? roomId = '',
    String? totalRoom = '',
    String? checkin = '',
    String? checkout = '',
    String? price = '',
    String? balance = '',
    String? totalPrice = '',
    String? firstName = '',
    String? lastName = '',
    String? phone = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Homestay',
      apiUrl: '${BookingHandlerGroup.baseUrl}/booking/homestay',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'hotel_id': hotelId,
        'room_id': roomId,
        'total_room': totalRoom,
        'checkin': checkin,
        'checkout': checkout,
        'price': price,
        'balance': balance,
        'total_price': totalPrice,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransaksiCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Transaksi',
      apiUrl: '${BookingHandlerGroup.baseUrl}/my-transactions',
      callType: ApiCallType.GET,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataTransaksi(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class HistoryTransaksiCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Transaksi',
      apiUrl: '${BookingHandlerGroup.baseUrl}/transaction-history',
      callType: ApiCallType.GET,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic dataTransaksi(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class PaymentHomestayCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? gateway = '',
    String? status = 'waiting',
    String? accessToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment Homestay',
      apiUrl:
          '${BookingHandlerGroup.baseUrl}/booking/homestay/update/${code}?_method=PUT',
      callType: ApiCallType.PUT,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {'gateway': gateway, 'status': 'waiting'},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TourCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    // String? locationId = '',
    // dynamic? dataTourJson,
    String? tourId = '',
    String? price = '',
    String? totalGuests = '',
    String? totalPrice = '',
    String? isPrivate = '',
    String? startDate = '',
  }) {
    // final dataTour = _serializeJson(dataTourJson);

    return ApiManager.instance.makeApiCall(
      callName: 'Tour',
      apiUrl: '${BookingHandlerGroup.baseUrl}/booking/tour',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        // 'location_id': locationId,
        // 'data_tour': dataTour,
        'tour_id': tourId,
        'price': price,
        'total_guests': totalGuests,
        'total_price': totalPrice,
        'is_private': isPrivate,
        'start_date': startDate,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentTourCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? code = '',
    String? gateWay = '',
    String? status = 'waiting',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment Tour',
      apiUrl:
          '${BookingHandlerGroup.baseUrl}/booking/tour/update/${code}?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'status': status,
        'gateway': gateWay,
      },
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class WisataCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    // String? locationId = '',
    // dynamic? dataTourJson,
    String? twId = '',
    String? price = '',
    String? totalGuests = '',
    int? totalPrice = 0,
    String? isPrivate = '',
    String? startDate = '',
    String? endDate = '',
  }) {
    // final dataTour = _serializeJson(dataTourJson);

    return ApiManager.instance.makeApiCall(
      callName: 'Tiket Wisata',
      apiUrl: '${BookingHandlerGroup.baseUrl}/booking/tiket-wisata',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        // 'location_id': locationId,
        // 'data_tour': dataTour,
        'tw_id': twId,
        'price': price,
        'total_guests': totalGuests,
        'total_price': totalPrice,
        'start_date': startDate,
        'end_date': endDate,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentWisataCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? code = '',
    String? gateWay = '',
    String? status = 'waiting',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment Tiket Wisata',
      apiUrl:
          '${BookingHandlerGroup.baseUrl}/booking/tiket-wisata/update/${code}?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'status': status,
        'gateway': gateWay,
      },
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RentCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    // String? locationId = '',
    // dynamic? dataTourJson,
    String? carId = '',
    String? price = '',
    // String? totalDays = '',
    int? totalPrice = 0,
    String? isPrivate = '',
    String? startDate = '',
    String? endDate = '',
  }) {
    // final dataTour = _serializeJson(dataTourJson);

    return ApiManager.instance.makeApiCall(
      callName: 'Transportasi',
      apiUrl: '${BookingHandlerGroup.baseUrl}/booking/transportasi',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        // 'location_id': locationId,
        // 'data_tour': dataTour,
        'car_id': carId,
        'price': price,
        // 'total_guests': totalDays,
        'total_price': totalPrice,
        'start_date': startDate,
        'end_date': endDate,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentRentCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? code = '',
    String? gateWay = '',
    String? status = 'waiting',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment transportasi',
      apiUrl:
          '${BookingHandlerGroup.baseUrl}/booking/transportasi/update/${code}?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'status': status,
        'gateway': gateWay,
      },
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MakananMinumanUMKMCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? items,
  }) {
    final itemsData = _serializeJson(items);

    return ApiManager.instance.makeApiCall(
      callName: 'Makanan Minuman UMKM',
      apiUrl: '${BookingHandlerGroup.baseUrl}/booking/food-beverage',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'items': itemsData,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PaymentMakananMinumanUMKMCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? code = '',
    String? status = '',
    String? gateway = '',
    String? notes = '',
    String? line1 = '',
    String? line2 = '',
    String? latitude = '',
    String? shippingType = '',
    String? longtitude = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment Makanan Minuman UMKM',
      apiUrl:
          '${BookingHandlerGroup.baseUrl}/booking/food-beverage/update/${code}?_method=PUT',
      callType: ApiCallType.POST,
      headers: {
        ...BookingHandlerGroup.headers,
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'status': status,
        'gateway': gateway,
        'notes': notes,
        'line1': line1,
        'line2': line2,
        'latitude': latitude,
        'shipping_type': shippingType,
        'longtitude': longtitude,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Booking Handler Group Code

/// Start Payment Gateway Group Code

class PaymentGatewayGroup {
  static String baseUrl = 'https://pg.kabtour.com/v2';
  static Map<String, String> headers = {};
  static ApiPaymentCall apiPaymentCall = ApiPaymentCall();
}

class ApiPaymentCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Api payment',
      apiUrl: '${PaymentGatewayGroup.baseUrl}/payment-channel',
      callType: ApiCallType.GET,
      headers: {
        ...PaymentGatewayGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Payment Gateway Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
