import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';

class OnboardingContent extends StatelessWidget {
  final String topic;
  final String description;

  const OnboardingContent(
      {super.key, required this.topic, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backGroundColor,
      child: Center(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(child: Container()),
            Image.asset(
              'assets/images/logo.png',
              width: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              topic,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.baseGrey,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
          ],
        ),
      )),
    );
  }
}
