import '/components/pilih_tanggal_pesan_widget.dart';
import '/components/wishlist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/transportasi/detail_transpotasi_mobil/detail_transpotasi_mobil_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListPencarianKendaraanModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  bool? switchListTileValue;
  // Model for wishlist component.
  late WishlistModel wishlistModel1;
  // Model for wishlist component.
  late WishlistModel wishlistModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    wishlistModel1 = createModel(context, () => WishlistModel());
    wishlistModel2 = createModel(context, () => WishlistModel());
  }

  void dispose() {
    unfocusNode.dispose();
    wishlistModel1.dispose();
    wishlistModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
