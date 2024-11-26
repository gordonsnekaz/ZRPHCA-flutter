import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/theme/colors.dart';

class AccountStatementDialog extends StatelessWidget {
  final String title;

  const AccountStatementDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width, // Full screen width
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 2),
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      color: AppColors.darkGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.warning,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              buildDetailRow('Date', '17-03-2024'),
              buildDetailRow('Amount', '\$35'),
              buildDetailRow('Type', 'Current Sub'),
              const SizedBox(height: 36),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Close",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.baseColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
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
                style: GoogleFonts.roboto(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  decoration: TextDecoration.none,
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
                style: GoogleFonts.roboto(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
