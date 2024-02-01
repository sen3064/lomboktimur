import 'dart:async';

import '/backend/api_requests/api_calls.dart';
import '/components/pilih_lokasi_widget.dart';
import '/components/tombol_lihat_semua_widget.dart';
import '/components/wishlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/makanan/list_rekomendasi/list_rekomendasi_widget.dart';
import '/transportasi/detail_transpotasi_mobil/detail_transpotasi_mobil_widget.dart';
import '/transportasi/detail_transpotasi_motor/detail_transpotasi_motor_widget.dart';
import '/transportasi/list_kendaraan_mobil/list_kendaraan_mobil_widget.dart';
import '/transportasi/list_kendaraan_motor/list_kendaraan_motor_widget.dart';
import '/transportasi/pesan_kendaraan_motor/pesan_kendaraan_motor_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeKendaraanModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Model for TombolLihatSemua component.
  late TombolLihatSemuaModel tombolLihatSemuaModel;
  // Model for wishlist component.
  late WishlistModel wishlistModel3;
  // Model for wishlist component.
  late WishlistModel wishlistModel4;
  // Model for wishlist component.
  late WishlistModel wishlistModel5;

  /// Query cache managers for this widget.

  final _rentListingManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> rentListing({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _rentListingManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRentListingCache() => _rentListingManager.clear();
  void clearRentListingCacheKey(String? uniqueKey) =>
      _rentListingManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tombolLihatSemuaModel = createModel(context, () => TombolLihatSemuaModel());
    wishlistModel3 = createModel(context, () => WishlistModel());
    wishlistModel4 = createModel(context, () => WishlistModel());
    wishlistModel5 = createModel(context, () => WishlistModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tombolLihatSemuaModel.dispose();
    wishlistModel3.dispose();
    wishlistModel4.dispose();
    wishlistModel5.dispose();

    /// Dispose query cache managers for this widget.

    clearRentListingCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
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
}
