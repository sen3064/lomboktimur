import '/backend/api_requests/api_calls.dart';
import '/components/buy_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';
import 'package:flutter/material.dart';

class DetailRestoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Buy_item component.
  late BuyItemModel buyItemModel;

  /// Query cache managers for this widget.

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buyItemModel = createModel(context, () => BuyItemModel());
  }

  void dispose() {
    unfocusNode.dispose();
    buyItemModel.dispose();

    /// Dispose query cache managers for this widget.

    clearListMakananCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
