import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

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
      ..loadRequest(Uri.parse("https://symptomate.com/interview/0"))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          _handlePageLoad(url);
        },
      ));
  }

  void _handlePageLoad(String url) {
    if (url == "http://localhost:4000/paynow/payment-result") {
      // Handle URL redirection logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // WebView widget
            WebViewWidget(controller: controller),
            // Cancel button with full-width container
            Positioned(
              top: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width, // Full width of the screen
                padding: const EdgeInsets.all(12),
                color: AppColors.baseColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                        size: 24,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 24,
                      ),
                    ),
                    const SizedBox(), // Extra space to balance the layout
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
