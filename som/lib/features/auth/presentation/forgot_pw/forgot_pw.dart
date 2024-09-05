// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/custome_textfield.dart';
import '../../../../common_widgets/next_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../providers/auth_provider.dart';

class ForgotPwWithEmailScreen extends StatefulWidget {
  const ForgotPwWithEmailScreen({super.key});

  @override
  State<ForgotPwWithEmailScreen> createState() =>
      _ForgotPwWithEmailScreenState();
}

class _ForgotPwWithEmailScreenState extends State<ForgotPwWithEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  FocusNode emailFN = FocusNode();

  ValueNotifier<bool> emailHasFocus = ValueNotifier<bool>(false);

  late final AuthProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);
    emailFN.addListener(provider.toggleEmailFocus);
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFN.dispose();
    emailFN.removeListener(provider.toggleEmailFocus);
    super.dispose();
  }

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

                  Text("Enter your email",
                      style: TextFontStyle.headline32StyleOpenSansTextBold700),
                  UIHelper.verticalSpaceSmall,
                  UIHelper.verticalSpaceMedium,

                  // Email Input Filled
                  buildEmailInput(),
                  UIHelper.verticalSpaceMedium,

                  Text(
                    "We’ll mail you a code to verify you’re really you.",
                    style: TextFontStyle.headline14StyleOpenSansTextRegular400,
                  ),
                  UIHelper.verticalSpaceSemiLarge,
                  UIHelper.verticalSpaceSmall,

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

  Consumer<AuthProvider> buildEmailInput() {
    return Consumer<AuthProvider>(builder: (context, hasFocus, _) {
      return CustomFormField(
        textEditingController: emailController,
        hintText: 'Email Address',
        inputType: TextInputType.name,
        textInputAction: TextInputAction.done,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10.sp),
          child: SvgPicture.asset(
            Assets.icons.message,

            // Implement prefix icon highligh while focus enabled
            color: (provider.emailHasFocus ||
                    emailController.text.trim().isNotEmpty)
                ? AppColors.c22252D
                : AppColors.c8993A4,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
        focusNode: emailFN,
      );
    });
  }

  void _fwProcess() {
    if (formKey.currentState?.validate() ?? false) {
      log('Login From Validate true');
      isLoading.value = true;

      // Authenticated Successfully then Navigate To Home
      NavigationService.navigateToReplacement(Routes.otp);
    } else {
      isLoading.value = false;
      log('Login From Validate false');
    }
  }
}
