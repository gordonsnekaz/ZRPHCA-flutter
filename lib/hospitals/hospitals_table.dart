import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/hospitals/hospital_model.dart';
import 'package:health_care_advisor/hospitals/hospital_service.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HospitalsTable extends StatefulWidget {
  const HospitalsTable({
    super.key,
  });

  @override
  State<HospitalsTable> createState() => _HospitalsTableState();
}

class _HospitalsTableState extends State<HospitalsTable> {
  List<HospitalModel> hospitals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getSubscriptions();
  }

  Future<void> getSubscriptions() async {
    HospitalService hospitalService = HospitalService();
    var response = await hospitalService.fetchHospitals();

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var hospitalsData = jsonResponse as List<dynamic>;
      setState(() {
        hospitals =
            hospitalsData.map((json) => HospitalModel.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to get hospitals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SpinKitCircle(
            color: AppColors.baseColor,
            size: 64.0,
          )
        : hospitals.isEmpty
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.baseColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info,
                      color: AppColors.baseColor,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        'You currently do not have an active subscription.',
                        style: GoogleFonts.roboto(
                          color: AppColors.baseColor,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                color: AppColors.greyBackground,
                child: Column(
                  children: List.generate(
                    hospitals.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.4,
                          ),
                        ),
                        color: index.isEven
                            ? AppColors.greyBackground
                            : AppColors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // PersistentNavBarNavigator.pushNewScreen(
                          //   context,
                          //   screen: PackageScreen(
                          //     subscription: subscriptions[index],
                          //   ),
                          //   withNavBar: false,
                          //   pageTransitionAnimation:
                          //       PageTransitionAnimation.sizeUp,
                          // );
                        },
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hospitals[index].name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.baseGrey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${hospitals[index].address} | ${hospitals[index].city}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.baseColor,
                                      width: 1.4,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                child: const Text(
                                  'Get Directions',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.baseColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
  }
}
