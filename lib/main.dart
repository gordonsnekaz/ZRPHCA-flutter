import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZRPHCA',
      theme: ThemeData(
        primaryColor: AppColors.baseColor, // Default primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.baseColor, 
          secondary: AppColors.baseColor, 
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
