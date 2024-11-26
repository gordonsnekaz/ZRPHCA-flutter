import 'package:flutter/material.dart';
import 'package:health_care_advisor/records/record_model.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:intl/intl.dart';

class RecordItemScreen extends StatefulWidget {
  RecordModel recordData;

  RecordItemScreen({
    super.key,
    required this.recordData,
  });

  @override
  State<RecordItemScreen> createState() => _RecordItemScreenState();
}

class _RecordItemScreenState extends State<RecordItemScreen> {
  RecordModel? recordData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'R000001',
                      style: TextStyle(
                        color: AppColors.baseGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildDetailRow(
                            'Date',
                            DateFormat('MMM d, yyyy').format(DateTime.parse(
                                widget.recordData.diagnosisDate))),
                        buildDetailRow(
                            'Diagnosed by', widget.recordData.diagnosedBy),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // symptoms
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Symptoms',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...widget.recordData.symptoms
                                  .split(',')
                                  .map((symptom) {
                                return symptomText(symptom.trim());
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Outcome
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Diagnosis',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: symptomText(widget.recordData.diagnosis),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Prescription
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Prescription',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...widget.recordData.prescribedMedication
                                  .split(',')
                                  .map((symptom) {
                                return symptomText(symptom.trim());
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Prescription
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Notes',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: symptomText(widget.recordData.notes),
                        ),
                      ],
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

  Widget symptomText(String symptom) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        '• $symptom',
        style: const TextStyle(
          color: AppColors.baseGrey,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              color: AppColors.greyBackground,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              color: AppColors.baseColor,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
