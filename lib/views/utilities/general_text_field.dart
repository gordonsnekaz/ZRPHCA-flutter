import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';

class GeneralTextFormField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  const GeneralTextFormField({super.key, 
    required this.labelText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.baseColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusColor: AppColors.baseColor,
      ),
      style: const TextStyle(
        color: AppColors.baseGrey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      obscureText: obscureText,
    );
  }
}
