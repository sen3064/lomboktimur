import 'package:kolaka/components/reusable_appbar.dart';
import 'package:kolaka/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kolaka/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class WebViewScreen extends StatelessWidget {
  final wvc = WebViewController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments;
    wvc
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            if (arguments['url'].startsWith('https://kolaka.kabtour.com')) {
              wvc.runJavaScript('''
                let topbar = document.getElementsByClassName("bravo_topbar");
                let header = document.getElementsByClassName("bravo_header");
                let footer = document.getElementsByClassName("bravo_footer");
                topbar[0].style.display='none';
                header[0].style.display='none';
                footer[0].style.display='none';
              ''');
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
                code: ${error.errorCode}
                description: ${error.description}
                errorType: ${error.errorType}
                isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(arguments['url']));

    return WillPopScope(
      onWillPop: () async {
        // Handle back button pressed
        await Get.to(() => NavBarPage(initialPage: 'Transaksi'));
        return true; // Allow pop
      },
      child: (Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: ReusableAppBar(
          title: '${arguments['title']}',
          onBack: () async {
            await Get.to(() => NavBarPage(initialPage: 'Transaksi')); 
          },
        ),
        body: SafeArea(
          top: true,
          child: Center(
            child: WebViewWidget(
              controller: wvc,
            ),
          ),
        ),
      )),
    );
  }
}
