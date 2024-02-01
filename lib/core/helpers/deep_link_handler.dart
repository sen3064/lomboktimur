// deep_link_handler.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkHandler {
  Future<void> initUniLinks(Function(Uri link) handleLink) async {
    try {
      final initialLink = await getInitialLink();

      if (initialLink != null) {
        handleLink(Uri.parse(initialLink));
      }

      uriLinkStream.listen((Uri? link) {
        if (link != null) {
          handleLink(link);
        }
      });
    } on PlatformException {
      // Handle errors
    }
  }
}
