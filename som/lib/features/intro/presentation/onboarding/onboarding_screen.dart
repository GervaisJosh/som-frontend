import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/custom_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          // BG Image
          // Image.asset(
          //   Assets.images.onboarding.path,
          //   height: double.maxFinite,
          //   width: double.maxFinite,
          //   fit: BoxFit.cover,
          // ),

          // Desc Content
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: content(context),
          ),
        ],
      ),
    );
  }

  Padding content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        children: [
          // Title
          Text(
            "Inclusive, Reliable, Safe",
            style: TextFontStyle.headline24StyleOpenSansTextBold700,
            textAlign: TextAlign.left,
          ),
          UIHelper.verticalSpaceMedium,

          // Desc
          Text(
            "Our app solves a big problem in your business by finding a business partner. It's user-friendly and packed with features. Let's team up to grow fast and dominate the market!",
            style: TextFontStyle.headline14StyleOpenSansTextMedium500,
            textAlign: TextAlign.center,
          ),

          UIHelper.verticalSpaceSmall,
          UIHelper.verticalSpaceSemiLarge,

          // Get Started Button
          customeButton(
            name: "Get Started",
            onCallBack: () {
              NavigationService.navigateToReplacement(
                  Routes.mobileNumVerifyScreen);
            },
            height: 56.h,
            minWidth: double.maxFinite,
            borderRadius: 180.r,
            color: Colors.white,
            borderColor: Colors.white,
            textStyle: TextFontStyle.headline16StyleOpenSansTextBold700,
            context: context,
          ),
        ],
      ),
    );
  }
}
