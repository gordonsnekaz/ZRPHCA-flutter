import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/dialogs/logout_dialog.dart';
import 'package:health_care_advisor/appointment/schedule_appointment.dart';
import 'package:health_care_advisor/views/utilities/side_drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Schedule an appointment",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGrey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamu lacinia odio vitaeLorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const ScheduleAppointment(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.sizeUp,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: AppColors.baseColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              'Schedule an Oppointment',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
