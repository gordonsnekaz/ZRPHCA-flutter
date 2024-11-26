import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/dialogs/logout_dialog.dart';
import 'package:health_care_advisor/views/utilities/contact_screen.dart';
import 'package:health_care_advisor/views/utilities/notifications_screen.dart';
import 'package:health_care_advisor/views/utilities/settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.baseColor,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 36,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "ZRPHCA ",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: AppColors.baseGrey,
              size: 24,
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                color: AppColors.baseGrey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_outlined,
              color: AppColors.baseGrey,
              size: 24,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(
                color: AppColors.baseGrey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const SettingsScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_mail_outlined,
              color: AppColors.baseGrey,
              size: 24,
            ),
            title: const Text(
              "Contact Us",
              style: TextStyle(
                color: AppColors.baseGrey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const ContactScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_outlined,
              color: AppColors.baseGrey,
              size: 24,
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(
                color: AppColors.baseGrey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const NotificationsScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
              );
            },
          ),
          Container(
            height: 0.6,
            color: AppColors.lightGrey,
            margin: const EdgeInsets.symmetric(
              vertical: 12,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: AppColors.baseGrey,
              size: 24,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                color: AppColors.baseGrey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                barrierColor: Colors.black54,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (BuildContext buildContext, Animation animation,
                    Animation secondaryAnimation) {
                  return const LogoutDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
