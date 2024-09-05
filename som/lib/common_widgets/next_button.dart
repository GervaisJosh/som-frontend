import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class NextButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Color? color, textColor;
  final TextStyle? style;
  final double? radius;

  const NextButton({
    super.key,
    this.onTap,
    required this.name,
    this.height = 56,
    this.width = double.maxFinite,
    this.color = AppColors.cEDEDED,
    this.style,
    this.textColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: height?.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius ?? 6.r),
        ),
        child: Center(
            child: Text(
          name,
          style: style ??
              TextFontStyle.headline16StyleOpenSansTextBold700Color4A4A4A
                  .copyWith(color: textColor),
        )),
      ),
    );
  }
}
