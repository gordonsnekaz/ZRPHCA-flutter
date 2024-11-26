import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/dialogs/logout_dialog.dart';
import 'package:health_care_advisor/views/utilities/side_drawer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    String message = _controller.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message); // User message
        _controller.clear();
      });

      // Simulate chatbot response after a brief delay
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _messages.add("OK"); // Automated chatbot response
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: AppColors.baseColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu_rounded,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black54,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return const LogoutDialog();
                        },
                      );
                    },
                    child: const Icon(
                      Icons.logout_outlined,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? AppColors.baseColor.withOpacity(0.2)
                            : AppColors.baseColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _messages[index],
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppColors.baseColor),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
