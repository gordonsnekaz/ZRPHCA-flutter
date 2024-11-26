import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/dialogs/logout_dialog.dart';
import 'package:health_care_advisor/chatbot/chatbot_screen.dart';
import 'package:health_care_advisor/views/utilities/side_drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DiagnoseScreen extends StatefulWidget {
  const DiagnoseScreen({super.key});

  @override
  State<DiagnoseScreen> createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "ZRPHCA",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkGrey),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamu lacinia odio vitaeLorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkGrey),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: GestureDetector(
                                  onTap: () => {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: const ChatbotScreen(),
                                      withNavBar: false,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.sizeUp,
                                    ),
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        width: 250,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/doctor.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: AppColors.lightGrey,
                                              blurRadius: 0.4,
                                              offset: Offset(0.2, 0.6),
                                            ),
                                          ],
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Chatbot",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 18,
                                                    color: AppColors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              const Text(
                                                "This is an AI doctor",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.white),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: AppColors.white,
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Start dignosing',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: GestureDetector(
                                  onTap: () => {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        width: 250,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/teeth.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: AppColors.lightGrey,
                                              blurRadius: 0.4,
                                              offset: Offset(0.2, 0.6),
                                            ),
                                          ],
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Teeth Care",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 18,
                                                    color: AppColors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              const Text(
                                                "This is an AI doctor",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.white),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: AppColors.white,
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Start dignosing',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: GestureDetector(
                                  onTap: () => {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        width: 250,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/skin.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: AppColors.lightGrey,
                                              blurRadius: 0.4,
                                              offset: Offset(0.2, 0.6),
                                            ),
                                          ],
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Skin Care",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 18,
                                                    color: AppColors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              const Text(
                                                "Skin doctor for your skin",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.white),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: AppColors.white,
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Start dignosing',
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "NB: ",
                                    style: TextStyle(
                                      color: AppColors.darkGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "The Zimbabwe Republic Police Health Care Advisor is a digital tool designed to provide general health advice. Please note that the information provided by this AI is for guidance only and may not always be accurate or reflect your specific medical situation. By using this service, you acknowledge that it does not replace professional medical advice, diagnosis, or treatment, and you agree to the terms and conditions.",
                                    style: TextStyle(
                                      color: AppColors.baseGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
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