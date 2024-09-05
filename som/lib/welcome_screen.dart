import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joshgervais/common_widgets/action_button.dart';
import 'package:joshgervais/constants/text_font_style.dart';
import 'package:joshgervais/helpers/all_routes.dart';
import 'package:joshgervais/helpers/navigation_service.dart';
import 'package:joshgervais/helpers/ui_helpers.dart';

import 'gen/assets.gen.dart';
import 'gen/colors.gen.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.c131316),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaultPadding()),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Elegance & soul of a best wine",
                    style: TextFontStyle.headline32StylePlayFairSemiBold
                        .copyWith(height: 84 / 48),
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(16.h),
                  Text(
                    "Explore the finest selection of wines.",
                    style: TextFontStyle.headline16StyleOpenSansTextRegular400
                        .copyWith(color: AppColors.cc2c2c2, height: 26 / 16),
                    textAlign: TextAlign.left,
                  ),
                  UIHelper.verticalSpaceSemiLarge,
                  Image.asset(Assets.images.splashWine.path, height: 377.h),
                  UIHelper.verticalSpace(32.h),
                  ActionButton(
                    name: "Get Started",
                    onTap: () {
                      NavigationService.navigateTo(Routes.login);
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
