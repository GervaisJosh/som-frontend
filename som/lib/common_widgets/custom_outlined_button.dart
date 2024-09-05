import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const CustomOutlinedButton({
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
        alignment: Alignment.center,
        margin: EdgeInsets.all(1.5.sp), // Margin for the thin stroke effect
        decoration: BoxDecoration(
          color: AppColors.c131316, // Inner container background color
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          name,
          style: TextFontStyle.headline16StyleOpenSansTextSemiBold
              .copyWith(color: AppColors.cFFFFFF),
        ),
      ),
    );
  }
}
