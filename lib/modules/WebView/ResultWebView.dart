import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResultWebView extends StatefulWidget {
  const ResultWebView({super.key});

  @override
  State<ResultWebView> createState() => _ResultWebViewState();
}

class _ResultWebViewState extends State<ResultWebView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebView")),
      body: Container(
        child: WebView(
          initialUrl:
              "https://www.sparkode.online/admin/drive/457/candidate/ab40f06fa2f4ac81262d996ee56aab390d701997/report",
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
        ),
      ),
    );
  }
}
