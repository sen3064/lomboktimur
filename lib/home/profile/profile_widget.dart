import 'dart:io';

import 'package:get/get.dart';
import 'package:kelotimaja/backend/api_requests/api_calls.dart';
import 'package:kelotimaja/backend/api_requests/api_manager.dart';
import 'package:kelotimaja/index.dart';
import 'package:kelotimaja/signup_signin_setup/login_page/login_page_widget.dart';
import 'package:kelotimaja/theme.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'profile_model.dart';
export 'profile_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:kelotimaja/flutter_flow/upload_data.dart';
import 'package:kelotimaja/flutter_flow/uploaded_file.dart';

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/cupertino.dart'; ini model scroll

class ProfileWidget extends StatefulWidget {
  final Function(String) onImageSelected;
  const ProfileWidget({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;
  final ImagePicker _picker = ImagePicker();
  String? _pickedImageUrl;
  late DateTime selectedDate;

  String? selectedGender;
  List<String> genderOptions = ['Laki-laki', 'Perempuan'];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading1 = false;
  @override
  void initState() {
    super.initState();
    selectedGender =
        selectedGender = FFAppState().userData['gender'] as String?;
    if (selectedGender == null) {
      // Atur nilai default jika gender awalnya null
      selectedGender =
          'Belum diatur'; // Atau nilai default lain sesuai kebutuhan
    }
    // Creating a model using the `createModel` function
    _model = createModel(context, () => ProfileModel());

    // Initializing focus nodes for text fields
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode4 ??= FocusNode();
    _model.textFieldFocusNode5 ??= FocusNode();

    // Load image URL during initialization
    loadImageUrl();

    loadSelectedDate();
    setState(() {
      print('selectedGender in initState: $selectedGender');
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String? getExistingGender() {
    // Gantilah dengan cara Anda mendapatkan gender yang sudah ada
    // Misalnya, dari data pengguna, penyimpanan lokal, atau API
    // Contoh: return 'Laki-laki';
    // return null; // Jika belum ada gender yang tersimpan
    return FFAppState().userData['gender'];
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

  Future<void> _handlePickedImage(
      BuildContext context, XFile pickedFile) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      if (appDir != null) {
        final fileName = path.basename(pickedFile.path);
        pickedFile.saveTo('${appDir.path}/$fileName');

        setState(() {
          _pickedImageUrl = '${appDir.path}/$fileName';
        });

        // Save image URL to SharedPreferences
        saveImageUrlToSharedPreferences(_pickedImageUrl!);

        // Call the callback to notify the parent widget (SettingProfileWidget)
        widget.onImageSelected(_pickedImageUrl!);
      }
    } catch (e) {
      print('Error handling picked image: $e');
    }
  }

  Future<void> saveImageUrlToSharedPreferences(String imageUrl) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userImageUrl', imageUrl);
  }

  Future<void> loadImageUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? imageUrl = prefs.getString('userImageUrl');

    if (imageUrl != null) {
      setState(() {
        _pickedImageUrl = imageUrl;
      });
    }
  }

  Future<void> loadSelectedDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedDate = prefs.getString('selectedDate');
    if (FFAppState().userData['birthday'] != null) {
      savedDate = FFAppState().userData['birthday'];
    }
    if (savedDate != null) {
      setState(() {
        selectedDate = DateTime.parse(savedDate!);
      });
    } else {
      setState(() {
        selectedDate = DateTime.now();
      });
    }
  }

  Future<void> saveSelectedDate(DateTime date) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedDate', date.toIso8601String());
  }

  Future<void> showDatePickerDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      saveSelectedDate(pickedDate);
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    print(FFAppState().userDataChat);
    print(FFAppState().userData);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 54,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primary,
              size: 24,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 50),
                      child: FutureBuilder<ApiCallResponse>(
                        future: UserGroup.userProfileCall.call(
                          accessToken: FFAppState().accessToken,
                          uid: getJsonField(
                            FFAppState().userData,
                            r'''$.id''',
                          ).toString(),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).tertiary400,
                                  ),
                                ),
                              ),
                            );
                          }
                          final columnUserProfileResponse = snapshot.data!;
                          if (columnUserProfileResponse == null) {
                            // Navigasi ke halaman login
                            Get.offAll(() => LoginPageWidget());
                            // Kembalikan widget loading atau sesuatu yang sesuai dengan kebutuhan Anda.
                          }
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() {
                                        isDataUploading1 = true;
                                      });
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();
                                      } finally {
                                        setState(
                                            () => isDataUploading1 = false);
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          uploadedLocalFile1 =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: Container(
                                            width: 120,
                                            height: 120,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: uploadedLocalFile1.name !=
                                                    null
                                                ? Image.memory(
                                                    uploadedLocalFile1.bytes!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.network(
                                                    getJsonField(
                                                      FFAppState().userData,
                                                      r'''$.avatar''',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Nama',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 12, 0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1 ??=
                                                        TextEditingController(
                                                  text: getJsonField(
                                                        columnUserProfileResponse
                                                            .jsonBody,
                                                        r'''$.name''',
                                                      )?.toString() ??
                                                      '',
                                                ),
                                                focusNode:
                                                    _model.textFieldFocusNode1,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeFamily),
                                                          ),
                                                  hintText: 'Nama',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
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
                                      0, 0, 0, 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Alamat Email',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 12, 0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2 ??=
                                                        TextEditingController(
                                                  text: getJsonField(
                                                        columnUserProfileResponse
                                                            .jsonBody,
                                                        r'''$.email''',
                                                      )?.toString() ??
                                                      '',
                                                ),
                                                focusNode:
                                                    _model.textFieldFocusNode2,
                                                autofocus: true,
                                                readOnly: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeFamily),
                                                          ),
                                                  hintText: 'Alamat Email',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
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
                                      0, 0, 0, 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RichText(
                                                textScaleFactor:
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'No.Handphone',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    ),
                                                    TextSpan(
                                                      text: '*',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 12, 0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController3 ??=
                                                        TextEditingController(
                                                  text: getJsonField(
                                                        columnUserProfileResponse
                                                            .jsonBody,
                                                        r'''$.phone''',
                                                      )?.toString() ??
                                                      '',
                                                ),
                                                focusNode:
                                                    _model.textFieldFocusNode3,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeFamily),
                                                          ),
                                                  hintText: 'No.handphone',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                                keyboardType:
                                                    TextInputType.phone,
                                                validator: _model
                                                    .textController3Validator
                                                    .asValidator(context),
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
                                      0, 0, 0, 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RichText(
                                                textScaleFactor:
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'No. KTP',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    ),
                                                    TextSpan(
                                                      text: '*',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 12, 0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController4 ??=
                                                        TextEditingController(
                                                  text: getJsonField(
                                                        columnUserProfileResponse
                                                            .jsonBody,
                                                        r'''$.nik''',
                                                      )?.toString() ??
                                                      '',
                                                ),
                                                focusNode:
                                                    _model.textFieldFocusNode4,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLargeFamily),
                                                          ),
                                                  hintText: 'No. KTP',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                                keyboardType:
                                                    TextInputType.phone,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       0, 0, 0, 20),
                                //   child: SingleChildScrollView(
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.max,
                                //       children: [
                                //         Padding(
                                //           padding:
                                //               EdgeInsetsDirectional.fromSTEB(
                                //                   10, 0, 10, 0),
                                //           child: Row(
                                //             mainAxisSize: MainAxisSize.max,
                                //             children: [
                                //               RichText(
                                //                 textScaleFactor:
                                //                     MediaQuery.of(context)
                                //                         .textScaleFactor,
                                //                 text: TextSpan(
                                //                   children: [
                                //                     TextSpan(
                                //                       text: 'Gender',
                                //                       style:
                                //                           FlutterFlowTheme.of(
                                //                                   context)
                                //                               .titleMedium,
                                //                     ),
                                //                     TextSpan(
                                //                       text: '*',
                                //                       style:
                                //                           FlutterFlowTheme.of(
                                //                                   context)
                                //                               .titleMedium,
                                //                     )
                                //                   ],
                                //                   style: FlutterFlowTheme.of(
                                //                           context)
                                //                       .titleMedium
                                //                       .override(
                                //                         fontFamily:
                                //                             FlutterFlowTheme.of(
                                //                                     context)
                                //                                 .titleMediumFamily,
                                //                         fontWeight:
                                //                             FontWeight.w500,
                                //                         useGoogleFonts: GoogleFonts
                                //                                 .asMap()
                                //                             .containsKey(
                                //                                 FlutterFlowTheme.of(
                                //                                         context)
                                //                                     .titleMediumFamily),
                                //                       ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //         Padding(
                                //           padding:
                                //               EdgeInsetsDirectional.fromSTEB(
                                //                   0, 5, 0, 5),
                                //           child: Container(
                                //             width: double.infinity,
                                //             decoration: BoxDecoration(
                                //               color:
                                //                   FlutterFlowTheme.of(context)
                                //                       .tertiary,
                                //               borderRadius:
                                //                   BorderRadius.circular(21),
                                //             ),
                                //             child: Padding(
                                //               padding: EdgeInsetsDirectional
                                //                   .fromSTEB(12, 0, 12, 0),
                                //               child: TextFormField(
                                //                 controller:
                                //                     _model.textController5 ??=
                                //                         TextEditingController(
                                //                   text: getJsonField(
                                //                         columnUserProfileResponse
                                //                             .jsonBody,
                                //                         r'''$.gender''',
                                //                       )?.toString() ??
                                //                       '',
                                //                 ),
                                //                 focusNode:
                                //                     _model.textFieldFocusNode5,
                                //                 obscureText: false,
                                //                 decoration: InputDecoration(
                                //                   labelStyle:
                                //                       FlutterFlowTheme.of(
                                //                               context)
                                //                           .bodyLarge
                                //                           .override(
                                //                             fontFamily:
                                //                                 FlutterFlowTheme.of(
                                //                                         context)
                                //                                     .bodyLargeFamily,
                                //                             fontWeight:
                                //                                 FontWeight.w500,
                                //                             useGoogleFonts: GoogleFonts
                                //                                     .asMap()
                                //                                 .containsKey(
                                //                                     FlutterFlowTheme.of(
                                //                                             context)
                                //                                         .bodyLargeFamily),
                                //                           ),
                                //                   hintText: 'Gender',
                                //                   hintStyle: FlutterFlowTheme
                                //                           .of(context)
                                //                       .bodyLarge
                                //                       .override(
                                //                         fontFamily:
                                //                             FlutterFlowTheme.of(
                                //                                     context)
                                //                                 .bodyLargeFamily,
                                //                         color:
                                //                             FlutterFlowTheme.of(
                                //                                     context)
                                //                                 .secondary,
                                //                         fontWeight:
                                //                             FontWeight.w500,
                                //                         useGoogleFonts: GoogleFonts
                                //                                 .asMap()
                                //                             .containsKey(
                                //                                 FlutterFlowTheme.of(
                                //                                         context)
                                //                                     .bodyLargeFamily),
                                //                       ),
                                //                   enabledBorder:
                                //                       InputBorder.none,
                                //                   focusedBorder:
                                //                       InputBorder.none,
                                //                   errorBorder: InputBorder.none,
                                //                   focusedErrorBorder:
                                //                       InputBorder.none,
                                //                 ),
                                //                 style:
                                //                     FlutterFlowTheme.of(context)
                                //                         .titleMedium,
                                //                 keyboardType:
                                //                     TextInputType.text,
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RichText(
                                                textScaleFactor:
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Jenis Kelamin',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    ),
                                                    TextSpan(
                                                      text: '*',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 12, 0),
                                              child: DropdownButton<String>(
                                                value: selectedGender,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedGender = newValue;
                                                  });
                                                },
                                                items: genderOptions.map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Text(
                                //     'Jenis Kelamin: ${selectedGender ?? "Belum dipilih"}'),
                                // SizedBox(height: 20),

                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RichText(
                                                textScaleFactor:
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Tanggal Lahir',
                                                      style: bold16.copyWith(
                                                          color: dark1),
                                                    ),
                                                    TextSpan(
                                                      text: '*',
                                                      style: bold16.copyWith(
                                                          color: red1),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDatePickerDialog();
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 5),
                                            child: GestureDetector(
                                              onTap: () {
                                                showDatePickerDialog();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(21),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 15, 10, 15),
                                                  child: Text(
                                                    '${DateFormat.yMMMMd('id_ID').format(selectedDate)}',
                                                    style: semibold14.copyWith(
                                                        color: dark1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        // TextFormField(
                                        //   controller: _model
                                        //       .textController4, // Ganti yourTextController dengan TextEditingController yang sesuai
                                        //   decoration: InputDecoration(
                                        //     // labelText: 'Pilih Tanggal',
                                        //     border: OutlineInputBorder(
                                        //       borderRadius:
                                        //           BorderRadius.circular(21),
                                        //     ),
                                        //   ),
                                        //   readOnly: true,
                                        //   onTap: () async {
                                        //     await showDatePickerDialog();
                                        //     // Pastikan untuk memanggil setState setelah pemilihan tanggal
                                        //     setState(() {});
                                        //   },
                                        //   keyboardType: TextInputType.datetime,
                                        //   textInputAction: TextInputAction.done,
                                        //   style:
                                        //       semibold14.copyWith(color: dark1),
                                        //   initialValue: DateFormat('yyyy-MM-dd')
                                        //       .format(selectedDate),
                                        // ),

                                        // ini model scroll

                                        // SingleChildScrollView(
                                        //   child: Column(
                                        //     mainAxisSize: MainAxisSize.max,
                                        //     children: [
                                        //       Row(
                                        //         mainAxisSize: MainAxisSize.max,
                                        //         children: [
                                        //           RichText(
                                        //             textScaleFactor:
                                        //                 MediaQuery.of(context)
                                        //                     .textScaleFactor,
                                        //             text: TextSpan(
                                        //               children: [
                                        //                 TextSpan(
                                        //                   text: "Tanggal Lahir",
                                        //                   style:
                                        //                       bold16.copyWith(
                                        //                           color: dark1),
                                        //                 ),
                                        //                 TextSpan(
                                        //                   text: "*",
                                        //                   style:
                                        //                       bold16.copyWith(
                                        //                           color: red1),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       SizedBox(
                                        //         height: 10,
                                        //       ),
                                        //       Container(
                                        //         width: double.infinity,
                                        //         decoration: BoxDecoration(
                                        //           color: dark4,
                                        //           borderRadius:
                                        //               BorderRadius.circular(21),
                                        //         ),
                                        //         child: Padding(
                                        //           padding: EdgeInsetsDirectional
                                        //               .fromSTEB(12, 0, 12, 0),
                                        //           child: InkWell(
                                        //             onTap: () {
                                        //               print(
                                        //                   "Tapped on InkWell");
                                        //               showCupertinoModalPopup(
                                        //                 context: context,
                                        //                 builder: (BuildContext
                                        //                     context) {
                                        //                   return Container(
                                        //                     height: 250,
                                        //                     decoration:
                                        //                         BoxDecoration(
                                        //                       color:
                                        //                           Colors.white,
                                        //                     ),
                                        //                     child: Column(
                                        //                       children: [
                                        //                         Row(
                                        //                           mainAxisAlignment:
                                        //                               MainAxisAlignment
                                        //                                   .spaceBetween,
                                        //                           children: [
                                        //                             CupertinoButton(
                                        //                               onPressed:
                                        //                                   () {
                                        //                                 Navigator.of(context)
                                        //                                     .pop();
                                        //                               },
                                        //                               child:
                                        //                                   Text(
                                        //                                 'Cancel',
                                        //                                 style:
                                        //                                     TextStyle(
                                        //                                   color:
                                        //                                       Colors.red,
                                        //                                 ),
                                        //                               ),
                                        //                             ),
                                        //                             CupertinoButton(
                                        //                               onPressed:
                                        //                                   () {
                                        //                                 Navigator.of(context)
                                        //                                     .pop(selectedDate);
                                        //                               },
                                        //                               child: Text(
                                        //                                   'Done'),
                                        //                             ),
                                        //                           ],
                                        //                         ),
                                        //                         Expanded(
                                        //                           child:
                                        //                               CupertinoDatePicker(
                                        //                             mode: CupertinoDatePickerMode
                                        //                                 .date,
                                        //                             initialDateTime:
                                        //                                 selectedDate,
                                        //                             onDateTimeChanged:
                                        //                                 (DateTime
                                        //                                     newDate) {
                                        //                               setState(
                                        //                                   () {
                                        //                                 selectedDate =
                                        //                                     newDate;
                                        //                               });
                                        //                             },
                                        //                           ),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                   );
                                        //                 },
                                        //               );
                                        //             },
                                        // child: Text(
                                        //   'Selected Date: ${DateFormat('MMMM d, y').format(selectedDate)}\nBirthday: ${getJsonField(
                                        //         columnUserProfileResponse
                                        //             .jsonBody,
                                        //         r'''$.birthday''',
                                        //       )?.toString() ?? ''}',
                                        // ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 100, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      // print(uploadedLocalFile1.bytes!.length);
                                      print('selectedDate: $selectedDate');
                                      _model.apiResult0e56789 = await UserGroup
                                          .userProfileEditCall
                                          .call(
                                        accessToken: FFAppState().accessToken,
                                        uid: getJsonField(FFAppState().userData,
                                                r'''$.id''')
                                            .toString(),
                                        avatar: uploadedLocalFile1,
                                        name: _model.textController1.text,
                                        email: _model.textController2.text,
                                        phone: _model.textController3.text,
                                        nik: _model.textController4.text,
                                        // gender: _model.textController5.text,
                                        gender: selectedGender,
                                        // birthday: '1994-11-10',
                                        birthday: DateFormat('yyyy-MM-dd')
                                            .format(selectedDate),
                                      );
                                      print(
                                          'userdata: ${_model.apiResult0e56789!.jsonBody}');
                                      if ((_model.apiResult0e56789?.succeeded ??
                                          true)) {
                                        // Map<String, dynamic> chatAccount =
                                        //     FFAppState()
                                        //         .userData['chat_account'];
                                        // FFAppState().userData = _model
                                        //     .apiResult0e56789!.jsonBody['user'];
                                        // FFAppState().userData['chat_account'] =
                                        //     chatAccount;
                                        Get.defaultDialog(
                                          title: "Sukses",
                                          middleText: "Profil berhasil di ubah",
                                          onConfirm: () => Get.off(
                                              () => SettingProfileWidget()),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Tidak boleh kosong',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                      setState(() {});
                                    },
                                    text: 'Simpan',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(21),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
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
