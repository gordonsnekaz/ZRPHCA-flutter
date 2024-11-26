import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/chatbot/diagnose_screen.dart';
import 'package:health_care_advisor/home/home_screen.dart';
import 'package:health_care_advisor/profile/profile_screen.dart';
import 'package:health_care_advisor/records/record_screen.dart';
import 'package:health_care_advisor/appointment/schedule_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class RootScreen extends StatefulWidget {
  final int packages;
  const RootScreen({
    super.key,
    required this.packages,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);

  // Bottom navigation screens
  List<Widget> _buildScreens() {
    return [
      const DiagnoseScreen(),
      const ScheduleScreen(),
      const HomeScreen(),
      const RecordScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.message_outlined),
        title: ("Diagnose"),
        activeColorPrimary: AppColors.baseColor,
        inactiveColorPrimary: AppColors.baseGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.event_note_rounded),
        title: ("Schedule"),
        activeColorPrimary: AppColors.baseColor,
        inactiveColorPrimary: AppColors.baseGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home_outlined,
          color: AppColors.white,
        ),
        title: ("Home"),
        activeColorPrimary: AppColors.baseColor,
        inactiveColorPrimary: AppColors.baseGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.folder_copy_outlined),
        title: ("Record"),
        activeColorPrimary: AppColors.baseColor,
        inactiveColorPrimary: AppColors.baseGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: ("Profile"),
        activeColorPrimary: AppColors.baseColor,
        inactiveColorPrimary: AppColors.baseGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: AppColors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: const NavBarDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.baseColor,
            width: 0.3,
          ),
        ),
        colorBehindNavBar: AppColors.white,
      ),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 250),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
