import 'package:kolaka/backend/api_requests/api_calls.dart';
import 'package:kolaka/components/pilih_lokasi_widget.dart';
import 'package:kolaka/components/webview_dua_screen.dart';
import 'package:kolaka/components/webview_screen.dart';
import 'package:kolaka/core/services/api_client.dart';
import 'package:kolaka/forgot_reset_password/change_password/change_password_widget.dart';
import 'package:kolaka/home/setting_profile/rekening/rekening_screen.dart';
import 'package:kolaka/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import '/components/popup_logout_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/forgot_reset_password/new_password/new_password_widget.dart';
import '/home/profile/profile_widget.dart';
import '/signup_signin_setup/login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'setting_profile_model.dart';
export 'setting_profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SettingProfileWidget extends StatefulWidget {
  const SettingProfileWidget({Key? key}) : super(key: key);

  @override
  _SettingProfileWidgetState createState() => _SettingProfileWidgetState();
}

class _SettingProfileWidgetState extends State<SettingProfileWidget> {
  ApiClient apiClient = Get.isRegistered<ApiClient>()
        ? Get.find<ApiClient>()
        : Get.put(ApiClient());
  late SettingProfileModel _model;
  late ImagePicker _picker;
  String? _pickedImageUrl;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingProfileModel());
    _picker = ImagePicker(); // Initialize the ImagePicker

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().userData == null) {
        print(userStorage);
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => LoginPageWidget(),
        //   ),
        // );
        await Get.to(() => LoginPageWidget(), arguments: 'profile');
      }
    });
  }

  Future<void> _pickImage() async {
    try {
      final BuildContext context = scaffoldKey.currentContext!;
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _handlePickedImage(context, pickedFile);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> saveImageUrlToSharedPreferences(String imageUrl) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userImageUrl', imageUrl);
  }

  Future<void> _handlePickedImage(
      BuildContext context, XFile pickedFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      if (appDir != null) {
        final fileName = path.basename(pickedFile.path);

        // Debugging: Print file path before saving
        print('File path before saving: ${pickedFile.path}');

        await pickedFile.saveTo('${appDir.path}/$fileName');

        // Debugging: Print file path after saving
        print('File path after saving: ${appDir.path}/$fileName');

        setState(() {
          _pickedImageUrl = '${appDir.path}/$fileName';
        });

        // Debugging: Print _pickedImageUrl after setState
        print('Picked image URL after setState: $_pickedImageUrl');

        // Simpan URL gambar ke SharedPreferences
        print('Updated picked image URL: $_pickedImageUrl');
        saveImageUrlToSharedPreferences(_pickedImageUrl!);
      }
    } catch (e) {
      print('Error handling picked image: $e');
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    print(FFAppState().userData['user_wallet']['balance']);
    return WillPopScope(
      onWillPop: () async {
        await Get.to(() => NavBarPage(initialPage: 'Home_Page'));
        return true; // Allow pop
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: Container(
                                        width: 300,
                                        height: 549.3,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: _pickedImageUrl != null
                                              ? Image.file(
                                                  File(_pickedImageUrl!),
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      FFAppState().userData,
                                                      r'''$.avatar''',
                                                    ),
                                                    'https://woodfibreinsulation.co.uk/wp-content/uploads/2017/04/blank-profile-picture-973460-1-1-1080x1080.png',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),

                                      // Padding(
                                      //   padding: EdgeInsetsDirectional.fromSTEB(
                                      //       0, 20, 0, 0),
                                      //   child: Container(
                                      //     width: 90,
                                      //     height: 90,
                                      //     clipBehavior: Clip.antiAlias,
                                      //     decoration: BoxDecoration(
                                      //       shape: BoxShape.circle,
                                      //     ),
                                      //     child: Image.network(
                                      //       valueOrDefault<String>(
                                      //         getJsonField(
                                      //           FFAppState().userData,
                                      //           r'''$.avatar''',
                                      //         ),
                                      //         'https://woodfibreinsulation.co.uk/wp-content/uploads/2017/04/blank-profile-picture-973460-1-1-1080x1080.png',
                                      //       ),
                                      //       fit: BoxFit.cover,
                                      //     ),
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Text(
                                          getJsonField(
                                            FFAppState().userData,
                                            r'''$.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Text(
                                          getJsonField(
                                            FFAppState().userData,
                                            r'''$.email''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Personal Info',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        fontSize: 18,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              FFIcons.kemptyWallet,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () =>
                                      Get.to(() => const RekeningScreen()),
                                                  child: Text(
                                                    'Dompet Saya  ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Text(
                                                'Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(int.parse(FFAppState().userData['user_wallet']['balance'] ?? '0'))}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .accent1,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              FFIcons.ktagUser,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProfileWidget(
                                                          onImageSelected:
                                                              (String) {},
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    'Edit Profile',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfileWidget(
                                                        onImageSelected:
                                                            (imageUrl) {
                                                          // Handle the selected image URL in this function
                                                          setState(() {
                                                            _pickedImageUrl =
                                                                imageUrl;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              FFIcons.klock1,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChangePasswordWidget(),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    'Ubah Kata Sandi',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChangePasswordWidget(),
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: PilihLokasiWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                FFIcons.klocationAdd,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Pengaturan Alamat',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 30, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'General',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        fontSize: 18,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: InkWell(
                                          onTap: () async => await launchUrl(
                                              Uri.parse(
                                                  "mailto:${Uri.encodeComponent("helpdesk@kabtour.com")}")),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.headset_mic,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Layanan',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: InkWell(
                                          onTap: () => Get.to(
                                              () => WebViewDuaScreen(),
                                              arguments: {
                                                'title': 'Privacy-Policy',
                                                'url':
                                                    'https://kolaka.kabtour.com/page/privacy-policy'
                                              }),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.security,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Privacy Policy',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: InkWell(
                                          onTap: () => Get.to(
                                              () => WebViewDuaScreen(),
                                              arguments: {
                                                'title': 'Syarat dan Ketentuan',
                                                'url':
                                                    'https://kolaka.kabtour.com/page/terms-of-use'
                                              }),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.task_sharp,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Syarat dan Ketentuan',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: InkWell(
                                          onTap: () => Get.defaultDialog(
                                            title: "Tentang Aplikasi",
                                            middleText:
                                                "Aplikasi untuk Wisatawan di Kabupaten Kolaka, memungkinkan untuk menggunakan produk dan layanan dalam skala yang lebih luas dan menjangkau lebih banyak produk potensial. Menjembatani kesenjangan antara online dan offline dalam industri pariwisata. Aplikasi Kolaka membantu pemasok untuk online dan menambah nilai melalui memperluas jangkauan pelanggan secara online. Pusat informasi pariwisata menyediakan informasi tentang sorotan destinasi dan tempat wisata di Kabupaten Kolaka. Memungkinkan wisatawan untuk berbagi pengalaman nyata mereka.",
                                            onConfirm: () => Get.back(),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.verified,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Version',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: Text(
                                                      '1.0.17',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                fontSize: 14,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: PopupLogoutWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                            // await Get.defaultDialog(
                                            //     title: 'Konfirmasi',
                                            //     middleText:
                                            //         'Yakin ingin Keluar?',
                                            //     onConfirm: () async {
                                            //       _model.apiResultknw =
                                            //           await UserGroup
                                            //               .userLogoutCall
                                            //               .call(
                                            //         accessToken: FFAppState()
                                            //             .accessToken,
                                            //       );
                                            //       if ((_model.apiResultknw
                                            //               ?.succeeded ??
                                            //           true)) {
                                            //         FFAppState().accessToken =
                                            //             '';
                                            //         FFAppState().userData =
                                            //             null;
                                            //         await Get.off(LoginPageWidget());
                                            //       }

                                            //       setState(() {});
                                            //     });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.klogout1,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  'Log out',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
