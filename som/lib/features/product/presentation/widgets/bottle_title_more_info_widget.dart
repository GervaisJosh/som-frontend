// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/custom_rating.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class BottoleTitleMoreInfoWidget extends StatelessWidget {
  final String bottoleImage;
  final String bottoleTitle;
  final String compatibility;
  final String type;
  final String region;
  const BottoleTitleMoreInfoWidget({
    required this.bottoleImage,
    required this.bottoleTitle,
    required this.compatibility,
    required this.type,
    required this.region,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          bottoleImage,
          width: 120,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bottoleTitle,
                style: TextFontStyle.headline24w400nanumMyeongjo,
              ),
              UIHelper.verticalSpace16,
              Text(
                'Compatibility Score: $compatibility%',
                style: TextFontStyle.headline16w600OpenSans,
              ),
              UIHelper.verticalSpace(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomRatingWidget(
                    rating: 5,
                    selectableMood: false,
                    deafultRatingColor: AppColors.c000000,
                  ),
                  UIHelper.horizontalSpace(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5.0 (758 Reviews)',
                        style: TextFontStyle.headline13w400OpenSans,
                      ),
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'Type: ',
                        style: TextFontStyle.headline13w400OpenSans
                            .copyWith(fontSize: 14.sp),
                      ),
                      UIHelper.verticalSpace(4.h),
                      Text(
                        type,
                        style: TextFontStyle.headline16w400OpenSans,
                      ),
                      UIHelper.verticalSpace16,
                      Text(
                        'Region:',
                        style: TextFontStyle.headline13w400OpenSans
                            .copyWith(fontSize: 14.sp),
                      ),
                      UIHelper.verticalSpace4,
                      Text(
                        region,
                        style: TextFontStyle.headline16w400OpenSans,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
