import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/components/reusable_appbar.dart';
import 'package:kelotimaja/core/controllers/auth_controller.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_theme.dart';
import 'package:kelotimaja/flutter_flow/flutter_flow_widgets.dart';
import 'package:kelotimaja/home/setting_profile/user_controller.dart';

class VerificationWaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool isExit = await Get.defaultDialog(
            title: 'Konfirmasi',
            middleText: 'Apakah Anda yakin ingin keluar dari aplikasi?',
            onConfirm: () => Get.back(result: true),
            onCancel: () => Get.back(result: false));
        if (isExit) {
          exit(0);
        }
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: const ReusableAppBar(
          title: 'Menunggu Verifikasi',
          centerTitle: true,
        ),
        body: SafeArea(
            top: true,
            child: // Generated code for this Column Widget...
                Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 5, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/Untitled-2.png',
                                width: 357.5,
                                height: 208.9,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 40, 20, 20),
                              child: Text(
                                'Kirim Dokumen Sukses',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, -1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 0, 20, 20),
                              child: Text(
                                'Mohon menunggu verifikasi.\nKami akan memberitahukan hasil verifikasi melalui email.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 00.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                UserController userController =
                                    Get.isRegistered<UserController>()
                                        ? Get.find<UserController>()
                                        : Get.put(UserController());
                                bool isConfirm = await Get.defaultDialog(
                                    middleText: "Yakin ingin keluar?",
                                    onCancel: () => Get.back(result: false),
                                    onConfirm: () => Get.back(result: true));
                                if (isConfirm) {
                                  await userController.logout();
                                }
                              },
                              text: 'Keluar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFC42F25),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
