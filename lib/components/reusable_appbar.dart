import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaka/flutter_flow/flutter_flow_icon_button.dart';
import 'package:kolaka/flutter_flow/flutter_flow_theme.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function? onBack;
  final List<Widget>? actions;
  final bool? centerTitle;

  const ReusableAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.actions,
    this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      automaticallyImplyLeading: false,
      leading: onBack != null ? FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 30.0,
        borderWidth: 1.0,
        buttonSize: 60.0,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 30.0,
        ),
        onPressed: () {
          if (onBack != null) {
            onBack!();
          } else {
            Get.back();
          }
        },
      ) : null,
      actions: actions ?? [],
      centerTitle: centerTitle ?? false,
      elevation: 2.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
