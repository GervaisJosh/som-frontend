// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/action_button.dart';
import '../../../../common_widgets/custom_divider.dart';
import '../../../../common_widgets/custome_textfield.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../providers/auth_provider.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  late final AuthProvider provider;

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();
  final TextEditingController fnController = TextEditingController();

  // Action Loading
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Focus Nodes
  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();
  FocusNode confPassFN = FocusNode();
  FocusNode fullNameFN = FocusNode();

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);

    // Listeners
    emailFN.addListener(provider.toggleEmailFocus);
    passFN.addListener(provider.togglePassFocus);
    confPassFN.addListener(provider.toggleConfPassFocus);
    fullNameFN.addListener(provider.toggleFullNameFocus);
  }

  @override
  void dispose() {
    // Controllers
    emailController.dispose();
    passController.dispose();
    confPassController.dispose();
    fnController.dispose();

    // Focus Nodes
    emailFN.dispose();
    passFN.dispose();
    confPassFN.dispose();
    fullNameFN.dispose();

    // Listeners
    emailFN.removeListener(provider.toggleEmailFocus);
    passFN.removeListener(provider.togglePassFocus);
    confPassFN.removeListener(provider.toggleConfPassFocus);
    fullNameFN.removeListener(provider.toggleFullNameFocus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      fnController.text = "Margub Morshed";
      emailController.text = "morshed@gmail.com";
      passController.text = "12345678";
      confPassController.text = "12345678";
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UIHelper.verticalSpaceLarge,
                UIHelper.verticalSpaceSmall,
                Text(
                  "LOGO",
                  style: TextFontStyle.headline32StylePlayFairSemiBold
                      .copyWith(color: AppColors.cFFFFFF, height: 42 / 32),
                ),
                // Center(child: showMainLogo()),
                UIHelper.verticalSpaceMedium,
                Text(
                  "Welcome",
                  style: TextFontStyle.headline24StyleOpenSansTextBold700,
                ),
                UIHelper.verticalSpaceSmall,
                Text(
                  "Please register to start your journey",
                  style: TextFontStyle.headline14StyleOpenSansTextRegular400
                      .copyWith(color: AppColors.cFFFFFF),
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpace(40.h),

                // Full Name Input Field
                buildFullNameInput(),
                UIHelper.verticalSpaceMedium,

                // Email Input Field
                buildEmailInput(),
                UIHelper.verticalSpaceMedium,

                // Password Input Field
                buildPassInput(),
                UIHelper.verticalSpaceMedium,

                // Password Input Field
                buildConfPassInput(),
                UIHelper.verticalSpaceSmall,
                UIHelper.verticalSpaceMedium,

                // // Agree terms & condition
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     // T&C Checkbox
                //     Consumer<AuthProvider>(
                //       builder: (context, provider, child) {
                //         return CustomCheckbox(
                //           isChecked: provider.isSignInChecked,
                //           onChanged: (changedVal) {
                //             provider.toggleSignInCheckbox();
                //           },
                //         );
                //       },
                //     ),
                //     UIHelper.horizontalSpace(5.w),
                //     TermsAndPrivacyText(
                //       onTermsTap: () {
                //         log("Terms Pressed");
                //       },
                //       onPrivacyPolicyTap: () {
                //         log("Privacy Pressed");
                //       },
                //     )
                //   ],
                // ),
                // UIHelper.verticalSpaceMedium,

                ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder: (context, value, child) {
                      return !isLoading.value
                          ? ActionButton(
                              name: "Register",
                              onTap: () {
                                _signInMethod();
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
                UIHelper.verticalSpaceMediumLarge,

                // Divider - Or - Divider
                buildOrDivider(),
                UIHelper.verticalSpaceMediumLarge,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginBtn(path: Assets.icons.google),
                    UIHelper.horizontalSpace(16.w),
                    SocialLoginBtn(path: Assets.icons.fb),
                    UIHelper.horizontalSpace(16.w),
                    SocialLoginBtn(path: Assets.icons.x),
                  ],
                ),
                UIHelper.verticalSpaceMediumLarge,

                // Signup Query
                buildAccExistQueryPanel(),
                UIHelper.verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align buildForgotPass() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          NavigationService.navigateTo(Routes.forogotPWEmail);
        },
        child: Text(
          'Forgot password?',
          style: TextFontStyle.headline14StyleOpenSansTextRegular400.copyWith(
            color: AppColors.c22252D,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Consumer<AuthProvider> buildFullNameInput() {
    return Consumer<AuthProvider>(builder: (context, provider, _) {
      return CustomFormField(
        textEditingController: fnController,
        hintText: 'Full Name',
        inputType: TextInputType.name,
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 8.w, right: 4.w),
          padding: EdgeInsets.all(3.sp),
          child: SvgPicture.asset(
            Assets.icons.profileTf,

            // Implement prefix icon highligh while focus enabled
            color: (provider.fnHasFocus || fnController.text.trim().isNotEmpty)
                ? AppColors.cFFFFFF
                : AppColors.c8993A4,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your full name';
          }
          return null;
        },
        focusNode: fullNameFN,
      );
    });
  }

  Consumer<AuthProvider> buildEmailInput() {
    return Consumer<AuthProvider>(builder: (context, hasFocus, _) {
      return CustomFormField(
        textEditingController: emailController,
        hintText: 'Email Address',
        inputType: TextInputType.name,
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 8.w, right: 4.w),
          padding: EdgeInsets.all(5.sp),
          child: SvgPicture.asset(
            Assets.icons.email,

            // Implement prefix icon highligh while focus enabled
            color: (provider.emailHasFocus ||
                    emailController.text.trim().isNotEmpty)
                ? AppColors.cFFFFFF
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

  Consumer<AuthProvider> buildPassInput() {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return CustomFormField(
          textEditingController: passController,
          hintText: 'Password',
          isObsecure: provider.isPassVisible,
          isPass: true,
          inputType: TextInputType.visiblePassword,
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 8.w, right: 4.w),
            padding: EdgeInsets.all(6.sp),
            child: SvgPicture.asset(
              Assets.icons.lock,

              // Implement prefix icon highligh while focus enabled
              color: (provider.passHasFocus ||
                      passController.text.trim().isNotEmpty)
                  ? AppColors.cFFFFFF
                  : AppColors.c8993A4,
            ),
          ),

          // Suffix Icon to Show And Hide Password
          suffixIcon: GestureDetector(
            onTap: () {
              provider.togglePassVisibility();
            },
            child: Container(
              padding: EdgeInsets.all(8.sp),
              margin: EdgeInsets.only(right: 8.w),
              child: SvgPicture.asset(
                provider.isPassVisible
                    ? Assets.icons.eyeClose
                    : Assets.icons.eye,

                // Implement suffix icon highligh while focus enabled
                color: (provider.passHasFocus ||
                        passController.text.trim().isNotEmpty)
                    ? AppColors.cFFFFFF
                    : AppColors.c8993A4,
              ),
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
                  ? AppColors.cFFFFFF
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
                      confPassController.text.trim().isNotEmpty)
                  ? AppColors.cFFFFFF
                  : AppColors.c8993A4,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your confirm password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            if (value.trim() != passController.text.trim()) {
              return "Both password need's to be matched";
            }
            return null;
          },
          focusNode: confPassFN,
        );
      },
    );
  }

  Row buildOrDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomDivider(color: AppColors.c000000),
        UIHelper.horizontalSpaceSmall,
        Text(
          "Or",
          style: TextFontStyle.headline16StyleOpenSansTextRegular400,
          textAlign: TextAlign.center,
        ),
        UIHelper.horizontalSpaceSmall,
        const CustomDivider(color: AppColors.c000000),
      ],
    );
  }

  Row buildAccExistQueryPanel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            NavigationService.navigateToReplacement(Routes.login);
          },
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an account?',
                  style: TextFontStyle.headline14StyleOpenSansTextRegular400
                    ..copyWith(color: AppColors.c8993A4),
                ),
                WidgetSpan(child: UIHelper.horizontalSpace(4.w)),
                TextSpan(
                  text: 'Log In',
                  style: TextFontStyle.headline14StyleOpenSansTextBold700
                      .copyWith(
                          color: AppColors.cFFFFFF,
                          decoration: TextDecoration.underline),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void _signInMethod() {
    // if (Provider.of<AuthProvider>(context, listen: false).isSignInChecked) {
    if (formKey.currentState?.validate() ?? false) {
      log('Form Validate true');

      // Uncheck the T&C checkbox (Need to place it before navigation)
      Provider.of<AuthProvider>(context, listen: false).disposeSignInCheckbox();

      // Loading Start's
      isLoading.value = true;
      NavigationService.navigateTo(Routes.navigationScreen);
      isLoading.value = false;

      // locator
      //     .get<Authentication>()
      //     .signInWhtEmailAndPass(
      //         emailController.text.trim(), passController.text)
      //     .then((value) async {

      // // Loading Stop's
      //   isLoading.value = false;

      // // Credential Saved in Local DB
      //   if (value != null) {
      //     log('user id is : ${value.uid}');
      //     appData.write(kKeyIsLoggedIn, true);
      //     appData.write(kKeyUserID, value.uid);
      //     locator
      //         .get<CreateUser>()
      //         .fetchAndSaveUserInfo(value.uid)
      //         .then((value) {
      //       isLoading.value = !isLoading.value;
      //       NavigationService.navigateToReplacement(
      //         Routes.dashboard,
      //       );
      //     });
      //   }
      // }, onError: (e) {
      //   isLoading.value = !isLoading.value;
      // });
    } else {
      log('Form Validate False');
      isLoading.value = false;
    }
    // } else {
    //   isLoading.value = false;
    //   ToastUtil.showShortToast('Plese Agree Our Terms & Conditions');
    // }
  }
}
