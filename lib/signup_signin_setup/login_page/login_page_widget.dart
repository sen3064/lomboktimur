import 'package:get/get.dart';
import 'package:kolaka/core/constants/constant.dart';
import 'package:kolaka/core/helpers/auth_helper.dart';
import 'package:kolaka/core/services/api_client.dart';
import 'package:kolaka/home/home_page/home_page_widget.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/forgot_reset_password/forgot_password/forgot_password_widget.dart';
import '/main.dart';
import '/onboarding/auth_page/auth_page_widget.dart';
import '/signup_signin_setup/daftar/daftar_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  ApiClient apiClient = Get.isRegistered<ApiClient>()
      ? Get.find<ApiClient>()
      : Get.put(ApiClient());
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    apiClient.init();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> loginWithGoogleAndSendData() async {
    try {
      // final GoogleSignInAccount? googleSignInAccount =
      //     await _googleSignIn.signIn();
      AuthProvider authProvider = AuthProvider();

      // Panggil fungsi loginWithGoogle
      await authProvider.loginWithGoogle();

      // Setelah login, dapatkan informasi pengguna jika diperlukan
      GoogleSignInAccount? currentUser = authProvider.currentUser;

      if (currentUser != null) {
        // Jika login berhasil, kirim data ke API
        var response = await http.post(
          Uri.parse("https://user-api.kolaka.kabtour.com/v2/login-google"),
          body: {
            'email': currentUser.email,
            'name': currentUser.displayName,
            'social_id': currentUser.id,
            'avatar': currentUser.photoUrl,
            'role_id': '2',
          },
        );

        print('ini google login : ${response.body}');

        if (response.statusCode == 200) {
          // Jika response 200, berarti login berhasil, lanjutkan ke halaman home_page
          // Navigator.pushReplacementNamed(context, '/home_page');

          print(response.body);
          final _parsed = jsonDecode(response.body);
          print(_parsed);
          FFAppState().accessToken = _parsed["access_token"].toString();
          FFAppState().uid = jsonEncode(_parsed["user"]["id"]);
          FFAppState().userData = _parsed["user"];

          userStorage.write('login_provider', 'google');
          print(FFAppState().accessToken);
          print(FFAppState().uid);
          print(FFAppState().userData);

          final data = await FFAppState().userData;
          // chat online
          Map<String, dynamic>? chatAccount = userStorage.read('chat_account');
          if (chatAccount == null ||
              chatAccount.isEmpty ||
              !chatAccount['success']) {
            String chatUname = data['first_name'];
            String tempLast = data['last_name'] ?? '';
            if (tempLast.isNotEmpty) {
              tempLast = tempLast.replaceAll(' ', '-');
            }
            chatUname = '$chatUname.$tempLast';
            Map<String, dynamic> params = {
              'api_secret_key': chatApiSecretKey,
              'add': 'login_session',
              'email_address': data['email'],
              'full_name': data['name'],
              'username': chatUname,
              'password': '12345678',
              'create_account': 'yes'
            };
            print('Param kirim: $params');
            chatAccount = await apiClient.post(
                'https://chat.kolaka.kabtour.com/api_request/',
                data: params);
            print('akun chat: $chatAccount');
            chatAccount = jsonDecode(chatAccount['body']);
            if (chatAccount!['success']) {
              print('abis if: $chatAccount');
              data['body'] = chatAccount;
              FFAppState().userDataChat = chatAccount;
            }
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavBarPage(initialPage: 'Home_Page'),
            ),
          );
        } else {
          // Handle error jika response tidak 200
          print('Login gagal. Silakan coba lagi.');
        }
      } else {
        // Handle error jika login dengan Google gagal
        print('Login dengan Google dibatalkan.');
      }
    } catch (error) {
      // Handle error lainnya, seperti tidak ada koneksi internet
      print('Terjadi kesalahan: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return WillPopScope(
      onWillPop: () async {
        if (Get.arguments == 'profile' || Get.arguments == 'chat') {
          Get.off(() => NavBarPage(initialPage: 'Home_Page'));
        } else {
          Get.off(() => NavBarPage(initialPage: 'Home_Page'));
        }
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 24,
              ),
              onPressed: () async {
                if (Get.arguments == 'profile') {
                  Get.off(() => NavBarPage(initialPage: 'Home_Page'));
                } else {
                  Get.off(() => NavBarPage(initialPage: 'Home_Page'));
                }
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'Kelotimaja',
                            style: FlutterFlowTheme.of(context).displaySmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Text(
                            'Selamat Datang\ndi aplikasi wisata Kabupaten Lombok Timur',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.emailAddressController,
                              autofocus: false,
                              autofillHints: [AutofillHints.email],
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.emailAddressControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.passwordController,
                              autofillHints: [AutofillHints.password],
                              obscureText: !_model.passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Kata Sandi',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x0059BCD2),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordVisibility =
                                        !_model.passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 20,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                              validator: _model.passwordControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Reset kata sandi',
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 20),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.apiResultb5r =
                                  await UserGroup.userLoginCall.call(
                                email: _model.emailAddressController.text,
                                password: _model.passwordController.text,
                              );
                              if ((_model.apiResultb5r?.succeeded ?? true)) {
                                FFAppState().accessToken =
                                    UserGroup.userLoginCall
                                        .accessToken(
                                          (_model.apiResultb5r?.jsonBody ?? ''),
                                        )
                                        .toString();
                                FFAppState().uid = UserGroup.userLoginCall
                                    .userId(
                                      (_model.apiResultb5r?.jsonBody ?? ''),
                                    )
                                    .toString();
                                FFAppState().userData =
                                    UserGroup.userLoginCall.userUsr(
                                  (_model.apiResultb5r?.jsonBody ?? ''),
                                );
                                await AuthHelper.setUserStorage(
                                    {'user': FFAppState().userData});
                                // print(
                                //     'user data: ${FFAppState().userData['user_role']}');
                                final data = await FFAppState().userData;
                                // chat online

                                Map<String, dynamic>? chatAccount =
                                    userStorage.read('chat_account');
                                // print(chatAccount);
                                if (chatAccount == null ||
                                    chatAccount.isEmpty ||
                                    !chatAccount['success']) {
                                  String chatUname = data['first_name'];
                                  String tempLast = data['last_name'] ?? '';
                                  if (tempLast.isNotEmpty) {
                                    tempLast = tempLast.replaceAll(' ', '-');
                                  }
                                  chatUname = '$chatUname.$tempLast';
                                  Map<String, dynamic> params = {
                                    'api_secret_key': chatApiSecretKey,
                                    'add': 'login_session',
                                    'email_address': data['email'],
                                    'full_name': data['name'],
                                    'username': chatUname,
                                    'password': '12345678',
                                    'create_account': 'yes'
                                  };
                                  // print('Param kirim: $params');
                                  chatAccount = await apiClient.post(
                                      'https://chat.kolaka.kabtour.com/api_request/',
                                      data: params);
                                  // print('akun chat: $chatAccount');
                                  chatAccount = jsonDecode(chatAccount['body']);

                                  // print('akun chat: ${chatAccount}');
                                  if (chatAccount!['success']) {
                                    // print('abis if: $chatAccount');
                                    data['chat_account'] = chatAccount;
                                    FFAppState().userDataChat = chatAccount;
                                    print(FFAppState().userDataChat);
                                  }
                                }
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'Home_Page'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Email atau Password Salah',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            text: 'Masuk',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: FlutterFlowTheme.of(context).accent1,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Container(
                            width: 370,
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 12),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 120,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Atau',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    // onTap: () async {
                                    //   final user = await authManager
                                    //       .signInWithGoogle(context);
                                    //   if (user == null) {
                                    //     return;
                                    //   }
                                    //   await Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => NavBarPage(
                                    //           initialPage: 'Home_Page'),
                                    //     ),
                                    //     (r) => false,
                                    //   );
                                    // },
                                    // onTap: () => loginWithGoogleAndSendData(),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Container(
                                          width: 230,
                                          height: 44,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    loginWithGoogleAndSendData();
                                                    // final user =
                                                    //     await authManager
                                                    //         .signInWithGoogle(
                                                    //             context);
                                                    // if (user == null) {
                                                    //   return;
                                                    // }
                                                    // await Navigator
                                                    //     .pushAndRemoveUntil(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //     builder: (context) =>
                                                    //         NavBarPage(
                                                    //             initialPage:
                                                    //                 'Home_Page'),
                                                    //   ),
                                                    //   (r) => false,
                                                    // );
                                                  },
                                                  text: 'Masuk dengan google',
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.transparent,
                                                    size: 20,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 230,
                                                    height: 44,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 8, 0),
                                                    color: Colors.white,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 4,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            21),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.83, 0),
                                                child: Container(
                                                  width: 22,
                                                  height: 22,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // You will have to add an action on this rich text to go to your login page.
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 12),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Tidak punya akun?  ',
                                style: FlutterFlowTheme.of(context).titleSmall,
                              ),
                              TextSpan(
                                text: 'Daftar',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DaftarWidget(),
                                      ),
                                    );
                                  },
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
