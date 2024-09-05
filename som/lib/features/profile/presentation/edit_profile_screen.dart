// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joshgervais/common_widgets/custom_appbar.dart';
import 'package:joshgervais/helpers/helper_methods.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/action_button.dart';
import '../../../common_widgets/custome_textfield.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../providers/auth_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  late final AuthProvider provider;
  // State variable to hold the selected image
  final ValueNotifier<XFile?> _profileImageFileNotifier =
      ValueNotifier<XFile?>(null);

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

  String userImageUrl =
      "https://s3-alpha-sig.figma.com/img/6f17/c74f/3c887534739bc6248e0cde56f0f790c3?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mLc6JbRweSVk9NIlUW6-jBbN8c3KYmLWQdRTDRoP1S4o1i9bS8dltAAKEPkeaPZEpG9RaSYY8r9CpIXcz~B7i-zs-S9UoE3NSEgiwbAqGqcziowxotqFpmAMIsVltMgdncYVRTkxAIvINC0UP1mBBbRNYY1Rt2cgxxBDey-bhyGGzyXA3KxwtnIQPfZTkRRO7HFiPBXUQrrfS45BWAom3TQjYlSymWfy7VrMfe1DdWp4MHu3NdxrYy726105jZ6H9lrmCdBAIuvWSrPC~2oOA7li4trVQuO9hs4VA3p-413v6eeMi7sFjlI-Ti2kylWYRFdfN3gdGu~PrFzCqOXY9g__";

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

    _profileImageFileNotifier.dispose();
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
      appBar: const CustomAppBar(
          title: "Edit Profile", centerTitle: true, isBackNeeded: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(40.h),

            profileImageSection(),
            UIHelper.verticalSpace32,

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

            ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (context, value, child) {
                  return !isLoading.value
                      ? ActionButton(
                          name: "Save",
                          onTap: () {},
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }),
            UIHelper.verticalSpaceMediumLarge,
          ],
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

  Widget profileImageSection() {
    return Stack(
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.antiAlias,
      children: [
        CircleAvatar(
          radius: 76.r,
          backgroundColor: AppColors.cFFFFFF,
          child: CircleAvatar(
            radius: 74.r,
            backgroundColor: AppColors.cF4F5F7,
            child: ValueListenableBuilder<XFile?>(
              valueListenable: _profileImageFileNotifier,
              builder: (context, profile, child) {
                if (profile != null) {
                  return ClipOval(
                    child: Image.file(File(profile.path),
                        height: 150.h, width: 150.h, fit: BoxFit.cover),
                  );
                } else {
                  return ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: userImageUrl,
                      height: 150.h,
                      width: 150.h,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            ),
          ),
        ),
        Positioned(
          bottom: 8.h,
          right: 8.w,
          child: GestureDetector(
            onTap: () {
              showPickImageBottomSheet(
                  context, null, _profileImageFileNotifier);
            },
            child: Container(
              padding: EdgeInsets.all(1.sp),
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.cFFFFFF,
              ),
              child: SvgPicture.asset(Assets.icons.circularProfileEdit,
                  height: 32.h),
            ),
          ),
        )
      ],
    );
  }
}
