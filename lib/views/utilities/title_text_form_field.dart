import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';

class TitleTextFormField extends StatefulWidget {
  final TextEditingController titleController;

  const TitleTextFormField({
    super.key,
    required this.titleController,
  });

  @override
  _TitleTextFormFieldState createState() => _TitleTextFormFieldState();
}

class _TitleTextFormFieldState extends State<TitleTextFormField> {
  final List<String> titles = ['Mr', 'Mrs', 'Miss', 'Eng', 'Dr', 'Prof'];
  String? selectedTitle;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Title",
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
      value: selectedTitle,
      items: titles.map((title) {
        return DropdownMenuItem<String>(
          value: title,
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.baseGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedTitle = newValue;
          widget.titleController.text =
              newValue ?? ''; // Update the controller's text
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return titles.map((title) {
          return Text(
            title,
            style: const TextStyle(
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
