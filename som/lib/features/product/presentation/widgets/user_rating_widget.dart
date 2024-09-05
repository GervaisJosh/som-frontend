
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/custom_rating.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class UserRatingWidget extends StatelessWidget {
  final String ratingTitle;
  final String userImage;
  final String userName;
  final String date;
  const UserRatingWidget({
    required this.ratingTitle,
    required this.userImage,
    required this.date,
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: AppColors.c070708, borderRadius: BorderRadius.circular(6.r)),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRatingWidget(
              rating: 5,
              deafultRatingColor: AppColors.c2C2C2C,
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              ratingTitle,
              // "“I really liked it. Perhaps the best wine I’ve ever tasted.”",
              style: TextFontStyle.headline16w400OpenSans
                  .copyWith(color: AppColors.c97A0AF),
            ),
            UIHelper.verticalSpace(16.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 30.sp,
                  backgroundImage: AssetImage(userImage),
                ),
                UIHelper.horizontalSpace(16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextFontStyle.headline16w400OpenSans,
                    ),
                    UIHelper.verticalSpace4,
                    Text(
                      date,
                      style: TextFontStyle.headline13w400OpenSans
                          .copyWith(fontSize: 12.sp),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
