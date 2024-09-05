// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/next_button.dart';
import '../../constants/text_font_style.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/all_routes.dart';
import '../../helpers/navigation_service.dart';
import '../../helpers/ui_helpers.dart';
import '../../providers/auth_provider.dart';

class MobileNumVerifyScreen extends StatefulWidget {
  const MobileNumVerifyScreen({super.key});

  @override
  State<MobileNumVerifyScreen> createState() => _MobileNumVerifyScreenState();
}

class _MobileNumVerifyScreenState extends State<MobileNumVerifyScreen> {
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  FocusNode emailFN = FocusNode();

  ValueNotifier<bool> emailHasFocus = ValueNotifier<bool>(false);

  final AuthProvider provider = AuthProvider();

  @override
  void dispose() {
    //emailController.dispose();
    emailFN.dispose();
    emailFN.removeListener(provider.toggleEmailFocus);
    super.dispose();
  }

  String _selectedCountryCode = 'US +1';
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(isBackNeeded: true),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceSmall,
                  Text("Enter your phone\nnumber and verify",
                      style: TextFontStyle.headline32StyleOpenSansTextBold700),
                  UIHelper.verticalSpace12,
                  Text(
                    "To enhance the security of your account and our community, we require your phone number. This helps us prevent the creation of duplicate profiles and protect against fraudulent activities.",
                    style: TextFontStyle.headline12StyleOpenSansTextRegular400,
                  ),
                  UIHelper.verticalSpace16,
                  PhoneNumInputFeild(),
                  UIHelper.verticalSpace16,
                  RichText(
                    text: TextSpan(
                      style:
                          TextFontStyle.headline14StyleOpenSansTextRegular400,
                      children: [
                        const TextSpan(
                          text:
                              "We’ll text you a code to verify you’re really you. Message and data rates may apply. ",
                        ),
                        TextSpan(
                          text: "What happens if your number changes?",
                          style: const TextStyle(
                            color: Colors.blue, // Set color for clickable text
                            decoration: TextDecoration
                                .underline, // Add underline to indicate it's clickable
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace24,
                  ValueListenableBuilder(
                      valueListenable: isLoading,
                      builder: (context, value, child) {
                        return !isLoading.value
                            ? NextButton(
                                name: "Next",
                                style: TextFontStyle
                                    .headline16StyleOpenSansTextBold700Color4A4A4A,
                                onTap: () {
                                  _fwProcess();
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                ],
              ),
            ),
          ),
        ));
  }

  TextField PhoneNumInputFeild() {
    return TextField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        hintText: 'Phone Number',
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.cdfe1e6),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.cdfe1e6),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.cdfe1e6),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.cdfe1e6), // Active color
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedCountryCode,
              items: <String>['US +1', 'CA +1', 'IN +91'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountryCode = newValue!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  void _fwProcess() {
    if (formKey.currentState?.validate() ?? false) {
      log('Login From Validate true');
      NavigationService.navigateToReplacement(Routes.mobileOtp);
      isLoading.value = true;

      // Authenticated Successfully then Navigate To Home
      //NavigationService.navigateToReplacement(Routes.otp);
    } else {
      isLoading.value = false;
      log('Login From Validate false');
    }
  }
}
