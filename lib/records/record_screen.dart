import 'package:flutter/material.dart';
import 'package:health_care_advisor/records/record_table.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/dialogs/logout_dialog.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Record book',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    RecordTable(),
                    SizedBox(
                      height: 6,
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
