import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joshgervais/common_widgets/custom_appbar.dart';
import 'package:joshgervais/constants/text_font_style.dart';
import 'package:joshgervais/gen/assets.gen.dart';
import 'package:joshgervais/helpers/all_routes.dart';
import 'package:joshgervais/helpers/navigation_service.dart';
import 'package:joshgervais/helpers/ui_helpers.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../gen/colors.gen.dart';

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isBackNeeded: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaultPadding()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.verticalSpaceSemiLarge,
            _buildCircularPercentage(percentage: 85),
            UIHelper.verticalSpaceSemiLarge,
            SvgPicture.asset(Assets.icons.wineGlasses),
            UIHelper.verticalSpace(80.h),
            Text(
              'We think you like this',
              style: TextFontStyle.headline30StyleNanumMyeongjoRegular.copyWith(
                  color: AppColors.cF4F4F4, height: 0.03, letterSpacing: -0.30),
            ),
            UIHelper.verticalSpace(32.h),
            Text(
              'Do you want to know in detail?',
              style: TextFontStyle.headline16StyleOpenSansTextSemiBold
                  .copyWith(color: AppColors.cF4F4F4, height: 0.09),
            ),
            UIHelper.verticalSpaceMedium,
            UIHelper.verticalSpaceMedium,
            customeButton(
              borderRadius: 12.r,
              color: AppColors.c131316,
              height: 56.h,
              minWidth: 140.w,
              name: 'Learn more',
              onCallBack: () {
                NavigationService.navigateTo(Routes.productDetails);
              },
              borderColor: AppColors.cFFFFFF,
              textStyle: TextFontStyle.headline16w600OpenSans,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Center _buildCircularPercentage({required int percentage}) {
    return Center(
      child: CircleAvatar(
        backgroundColor: AppColors.cFFFFFF,
        radius: 95.r,
        child: CircleAvatar(
          backgroundColor: AppColors.c000000,
          radius: 93.r,
          child: Text(
            '$percentage%',
            style: TextFontStyle.headline60StyleNanumMyeongjoRegular
                .copyWith(color: AppColors.cFFFFFF),
          ),
        ),
      ),
    );
  }
}
