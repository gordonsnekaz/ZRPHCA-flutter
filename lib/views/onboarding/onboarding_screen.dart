import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/onboarding/landing_screen.dart';
import 'package:health_care_advisor/views/onboarding/onboarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //track for page
  final PageController _controller = PageController();

  //on last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: const [
            OnboardingContent(
              topic: "Welcome to ZRPHCA",
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.',
            ),
            OnboardingContent(
              topic: "ZRPHCA Chatbot",
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.',
            ),
            OnboardingContent(
              topic: "Appointment Booking",
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.',
            ),
            OnboardingContent(
              topic: "ZRPHCA Profile",
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.',
            ),
          ],
        ),

        //dot indicators
        Container(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //dot indicators
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                        dotWidth: 12.0,
                        dotHeight: 2.0,
                        dotColor: AppColors.lightGrey,
                        activeDotColor: AppColors.baseColor),
                  ),

                  //spacer
                  const SizedBox(
                    height: 30.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //skip
                      GestureDetector(
                          onTap: () => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LandingScreen()))
                              },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: const Row(
                              children: [
                                Center(
                                    child: Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: AppColors.darkGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                              ],
                            ),
                          )),

                      //next or done
                      onLastPage
                          ? GestureDetector(
                              onTap: () => {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LandingScreen()))
                                  },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 8, 30, 8),
                                decoration: BoxDecoration(
                                    color: AppColors.baseColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Row(
                                  children: [
                                    Center(
                                        child: Text(
                                      'Done',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ],
                                ),
                              ))
                          : GestureDetector(
                              onTap: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 8, 20, 8),
                                decoration: BoxDecoration(
                                    color: AppColors.baseColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Row(
                                  children: [
                                    Center(
                                        child: Text(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    //spacer
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              )),
        )
      ]),
    );
  }
}
