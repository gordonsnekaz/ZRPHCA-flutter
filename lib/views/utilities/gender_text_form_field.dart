import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/theme/colors.dart';

class GenderTextFormField extends StatefulWidget {
  final ValueNotifier<String?> controller;

  const GenderTextFormField({
    super.key,
    required this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GenderTextFormFieldState createState() => _GenderTextFormFieldState();
}

class _GenderTextFormFieldState extends State<GenderTextFormField> {
  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Gender",
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
      value: widget.controller.value,
      items: genders.map((gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(
            gender,
            style: const TextStyle(
              color: AppColors.baseGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        widget.controller.value = newValue;
      },
      selectedItemBuilder: (BuildContext context) {
        return genders.map((gender) {
          return Text(
            gender,
            style: GoogleFonts.roboto(
              color: AppColors.baseGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          );
        }).toList();
      },
    );
  }
}
