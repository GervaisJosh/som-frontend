import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';

class ReviewandAllReviewSection extends StatelessWidget {
  final String? reviewCountDown;
  final VoidCallback? onTap;
  const ReviewandAllReviewSection({
    this.onTap,
    this.reviewCountDown,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews ($reviewCountDown)',
          style: TextFontStyle.headline16w600OpenSans,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'All Reviews',
            style: TextFontStyle.headline13w400OpenSans.copyWith(
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

