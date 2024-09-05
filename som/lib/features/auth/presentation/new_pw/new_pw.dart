// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../common_widgets/action_button.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/custome_textfield.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/helper_methods.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../providers/auth_provider.dart';

class NewPwScreen extends StatefulWidget {
  const NewPwScreen({super.key});

  @override
  State<NewPwScreen> createState() => _ForgotPwScreenState();
}

class _ForgotPwScreenState extends State<NewPwScreen> {
  final formKey = GlobalKey<FormState>();
  late final AuthProvider provider;

  // Controller's
  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Focus Visibility Portion
  FocusNode passFN = FocusNode();
  FocusNode confPassFN = FocusNode();

  ValueNotifier<bool> passHasFocus = ValueNotifier<bool>(false);
  ValueNotifier<bool> confPassHasFocus = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);

    // Listener's
    passFN.addListener(provider.togglePassFocus);
    confPassFN.addListener(provider.toggleConfPassFocus);
  }

  @override
  void dispose() {
    // Controller's
    passController.dispose();
    confPassController.dispose();

    // Focus Node's
    passFN.dispose();
    confPassFN.dispose();

    // Listener's
    passFN.removeListener(provider.togglePassFocus);
    confPassFN.removeListener(provider.toggleConfPassFocus);
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

                  Text("Enter New Password",
                      style: TextFontStyle.headline32StyleOpenSansTextBold700),
                  UIHelper.verticalSpaceSmall,
                  UIHelper.verticalSpaceMedium,

                  // Password Input Field
                  buildPassInput(),
                  UIHelper.verticalSpaceMedium,

                  // Confirm Password Input Field
                  buildConfPassInput(),
                  UIHelper.verticalSpaceSemiLarge,

                  ValueListenableBuilder(
                      valueListenable: isLoading,
                      builder: (context, value, child) {
                        return !isLoading.value
                            ? ActionButton(
                                name: "Sign In",
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

  Consumer<AuthProvider> buildPassInput() {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return CustomFormField(
          textEditingController: passController,
          hintText: 'Password',
          isObsecure: provider.isPassVisible,
          isPass: true,
          inputType: TextInputType.visiblePassword,
          onFieldSubmitted: (p0) {
            // Directly jump into confirm password while tap enter on the password input
            changeFocus(context: context, current: passFN, next: confPassFN);
          },
          prefixIcon: Padding(
            padding: EdgeInsets.all(10.sp),
            child: SvgPicture.asset(
              Assets.icons.lock,

              // Implement prefix icon highligh while focus enabled
              color: (provider.passHasFocus ||
                      passController.text.trim().isNotEmpty)
                  ? AppColors.c22252D
                  : AppColors.c8993A4,
            ),
          ),

          // Suffix Icon to Show And Hide Password
          suffixIcon: IconButton(
            onPressed: () {
              provider.togglePassVisibility();
            },
            icon: SvgPicture.asset(
              provider.isPassVisible ? Assets.icons.eyeClose : Assets.icons.eye,

              // Implement suffix icon highligh while focus enabled
              color: (provider.passHasFocus ||
                      passController.text.trim().isNotEmpty)
                  ? AppColors.c22252D
                  : AppColors.c8993A4,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
          focusNode: passFN,
        );
      },
    );
  }

  Consumer<AuthProvider> buildConfPassInput() {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return CustomFormField(
          textEditingController: confPassController,
          hintText: 'Confirm Password',
          isObsecure: provider.isConfPassVisible,
          isPass: true,
          textInputAction: TextInputAction.done,
          inputType: TextInputType.visiblePassword,
          prefixIcon: Padding(
            padding: EdgeInsets.all(10.sp),
            child: SvgPicture.asset(
              Assets.icons.lock,

              // Implement prefix icon highligh while focus enabled
              color: (provider.confPassHasFocus ||
                      confPassController.text.trim().isNotEmpty)
                  ? AppColors.c22252D
                  : AppColors.c8993A4,
            ),
          ),

          // Suffix Icon to Show And Hide Password
          suffixIcon: IconButton(
            onPressed: () {
              provider.toggleConfPassVisibility();
            },
            icon: SvgPicture.asset(
              provider.isConfPassVisible
                  ? Assets.icons.eyeClose
                  : Assets.icons.eye,

              // Implement suffix icon highligh while focus enabled
              color: (provider.confPassHasFocus ||
                      passController.text.trim().isNotEmpty)
                  ? AppColors.c22252D
                  : AppColors.c8993A4,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your confirm password';
            }
            if (value.length < 6) {
              return 'Confirm password must be at least 6 characters long';
            }
            if (value != passController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          focusNode: confPassFN,
        );
      },
    );
  }

  void _fwProcess() {
    if (formKey.currentState?.validate() ?? false) {
      log('Login From Validate true');
      isLoading.value = true;

      // Authenticated Successfully then Navigate To Home
      NavigationService.navigateToReplacement(Routes.login);
    } else {
      isLoading.value = false;
      log('Login From Validate false');
    }
  }
}
