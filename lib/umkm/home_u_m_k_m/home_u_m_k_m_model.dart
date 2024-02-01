import 'dart:async';

import '/backend/api_requests/api_calls.dart';
import '/components/pilih_lokasi_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/umkm/detail_produk_food/detail_produk_food_widget.dart';
import '/umkm/keranjang/keranjang_widget.dart';
import '/umkm/list_produk_filter/list_produk_filter_widget.dart';
import '/umkm/list_produk_pilihan/list_produk_pilihan_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'package:badges/badges.dart' as badges;
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeUMKMModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Query cache managers for this widget.

  final _dataUMKMManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> dataUMKM({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _dataUMKMManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDataUMKMCache() => _dataUMKMManager.clear();
  void clearDataUMKMCacheKey(String? uniqueKey) =>
      _dataUMKMManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearDataUMKMCache();
  }

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
