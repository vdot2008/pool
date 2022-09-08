import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if ((await _webViewController?.canGoBack()) ?? false) {
          _webViewController?.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        // appBar: AppBar(
        // title: const Text('Welcome to Flutter'),
        // ),
        body: WebView(
          onWebViewCreated: (controller) {
            setState(() {
              _webViewController = controller;
            });
          },
          initialUrl: "https://pool.myskoolfinder.com/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
