import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'LandingPage.dart';

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  late InAppWebViewController _webViewController;
  late InAppWebViewController _webViewPopupController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          decoration: const BoxDecoration(color: Color(0xffFFA500)),
          child: const AppBarContent(showBackBtn: true,),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: InAppWebView(initialUrlRequest:
          URLRequest(url: Uri.parse('https://www.fnp.com/personalised-combos?promo=plplink_combos_desk'))
          ),
        ),
      ),
    );
  }
}
