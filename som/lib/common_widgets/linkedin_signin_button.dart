import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class LinkedinSigninButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const LinkedinSigninButton({
    super.key,
    this.onTap,
    required this.name,
    this.height = 56,
    this.width = double.maxFinite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height?.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.c00C9E4, AppColors.c3EE1D0],
          ),
          borderRadius: BorderRadius.circular(6.h),
        ),
        child: Container(
          width: width,
          height: height?.h,
          margin: EdgeInsets.all(1.sp), // Margin for the thin stroke effect
          decoration: BoxDecoration(
            color: Colors.white, // Inner container background color
            borderRadius: BorderRadius.circular(6.h),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.linkedin),
              UIHelper.horizontalSpaceMedium,
              Text(
                name,
                style: TextFontStyle.headline16StyleOpenSansTextBold700,
              ),
            ],
          ),
        ),
      ),
    );
  
  
  }
}
