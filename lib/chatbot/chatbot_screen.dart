import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatbotScreen extends StatefulWidget {

  const ChatbotScreen({
    super.key,
  });

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://symptomate.com/"))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          _handlePageLoad(url);
        },
      ));
  }

  void _handlePageLoad(String url) {
    // Check if the URL matches the payment result URL
    if (url == "http://localhost:4000/paynow/payment-result") {
      // Redirect to the success page
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => PaynowResponseScreen(
      //     ),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
