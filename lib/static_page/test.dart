import 'package:bakery_time/widget/GoogleAdWidget.dart';
import 'package:bakery_time/widget/MainAppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
   WebViewController? _webViewController;
  @override
  void initState() {
 	  _webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://youtube.com'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBarWidget(context),
        body: WebViewWidget(controller: _webViewController!,),
    );
  }
}
