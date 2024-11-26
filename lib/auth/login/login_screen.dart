import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_care_advisor/auth/login/login_service.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/auth/registration/register_screen.dart';
import '../../views/user/auth/root_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future login(String email, String password) async {
    void saveToken(String token, String id, String email) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      await prefs.setString('user_id', id);
      await prefs.setString('user_email', email);
    }

    LoginService loginService = LoginService();
    var response = await loginService.loginClient(email, password);

    Map<String, dynamic> map = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      String token = map['token'];
      String id = map['user_data']["id"].toString();
      String email = map['user_data']["email"];
      saveToken(token, id, email);

      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RootScreen(
            packages: 1,
          ),
        ),
      );
    } else if (map['statusCode'] == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Either email or password is wrong')),
      );
    } else if (map['statusCode'] == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Validation Error. Please enter valid login details')),
      );
    } else if (map['statusCode'] == 500) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Internal server error')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('System failed. Please try again')),
      );
    }
  }
  @override
  void dispose() {
    _emailController.dispose(); // Correctly dispose the username controller
    _passwordController.dispose(); // Correctly dispose the password controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  SizedBox(
                    width: 120,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "ZRPHCA",
                          style: TextStyle(
                            color: AppColors.baseColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  // Username textfield
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.baseColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                  // Spacer
                  const SizedBox(height: 16),
                  // Password text field
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.baseColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  // Spacer
                  const SizedBox(height: 48),
                  // Login button
                  GestureDetector(
                    onTap: () {
                      login(_emailController.text, _passwordController.text);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.baseColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color(0xfff5f8ff),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Create an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?',
                          style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w400,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Create account',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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
