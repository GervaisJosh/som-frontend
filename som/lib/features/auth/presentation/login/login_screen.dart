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
import '../../../../helpers/toast.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();

  ValueNotifier<bool> emailHasFocus = ValueNotifier<bool>(false);
  ValueNotifier<bool> passHasFocus = ValueNotifier<bool>(false);

  late final AuthProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);
    emailFN.addListener(provider.toggleEmailFocus);
    passFN.addListener(provider.togglePassFocus);
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    emailFN.dispose();
    passFN.dispose();
    emailFN.removeListener(provider.toggleEmailFocus);
    passFN.removeListener(provider.togglePassFocus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      emailController.text = "morshed@gmail.com";
      passController.text = "12345678";
    }

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              Text("Good to see you again",
                  style: TextFontStyle.headline24StyleOpenSansTextBold700),
              UIHelper.verticalSpaceSmall,
              Text(
                "Welcome back. Log In and\n continue your journey!",
                style: TextFontStyle.headline14StyleOpenSansTextRegular400
                    .copyWith(color: AppColors.cFFFFFF),
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(40.h),

              // Email Input Filled
              buildEmailInput(),
              UIHelper.verticalSpaceMedium,

              // Password Input Field
              buildPassInput(),
              UIHelper.verticalSpaceSmall,

              // Forgot Password
              // buildForgotPass(),
              UIHelper.verticalSpaceMedium,

              ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (context, value, child) {
                    return !isLoading.value
                        ? ActionButton(
                            name: "Log In",
                            onTap: () {
                              _loginMethod();
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

              UIHelper.verticalSpaceMedium,
              UIHelper.verticalSpaceLarge,

              // const Spacer(),

              // Signup Query
              buildRegisterQueryPanel(),
              UIHelper.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    ));
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
              color: AppColors.cFFFFFF, decoration: TextDecoration.underline),
        ),
      ),
    );
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
          textInputAction: TextInputAction.done,
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

  Row buildOrDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomDivider(color: AppColors.c000000),
        UIHelper.horizontalSpaceSmall,
        Text(
          "Or",
          style: TextFontStyle.headline16StyleOpenSansTextRegular400
              .copyWith(color: AppColors.c8993A4),
          textAlign: TextAlign.center,
        ),
        UIHelper.horizontalSpaceSmall,
        const CustomDivider(color: AppColors.c000000),
      ],
    );
  }

  Row buildRegisterQueryPanel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            NavigationService.navigateToReplacement(Routes.signup);
          },
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Don’t have an account?',
                  style: TextFontStyle.headline14StyleOpenSansTextRegular400
                      .copyWith(color: AppColors.c8993A4),
                ),
                WidgetSpan(child: UIHelper.horizontalSpace(4.w)),
                TextSpan(
                  text: 'Registration',
                  style:
                      TextFontStyle.headline14StyleOpenSansTextBold700.copyWith(
                    color: AppColors.cFFFFFF,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void _loginMethod() {
    if (formKey.currentState?.validate() ?? false) {
      log('Login From Validate true');
      isLoading.value = true;

      // Authentication Method
      // locator
      //     .get<Authentication>()
      //     .signInWhtEmailAndPass(
      //         emailController.text.trim(), passController.text)
      //     .then((value) async {
      //   isLoading.value = !isLoading.value;
      //   if (value != null) {
      //     log('user id is : ${value.uid}');

      //     // Local DB Save
      //     appData.write(kKeyIsLoggedIn, true);
      //     appData.write(kKeyUserID, value.uid);

      //     // User Creation
      //     locator
      //         .get<CreateUser>()
      //         .fetchAndSaveUserInfo(value.uid)
      //         .then((value) {
      //       isLoading.value = !isLoading.value;

      ToastUtil.showShortToast("Sign In Successfull ✔");

      //       // Authenticated Successfully then Navigate To Home
      NavigationService.navigateToReplacement(Routes.navigationScreen);
      //     });
      //   }
      //   }, onError: (e) {
      //     isLoading.value = !isLoading.value;
      //   });
      // } else {
      //   log('Login Form Validate False');
      //   isLoading.value = !isLoading.value;
      // }
    } else {
      isLoading.value = false;
      log('Login From Validate false');
    }
  }
}

class SocialLoginBtn extends StatelessWidget {
  final String path;
  final VoidCallback? onTap;

  const SocialLoginBtn({
    super.key,
    required this.path,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
        decoration: BoxDecoration(
          color: AppColors.c000000,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SvgPicture.asset(path),
      ),
    );
  }
}
