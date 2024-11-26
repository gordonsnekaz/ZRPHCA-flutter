import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:health_care_advisor/profile/profile_model.dart';
import 'package:health_care_advisor/profile/profile_service.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/utilities/general_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color personalHeadingColor = AppColors.white;
  Color contactHeadingColor = AppColors.baseGrey;
  Color accountHeadingColor = AppColors.baseGrey;

  //show and hide views
  bool isVisiblePersonal = true;
  bool isVisibleContact = false;
  bool isVisibleAccount = false;
  ProfileModel? patientProfile;
  bool isLoading = true;

  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
    ProfileService profileService = ProfileService();
    var response = await profileService.fetchProfile();

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        patientProfile = ProfileModel.fromJson(jsonResponse);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to get profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Background container
                Container(
                  color: AppColors.baseColor,
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/data.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Profile image container with translation
                isLoading
                    ? const SpinKitSpinningLines(
                        color: AppColors.baseColor,
                        size: 64.0,
                      )
                    : Transform.translate(
                        offset: const Offset(0, -62),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.baseGrey,
                                    width: 2.0,
                                  ),
                                  color: AppColors.white,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/profile.png",
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                patientProfile!.firstName,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGrey),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                patientProfile!.email,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.baseGrey),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  color: AppColors.greyBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    InkWell(
                                      child: isVisiblePersonal
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2),
                                              decoration: BoxDecoration(
                                                color: AppColors.baseColor,
                                                border: Border.all(
                                                  color: AppColors.baseColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(0),
                                                ),
                                              ),
                                              child: const Text(
                                                "User Info",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.white),
                                              ),
                                            )
                                          : Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                  color:
                                                      AppColors.greyBackground,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: const Text(
                                                "User Info",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.baseGrey),
                                              ),
                                            ),
                                      onTap: () {
                                        setState(() {
                                          personalHeadingColor =
                                              AppColors.baseColor;
                                          contactHeadingColor = Colors.grey;
                                          accountHeadingColor = Colors.grey;
                                          isVisiblePersonal = true;
                                          isVisibleContact = false;
                                          isVisibleAccount = false;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    InkWell(
                                      child: isVisibleContact
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2),
                                              decoration: BoxDecoration(
                                                color: AppColors.baseColor,
                                                border: Border.all(
                                                  color: AppColors.baseColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(0),
                                                ),
                                              ),
                                              child: const Text(
                                                "Contact Info",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.white),
                                              ),
                                            )
                                          : Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                  color:
                                                      AppColors.greyBackground,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: const Text(
                                                "Contact Info",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.baseGrey),
                                              ),
                                            ),
                                      onTap: () {
                                        setState(() {
                                          personalHeadingColor = Colors.grey;
                                          contactHeadingColor =
                                              AppColors.baseColor;
                                          accountHeadingColor = Colors.grey;
                                          isVisiblePersonal = false;
                                          isVisibleContact = true;
                                          isVisibleAccount = false;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    InkWell(
                                      child: isVisibleAccount
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2),
                                              decoration: BoxDecoration(
                                                color: AppColors.baseColor,
                                                border: Border.all(
                                                  color: AppColors.baseColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(8),
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                "Account Info",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.white),
                                              ),
                                            )
                                          : Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 8, 2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                  color:
                                                      AppColors.greyBackground,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: const Text(
                                                "Account Info",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.baseGrey),
                                              ),
                                            ),
                                      onTap: () {
                                        setState(() {
                                          personalHeadingColor = Colors.grey;
                                          contactHeadingColor = Colors.grey;
                                          accountHeadingColor =
                                              AppColors.baseColor;
                                          isVisiblePersonal = false;
                                          isVisibleContact = false;
                                          isVisibleAccount = true;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              // Personal Details
                              isVisiblePersonal
                                  ? Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: AppColors.greyBackground,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(children: [
                                        //text and button
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Personal Details",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.darkGrey),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              buildDetailRow("First name:",
                                                  patientProfile!.firstName),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              buildDetailRow("Last name:",
                                                  patientProfile!.lastName),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              buildDetailRow(
                                                  "D.O.B:",
                                                  patientProfile!.dob
                                                      .toString()),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              buildDetailRow("Gender:",
                                                  patientProfile!.gender),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              buildDetailRow("Blood Type:",
                                                  patientProfile!.bloodType),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              buildDetailRow("National ID.:",
                                                  patientProfile!.nationalId),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                    )
                                  : const SizedBox(),

                              // Contact Details
                              isVisibleContact
                                  ? Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: AppColors.greyBackground,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(children: [
                                        //text and button
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Contact Details",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.darkGrey),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              buildDetailRow("Mobile number:",
                                                  patientProfile!.mobile),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              buildDetailRow("Address.:",
                                                  patientProfile!.address),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              buildDetailRow(
                                                  "Emergrncy number:",
                                                  patientProfile!
                                                      .emergencyContact),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                    )
                                  : const SizedBox(),

                              // Account Details
                              isVisibleAccount
                                  ? Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: AppColors.greyBackground,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(children: [
                                        //text and button
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Account Details",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.darkGrey),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              const Text(
                                                "Change password",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.baseColor),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              GeneralTextFormField(
                                                  labelText: 'Old Password',
                                                  obscureText: true,
                                                  controller:
                                                      _passwordController),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              GeneralTextFormField(
                                                  labelText: 'New Password',
                                                  obscureText: true,
                                                  controller:
                                                      _passwordController),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              GeneralTextFormField(
                                                  labelText: 'Confirm Password',
                                                  obscureText: true,
                                                  controller:
                                                      _passwordController),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.baseColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: const Center(
                                                    child: Text(
                                                      'Change Password',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xfff5f8ff),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                    )
                                  : const SizedBox(),

                              // Bottom Space
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.baseGrey),
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey),
        ),
      ],
    );
  }
}
