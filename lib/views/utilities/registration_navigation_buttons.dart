import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/auth/login/login_screen.dart';

class NavigationButtons extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final PageController pageController;
  final Function(int) onStepChanged;

  const NavigationButtons({super.key, 
    required this.currentStep,
    required this.totalSteps,
    required this.pageController,
    required this.onStepChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentStep > 0
            ? GestureDetector(
                onTap: () {
                  onStepChanged(currentStep - 1);
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.baseColor,
                      width: 2.0,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: AppColors.baseColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        currentStep < totalSteps - 1
            ? GestureDetector(
                onTap: () {
                  if (currentStep < totalSteps - 1) {
                    onStepChanged(currentStep + 1);
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
                  decoration: BoxDecoration(
                      color: AppColors.baseColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
                  decoration: BoxDecoration(
                      color: AppColors.baseColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
