import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_care_advisor/chatbot/chatbot_service.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/utilities/side_drawer.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() async {
    String message = _controller.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message); // User message
        _controller.clear();
      });

      var response = await _sendMessageToBackend(message);

      // Simulate chatbot response after a brief delay
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          // Check if the response is valid, then add it to the chat
          if (response != null) {
            _messages.add(response);
          } else {
            _messages.add("Sorry, I couldn't get a response.");
          }
        });
      });
    }
  }

  Future<String?> _sendMessageToBackend(String message) async {
    try {
      ChatbotService chatbotService = ChatbotService();

      var responseData = await chatbotService.sendMessage(message);

      if (responseData.statusCode == 200) {
        // Decode the response body into a map
        var responseJson = jsonDecode(responseData.body);

        // Now extract the 'message' from the decoded response
        return responseJson['message'];
      } else {
        throw Exception('Failed to get a valid response from the backend');
      }
    } catch (e) {
      print('Error: $e');
      return null;
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
              child: Center(
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
                    const Text(
                      'ZRPHCA Chatbot',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            // Display the current date at the top of the message list
            const Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "12-October-2024",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUserMessage = index % 2 != 0;

                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? AppColors.baseColor.withOpacity(0.6)
                            : AppColors.baseColor.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(isUserMessage ? 16 : 0),
                          bottomRight: Radius.circular(isUserMessage ? 0 : 16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: isUserMessage
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            _messages[index],
                            style: TextStyle(
                              color: isUserMessage
                                  ? AppColors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '12:45 PM',
                            style: TextStyle(
                              color: isUserMessage
                                  ? AppColors.white.withOpacity(0.7)
                                  : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: AppColors.greyBackground,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 12.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: AppColors.baseColor,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: AppColors.baseColor,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: AppColors.baseColor,
                              width: 1.5,
                            ),
                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
