// ignore_for_file: unused_field, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';
import 'navigation_service.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
final class UIHelper {
  UIHelper._();
  // Vertical spacing constants. Adjust to your liking.
  static final double _verticalSpaceSmall = 10.0.w;
  static final double _verticalSpaceMedium = 20.0.w;
  // ignore: unused_field
  static final double _verticalSpaceMediumLarge = 25.0.w;
  static final double _verticalSpaceSemiLarge = 40.0.w;
  static final double _verticalSpaceLarge = 60.0.w;
  static final double _verticalSpaceExtraLarge = 100.0.w;
  static final double _verticalSpace12 = 12.0.w;
  static final double _verticalSpace48 = 48.0.w;
  static final double _verticalSpace16 = 16.0.w;
  static final double _verticalSpace6 = 6.0.w;
  static final double _verticalSpace24 = 24.0.w;
  static final double _verticalSpace18 = 18.0.w;
  static final double _verticalSpace4 = 4.0.w;
  static final double _verticalSpace32 = 32.0.w;
  static final double _verticalSpace102 = 102.0.w;
  static final double _verticalSpace214 = 214.0.w;

  // Vertical spacing constants. Adjust to your liking.
  static final double _horizontalSpaceSmall = 10.0.h;
  static final double _horizontalSpace160 = 160.0.h;
  static final double _horizontalSpace6 = 6.0.h;
  static final double _horizontalSpaceMedium = 20.0.h;
  static final double _horizontalSpaceSemiLarge = 40.0.h;
  static final double _horizontalSpaceLarge = 60.0.h;

  static Widget verticalSpace12 = SizedBox(height: _verticalSpace12);
  static Widget verticalSpace6 = SizedBox(height: _verticalSpace6);
  static Widget verticalSpace4 = SizedBox(height: _verticalSpace4);
  static Widget verticalSpace16 = SizedBox(height: _verticalSpace16);
  static Widget verticalSpace18 = SizedBox(height: _verticalSpace18);
  static Widget verticalSpace24 = SizedBox(height: _verticalSpace24);
  static Widget verticalSpace32 = SizedBox(height: _verticalSpace32);
  static Widget verticalSpace48 = SizedBox(height: _verticalSpace48);
  static Widget verticalSpace102 = SizedBox(height: _verticalSpace48);
  static Widget verticalSpace214 = SizedBox(height: _verticalSpace214);
  static Widget verticalSpaceSmall = SizedBox(height: _verticalSpaceSmall);
  static Widget verticalSpaceMedium = SizedBox(height: _verticalSpaceMedium);
  static Widget verticalSpaceMediumLarge =
      SizedBox(height: _verticalSpaceMediumLarge);
  static Widget verticalSpaceSemiLarge =
      SizedBox(height: _verticalSpaceSemiLarge);
  static Widget verticalSpaceLarge = SizedBox(height: _verticalSpaceLarge);
  static Widget verticalSpaceExtraLarge =
      SizedBox(height: _verticalSpaceExtraLarge);

  static Widget horizontalSpaceSmall = SizedBox(width: _horizontalSpaceSmall);
  
  static Widget horizontalSpace6 = SizedBox(width: _horizontalSpace6);
  static Widget horizontalSpaceMedium = SizedBox(width: _horizontalSpaceMedium);
  static Widget horizontalSpace160 = SizedBox(width: _horizontalSpace160);
  static Widget horizontalSpaceSemiLarge =
      SizedBox(width: _horizontalSpaceSemiLarge);
  static Widget horizontalSpaceLarge = SizedBox(width: _horizontalSpaceLarge);

  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);

  static double safePadding() =>
      MediaQuery.of(NavigationService.context).padding.top;

  static Widget customDivider() => Container(
        height: .6.h,
        color: AppColors.c000000.withOpacity(.3),
        width: double.infinity,
      );
  static double kDefaultPadding() => 16.sp;
}
