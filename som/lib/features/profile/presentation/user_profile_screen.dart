import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joshgervais/common_widgets/custom_appbar.dart';
import 'package:joshgervais/helpers/all_routes.dart';
import 'package:joshgervais/helpers/navigation_service.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userImageUrl =
        "https://s3-alpha-sig.figma.com/img/6f17/c74f/3c887534739bc6248e0cde56f0f790c3?Expires=1719792000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mLc6JbRweSVk9NIlUW6-jBbN8c3KYmLWQdRTDRoP1S4o1i9bS8dltAAKEPkeaPZEpG9RaSYY8r9CpIXcz~B7i-zs-S9UoE3NSEgiwbAqGqcziowxotqFpmAMIsVltMgdncYVRTkxAIvINC0UP1mBBbRNYY1Rt2cgxxBDey-bhyGGzyXA3KxwtnIQPfZTkRRO7HFiPBXUQrrfS45BWAom3TQjYlSymWfy7VrMfe1DdWp4MHu3NdxrYy726105jZ6H9lrmCdBAIuvWSrPC~2oOA7li4trVQuO9hs4VA3p-413v6eeMi7sFjlI-Ti2kylWYRFdfN3gdGu~PrFzCqOXY9g__";

    return Scaffold(
      appBar: const CustomAppBar(title: "olivia_james18"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaultPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceMedium,
            _buildCircleProfile(userImageUrl),
            UIHelper.verticalSpace(16.h),
            GestureDetector(
              onTap: () {
                NavigationService.navigateTo(Routes.editProfile);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Edit Profile',
                    style: TextFontStyle.headline16StyleOpenSansTextSemiBold
                        .copyWith(
                      color: AppColors.cE0E0E0,
                      height: 0.12,
                      letterSpacing: -0.12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  UIHelper.horizontalSpace(4.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.sp),
                    child: SvgPicture.asset(Assets.icons.edit2, height: 16.sp),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(50.h),
            Text(
              'Olivia James',
              style: TextFontStyle.headline26StyleNanumMyeongjoRegular.copyWith(
                  color: AppColors.cECECEC, height: 0.05, letterSpacing: -0.26),
            ),
            UIHelper.verticalSpaceSmall,
            Text(
              'Current server at Rosie’s, with a slight obsession with Italian Pet Nat',
              style: TextFontStyle.headline14StyleOpenSansRegular.copyWith(
                color: AppColors.cE0E0E0,
                letterSpacing: -0.14,
              ),
            ),
            UIHelper.verticalSpaceMedium,
            UIHelper.verticalSpaceMedium,
            Text(
              'Favorite Wines ',
              style: TextFontStyle.headline16StyleOpenSansTextSemiBold.copyWith(
                  color: AppColors.cFFFFFF, height: 0.08, letterSpacing: -0.16),
            ),
            UIHelper.verticalSpaceMedium,
            _buildImagesSection(
              img1: Assets.images.img1.path,
              img2: Assets.images.img2.path,
              img3: Assets.images.img3.path,
            ),
            UIHelper.verticalSpaceMedium,
            _buildImagesSection(
              img1: Assets.images.img4.path,
              img2: Assets.images.img5.path,
              img3: Assets.images.img6.path,
            ),
            UIHelper.verticalSpaceMedium,
            _buildImagesSection(
              img1: Assets.images.img7.path,
              img2: Assets.images.img8.path,
              img3: Assets.images.img9.path,
            ),
            UIHelper.verticalSpaceMedium,
            _buildImagesSection(
              img1: Assets.images.img1.path,
              img2: Assets.images.img2.path,
              img3: Assets.images.img3.path,
            ),
            UIHelper.verticalSpaceMedium,
          ],
        ),
      ),
    );
  }

  Row _buildImagesSection(
      {required String img1, required String img2, required String img3}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(img1),
        ),
        UIHelper.horizontalSpace(12.w),
        Expanded(
          flex: 1,
          child: Image.asset(img2),
        ),
        UIHelper.horizontalSpace(12.w),
        Expanded(
          flex: 1,
          child: Image.asset(img3),
        ),
      ],
    );
  }

  Center _buildCircleProfile(String userImageUrl) {
    return Center(
      child: CircleAvatar(
        radius: 60.r, // Set the radius as per your requirement
        child: CircleAvatar(
          radius: 58.r, // Set the radius as per your requirement
          backgroundImage: CachedNetworkImageProvider(
              userImageUrl), // userImageUrl should be the URL of the image
        ),
      ),
    );
  }
}
