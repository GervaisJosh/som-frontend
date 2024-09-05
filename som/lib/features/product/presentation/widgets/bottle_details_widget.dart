
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class BottoleDetailsWidget extends StatelessWidget {
  final String? detailsType;
  final String? details;
  const BottoleDetailsWidget({
    this.detailsType,
    this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextFontStyle.headline16w600OpenSans,
        children: <InlineSpan>[
          TextSpan(
            text: detailsType,
            style: TextFontStyle.headline16w600OpenSans,
          ),
          WidgetSpan(child: UIHelper.horizontalSpace(8.w)),
          TextSpan(
            text: details,
            style: TextFontStyle.headline16w400OpenSans
                .copyWith(color: AppColors.c97A0AF),
          ),
        ],
      ),
    );
  }
}
