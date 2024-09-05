import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class TermsAndPrivacyText extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyPolicyTap;

  const TermsAndPrivacyText({
    super.key,
    required this.onTermsTap,
    required this.onPrivacyPolicyTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'I agree with ',
        style: TextFontStyle.headline14StyleOpenSansTextRegular400Color22252D,
        children: [
          TextSpan(
            text: 'Terms',
            style: TextFontStyle.headline12StyleOpenSansTextBold700
                .copyWith(color: AppColors.c15D1DD),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          TextSpan(
            text: ' and ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextFontStyle.headline12StyleOpenSansTextBold700
                .copyWith(color: AppColors.c15D1DD),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyPolicyTap,
          ),
        ],
      ),
    );
  }
}
