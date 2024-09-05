import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Henry Johnson',
          textAlign: TextAlign.center,
          style: TextFontStyle.headline24StyleOpenSansTextBold700,
        ),
        UIHelper.horizontalSpaceSmall,
        Container(
          alignment: Alignment.center,
          width: 12.w,
          height: 12.h,
          decoration: const ShapeDecoration(
            color: Color(0xFF00FF92),
            shape: OvalBorder(),
          ),
        )
      ],
    );
  }
}
