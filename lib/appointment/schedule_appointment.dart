import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/utilities/date_picker_field.dart';
import 'package:health_care_advisor/views/utilities/general_text_field.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({
    super.key,
  });

  @override
  State<ScheduleAppointment> createState() =>
      _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  final TextEditingController _reason = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final List<String> timeSlots = [
    "09:30",
    "10:30",
    "11:30",
    "12:30",
    "13:30",
    "14:30",
    "15:30",
  ];

  String? selectedTime; // Tracks the selected time slot

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
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
                      'Record',
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

            // Time slot selection
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      "Book an appointment:",
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GeneralTextFormField(
                        labelText: 'Reason for appointment',
                        controller: _reason),
                    const SizedBox(
                      height: 12,
                    ),
                    // Date Picker
                    DatePickerField(
                      dateController: _dateController,
                      labelText: 'Date of appointment',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Choose schedule time:",
                      style: TextStyle(
                        color: AppColors.baseColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Wrap(
                      spacing: 12.0, // Space between containers horizontally
                      runSpacing: 12.0, // Space between rows
                      children: timeSlots.map((time) {
                        final isSelected = selectedTime == time;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTime = time; // Set selected time
                            });
                          },
                          child: Container(
                            width: 80, // Fixed width for each time slot
                            height: 40, // Fixed height for each time slot
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors
                                      .baseColor // Highlight selected time
                                  : Colors.white, // Default background
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.baseColor // Highlight border
                                    : Colors.grey.shade400, // Default border
                              ),
                            ),
                            child: Text(
                              time,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white // Selected text color
                                    : Colors.black, // Default text color
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: AppColors.baseColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            'Schedule',
                            style: TextStyle(
                                color: Color(0xfff5f8ff),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
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
