import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController dateController;
  final String labelText;

  const DatePickerField({
    super.key,
    required this.dateController,
    required this.labelText,
  });

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  void initState() {
    super.initState();
    widget.dateController.text = ''; // Set initial text if needed
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        widget.dateController.text =
            '${picked.toLocal()}'.split(' ')[0]; // Format as needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
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
        suffixIcon: const Icon(
          Icons.calendar_today,
        ), // Add a calendar icon
      ),
      style: const TextStyle(
        color: AppColors.baseGrey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      onTap: () => _selectDate(context),
    );
  }
}
