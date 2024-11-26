import 'package:flutter/material.dart';
import 'package:health_care_advisor/models/client_model.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/utilities/date_picker_field.dart';
import 'package:health_care_advisor/views/utilities/gender_text_form_field.dart';
import 'package:health_care_advisor/views/utilities/general_text_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentStep = 0;
  final int _totalSteps = 4;
  final PageController _pageController = PageController();

  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emergencyNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();
  final TextEditingController _bloodType = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  ValueNotifier<String?> genderController = ValueNotifier<String?>(null);
  bool _isChecked = false;

  void _submitForm() {
    final registrationModel = ClientModel(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      dob: DateTime.parse(_dateController.text),
      gender: genderController.value.toString(),
      mobile: _mobileNumberController.text,
      nationalId: _nationalIDController.text,
      address: _addressController.text,
      bloodType: _bloodType.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double widthPadding = 12.0;
    final double availableWidth = screenWidth - widthPadding * 2;
    final double dotWidth = availableWidth / 5;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_currentStep > 0) {
                          setState(() {
                            _currentStep -= 1;
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff828282),
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Register',
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${((_currentStep + 1) / _totalSteps * 100).round()}%',
                      style: const TextStyle(
                        color: AppColors.baseColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(
                      text: " Complete",
                      style: TextStyle(
                        color: AppColors.baseGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _totalSteps,
                effect: ExpandingDotsEffect(
                  dotHeight: 2.0,
                  dotWidth: dotWidth,
                  activeDotColor: AppColors.baseColor,
                  dotColor: AppColors.lightGrey,
                  expansionFactor: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentStep = page;
                  });
                },
                children: [
                  _buildStepContent(
                    title: 'Personal Details',
                    description: 'Please fill in your personal details',
                    children: [
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'First Name',
                          controller: _firstNameController),
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Last Name',
                          controller: _lastNameController),
                      const SizedBox(height: 12),
                      // Date Picker
                      DatePickerField(
                        dateController: _dateController,
                        labelText: 'Date of Birth',
                      ),
                      const SizedBox(height: 12),
                      // Gender drop down
                      GenderTextFormField(
                        controller: genderController,
                      ),
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'National ID',
                          controller: _nationalIDController),
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Blood Type', controller: _bloodType),
                      const SizedBox(height: 12),
                      _buildNavigationButtons(),
                    ],
                  ),
                  _buildStepContent(
                    title: 'Contact Details',
                    description: 'Please fill in your contact details',
                    children: [
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Mobile Number',
                          controller: _mobileNumberController),
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Address', controller: _addressController),
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Emergency number',
                          controller: _emergencyNumberController),
                      const SizedBox(height: 48),
                      _buildNavigationButtons(),
                    ],
                  ),
                  _buildStepContent(
                    title: 'Account Details',
                    description: 'Please fill in your account details',
                    children: [
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Email', controller: _emailController),
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Password',
                          obscureText: true,
                          controller: _usernameController),
                      const SizedBox(height: 12),
                      GeneralTextFormField(
                          labelText: 'Confirm Password',
                          obscureText: true,
                          controller: _passwordController),
                      const SizedBox(height: 48),
                      _buildNavigationButtons(),
                    ],
                  ),
                  _buildStepContent(
                    title: 'Review',
                    description: 'Review your details and confirm',
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.lightGrey,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Personal Details",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.baseGrey),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _buildRowContent(
                                textTitle: "First Name(s):",
                                controlerText: _firstNameController.text),
                            const SizedBox(
                              height: 4,
                            ),
                            _buildRowContent(
                                textTitle: "Last Name:",
                                controlerText: _lastNameController.text),
                            const SizedBox(
                              height: 4,
                            ),
                            _buildRowContent(
                                textTitle: "Date of Birth:",
                                controlerText: _dateController.text),
                            const SizedBox(
                              height: 4,
                            ),
                            _buildRowContent(
                                textTitle: "Gender:",
                                controlerText: _firstNameController.text),
                            const SizedBox(
                              height: 4,
                            ),
                            _buildRowContent(
                                textTitle: "National ID:",
                                controlerText: _nationalIDController.text),
                            const SizedBox(
                              height: 4,
                            ),
                            _buildRowContent(
                                textTitle: "Blood type:",
                                controlerText: _bloodType.text),
                            const SizedBox(
                              height: 12,
                            ),

                            // Contact Info
                            const Text(
                              "Contact Details",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.baseGrey),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _buildRowContent(
                                textTitle: "Mobile number:",
                                controlerText: _mobileNumberController.text),
                            const SizedBox(
                              height: 4,
                            ),
                            _buildRowContent(
                                textTitle: "Address:",
                                controlerText: _addressController.text),
                            _buildRowContent(
                                textTitle: "Emergency number:",
                                controlerText: _mobileNumberController.text),
                            const SizedBox(
                              height: 12,
                            ),

                            // Account Info
                            const Text(
                              "Account Details",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.baseGrey),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _buildRowContent(
                                textTitle: "Email Addres:",
                                controlerText: _emailController.text),
                            const SizedBox(
                              height: 4,
                            ),
                            _buildRowContent(
                                textTitle: "Password:",
                                controlerText: _passwordController.text),
                            const SizedBox(
                              height: 24,
                            ),

                            // Agree
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value ?? false;
                                    });
                                  },
                                  activeColor: AppColors.baseColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Expanded(
                                  child: Text(
                                    "By ticking, you are confirming that you have read, understood and agree to terms and conditions.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightGrey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildNavigationButtons(),
                      const SizedBox(height: 16),
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

  Widget _buildRowContent(
      {required String textTitle, required String controlerText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textTitle,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrey),
        ),
        Text(
          controlerText,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.baseGrey),
        ),
      ],
    );
  }

  Widget _buildStepContent(
      {required String title,
      required String description,
      required List<Widget> children}) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(
              color: AppColors.baseGrey,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
        Column(
          children: [
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _currentStep > 0
            ? GestureDetector(
                onTap: () => {
                  setState(() {
                    _currentStep -= 1;
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  })
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.baseColor,
                      width: 2.0,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Center(
                          child: Text(
                        'Back',
                        style: TextStyle(
                            color: AppColors.baseColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        _currentStep < _totalSteps - 1
            ? GestureDetector(
                onTap: () => {
                  if (_currentStep < _totalSteps - 1)
                    {
                      setState(() {
                        _currentStep += 1;
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      })
                    }
                  else
                    {
                      // Registration process is complete
                    }
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
                  decoration: BoxDecoration(
                    color: AppColors.baseColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.baseColor,
                      width: 2.0,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Center(
                          child: Text(
                        'Next',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                    ],
                  ),
                ),
              )
            : GestureDetector(
                onTap: () => {
                  _submitForm(),
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
                  decoration: BoxDecoration(
                    color: AppColors.baseColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.baseColor,
                      width: 2.0,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Center(
                          child: Text(
                        'Done',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )),
                    ],
                  ),
                ),
              )
      ],
    );
  }
}
