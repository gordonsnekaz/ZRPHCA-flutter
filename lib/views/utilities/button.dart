// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Button {
  Future<int> _getState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('chatbot_state') ?? 0; // Default to state 0
  }

  Future<void> _setState(int state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('chatbot_state', state);
  }

  Future<http.Response> sendMessage(String message) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Mimic network delay

    String simulatedResponse;

    int state = await _getState(); // Get the current state

    switch (state) {
      case 0:
        simulatedResponse =
            '{"message": "What would you like to do?\\n\\n1. Diagnose disease based on symptoms\\n2. Find symptoms for a disease\\n3. Find treatments for a disease"}';
        await _setState(1); // Move to next state
        break;

      case 1:
        if (message == '1') {
          simulatedResponse =
              '{"message": "Please describe your symptoms, separated by commas."}';
          await _setState(2); // Proceed to disease diagnosis
        } else if (message == '2') {
          simulatedResponse =
              '{"message": "Which disease would you like to learn about?"}';
          await _setState(3); // Proceed to symptoms lookup
        } else if (message == '3') {
          simulatedResponse =
              '{"message": "Which disease would you like to find treatments for?"}';
          await _setState(4); // Proceed to treatment lookup
        } else {
          simulatedResponse =
              '{"message": "Invalid choice. Please reply with 1, 2, or 3."}';
        }
        break;

      case 2:
        simulatedResponse = '{"message": "Analyzing symptoms: $message..."}';
        await _setState(0); // Restart conversation
        break;

      case 3:
        simulatedResponse =
            '{"message": "Symptoms for $message are: Fever, Cough, Fatigue"}';
        await _setState(0); // Restart conversation
        break;

      case 4:
        simulatedResponse =
            '{"message": "Treatments for $message include rest, hydration, and medication."}';
        await _setState(0); // Restart conversation
        break;

      default:
        simulatedResponse =
            '{"message": "Something went wrong. Let\'s start over."}';
        await _setState(0); // Restart conversation
    }

    return http.Response(simulatedResponse, 200);
  }
}