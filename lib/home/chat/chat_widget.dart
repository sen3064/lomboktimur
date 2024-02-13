import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:kelotimaja/components/reusable_appbar.dart';
import 'package:kelotimaja/core/helpers/common_helper.dart';
import 'package:kelotimaja/main.dart';
import 'package:kelotimaja/signup_signin_setup/login_page/login_page_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/chatting_message/chatting_message_widget.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  // late ChatModel _model;

  // final scaffoldKey = GlobalKey<ScaffoldState>();

  late final WebViewController wvc;
  double wheight = Get.height;
  Map<String, dynamic> chatAccount = FFAppState().userDataChat;
  bool isRedirect = false;

  @override
  void initState() {
    // if (Platform.isAndroid) wvc.platform = SurfaceAndroidWebView();
    super.initState();
    // _model = createModel(context, () => ChatModel());
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // if (FFAppState().userData.isEmpty) {
        if(FFAppState().userData == null){
        // print(userStorage.read('chat_account'));
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => LoginPageWidget(),
        //   ),
        // );
        await Get.to(() => LoginPageWidget(), arguments: 'chat');
      }
    });
    isRedirect = Get.arguments != null ? true : false;
    wheight = Get.arguments != null ? Get.height : Get.height - 125;
    chatAccount = FFAppState().userDataChat;
    print('chat account : $chatAccount');
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
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
            if(isRedirect){
              print('chat asw');
              isRedirect=false;
              // wvc.runJavaScript('''
              //   window.location.replace("https://chat.kabtour.com/${Get.arguments["to_username"]}/chat");
              // ''');
              wvc.loadRequest(Uri.parse("https://chat.kabtour.com/${Get.arguments["to_username"]}/chat"));
            }
            wvc.runJavaScript('''
                let pms = document.getElementsByClassName("pm_shortcut");
                let pv = document.getElementsByClassName("load_private_conversations");
                let head = document.getElementsByClassName("head");
                let tools = document.getElementsByClassName("tools");
                head[0].style.display='none';
                tools[0].style.display='none';
                // pv[0].click();
                // pms[0].click();
              ''');
            debugPrint('Page finished run js');
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
      ..loadRequest(Uri.parse(chatAccount['auto_login_url']));
    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    wvc = controller;
  }

  @override
  void dispose() {
    // _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WebViewController wvc = WebViewController();
    // List<Map<String, dynamic>> users = [
    //   {'id': '1', 'name': 'Admin', 'avatar': 'avatar.png'},
    //   {'id': '877', 'name': 'SenSuryo', 'avatar': 'avatar.png'}
    // ];

    // return Scaffold(
    //   backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
    //   appBar: const ReusableAppBar(title: 'Chat Screen'),
    //   body: SafeArea(
    //     top: true,
    //     child: RefreshIndicator(
    //       onRefresh: () => Future.delayed(const Duration(seconds: 3)),
    //       child: Padding(
    //           padding: const EdgeInsets.all(2),
    //           child: ListView.builder(
    //               itemCount: users.length,
    //               itemBuilder: (context, index) {
    //                 final contact = users[index];
    //                 // String image = contact['image'] == 'avatar.png' ? '' : contact['image'];
    //                 String avatarUrl =
    //                     CommonHelper.getAvatarUrl(contact['avatar']);
    //                 return Padding(
    //                   padding: const EdgeInsets.all(4),
    //                   child: GestureDetector(
    //                     onTap: () => Get.to(() => const ChatScreen(), arguments: contact),
    //                     child: Card(
    //                       clipBehavior: Clip.antiAliasWithSaveLayer,
    //                       color: FlutterFlowTheme.of(context).secondaryBackground,
    //                       elevation: 2.0,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                       child: Row(
    //                         children: [
    //                           Image.network(avatarUrl,
    //                               width: 50, height: 50, fit: BoxFit.cover),
    //                           const SizedBox(
    //                             width: 5,
    //                           ),
    //                           Column(
    //                             mainAxisSize: MainAxisSize.max,
    //                             children: [
    //                               Align(
    //                                 child: Text(contact['name']),
    //                               )
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               })),
    //     ),
    //   ),
    // );
    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: ReusableAppBar(title: 'Chats', onBack: () => Get.back(),),
        body: SafeArea(
          top: true,
          child: SizedBox(
            height: wheight,
            child: WebViewWidget(
              controller: wvc,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    String? currentUrl = await wvc.currentUrl();
    print('current url : $currentUrl');
    print(await wvc.canGoBack());
    if (currentUrl == 'https://chat.kabtour.com/#' ||
        currentUrl == 'https://chat.kabtour.com') {
      Get.off(() => NavBarPage(
            initialPage: 'Home_Page',
          ));
      // Get.back();
      return Future.value(true);
    } else {
      if (await wvc.canGoBack()) {
        wvc.goBack();
        return Future.value(false);
      } else {
        Get.off(() => NavBarPage(
              initialPage: 'Home_Page',
            ));
        // Get.back();
        return Future.value(true);
      }
    }
  }
}
