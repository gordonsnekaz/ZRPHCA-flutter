import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/theme/colors.dart';

class PackageCard extends StatelessWidget {
  final String pic;
  final String topic;
  final String desc;

  const PackageCard(
      {super.key, required this.pic, required this.topic, required this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: GestureDetector(
          onTap: () => {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: 250,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/covid.png'),
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
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        topic,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        desc,
                        style: const TextStyle(
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
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.white,
                              width: 1.5,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'View more',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
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
    );
  }
}
