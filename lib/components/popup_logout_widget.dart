import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kelotimaja/auth/base_auth_user_provider.dart';
import 'package:kelotimaja/core/constants/storage.dart';
import 'package:kelotimaja/core/helpers/auth_helper.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/signup_signin_setup/login_page/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_logout_model.dart';
export 'popup_logout_model.dart';

class PopupLogoutWidget extends StatefulWidget {
  const PopupLogoutWidget({Key? key}) : super(key: key);

  @override
  _PopupLogoutWidgetState createState() => _PopupLogoutWidgetState();
}

class _PopupLogoutWidgetState extends State<PopupLogoutWidget> {
  late PopupLogoutModel _model;
  // GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthProvider _authProvider = AuthProvider();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupLogoutModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: 230.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 3.0,
                        indent: 150.0,
                        endIndent: 150.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 16.0, 0.0),
                              child: Text(
                                'Yakin mau keluar?',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Apakah Anda yakin ingin keluar dari akun Anda?',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 30.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.apiResultknw =
                                    await UserGroup.userLogoutCall.call(
                                  accessToken: FFAppState().accessToken,
                                );
                                print(
                                    'model api result: ${_model.apiResultknw}');
                                if ((_model.apiResultknw?.succeeded ?? true)) {
                                  FFAppState().accessToken = '';
                                  FFAppState().userData = null;

                                  // Mendapatkan instance GoogleSignIn
                                  // final GoogleSignIn _googleSignIn =
                                  //     GoogleSignIn();

                                  // // Mendapatkan informasi user yang saat ini login
                                  // final GoogleSignInAccount? currentUser =
                                  //     _googleSignIn.currentUser;
                                  // print('current user: $currentUser');
                                  // // Memeriksa apakah user sedang login dengan Google
                                  // if (currentUser != null) {
                                  //   // Melakukan sign-out dari Google
                                  //   await _googleSignIn.signOut();
                                  //   print('Google user signed out');
                                  // }

                                  await _authProvider.signOutGoogle();

                                  // Navigasi ke halaman login setelah logout
                                  await Get.to(() => LoginPageWidget());
                                }

                                // setState(() {});
                              },
                              text: 'Log out',
                              options: FFButtonOptions(
                                width: 300.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).accent1,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ],
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
    );
  }
}
