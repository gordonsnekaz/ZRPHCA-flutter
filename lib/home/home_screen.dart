import 'package:flutter/material.dart';
import 'package:health_care_advisor/hospitals/hospitals_screen.dart';
import 'package:health_care_advisor/news/news_screen.dart';
import 'package:health_care_advisor/pharmacies/pharmacies_screen.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/dialogs/logout_dialog.dart';
import 'package:health_care_advisor/views/user/account_statement_screen.dart';
import 'package:health_care_advisor/views/utilities/package_card.dart';
import 'package:health_care_advisor/views/utilities/side_drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Color liveHeadingColor = AppColors.baseColor;
  Color historicalHeadingColor = AppColors.baseGrey;
  Color votHeadingColor = AppColors.baseGrey;

  //show and hide views
  bool isVisibleLive = true;
  bool isVisibleHistorical = false;
  bool isVisibleVot = false;

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good morning,";
    } else if (hour < 17) {
      return "Good afternoon,";
    } else {
      return "Good evening,";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: AppColors.baseColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Open the drawer when the menu icon is tapped
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu_rounded,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black54,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return const LogoutDialog();
                        },
                      );
                    },
                    child: const Icon(
                      Icons.logout_outlined,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: AppColors.greyBackground,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getGreeting(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkGrey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Munyaradzi",
                                  style: TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  'Welcome to Health Care Advisor. Your personal digital doctor right in your pocket.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.baseGrey),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: const AccountStatementScreen(),
                                      withNavBar: false,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.sizeUp,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: AppColors.baseColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                      child: Text(
                                        'Start Diagnosing',
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
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Quick navigation',
                            style: TextStyle(
                              color: AppColors.darkGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () => {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const PharmaciesScreen(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.sizeUp,
                              )
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.greyBackground,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.touch_app,
                                        color: AppColors.baseColor,
                                        size: 36,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pharmacies',
                                            style: TextStyle(
                                                color: AppColors.darkGrey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            'Get all nearest phamarcies around your location',
                                            style: TextStyle(
                                                color: AppColors.baseGrey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.baseGrey,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () => {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const HospitalsScreen(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.sizeUp,
                              )
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.greyBackground,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.touch_app,
                                        color: AppColors.baseColor,
                                        size: 36,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hospitals',
                                            style: TextStyle(
                                                color: AppColors.darkGrey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            'Get all nearest hospitals around your location',
                                            style: TextStyle(
                                                color: AppColors.baseGrey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.baseGrey,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                      const Text(
                        "Latest news",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGrey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                PackageCard(
                                  topic: "Cholera Outbreak",
                                  pic: "assets/medicine_test.svg",
                                  desc:
                                      "This is an urgent notification regarding a cholera",
                                ),
                                PackageCard(
                                  topic: "Cholera Outbreak",
                                  pic: "assets/medicine_test.svg",
                                  desc:
                                      "This is an urgent notification regarding a cholera",
                                ),
                                PackageCard(
                                  topic: "Cholera Outbreak",
                                  pic: "assets/medicine_test.svg",
                                  desc:
                                      "This is an urgent notification regarding a cholera",
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const NewsScreen(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.sizeUp,
                              )
                            },
                            child: const Text(
                              'View all',
                              style: TextStyle(
                                  color: AppColors.baseColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      // Bottom Space
                      const SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
