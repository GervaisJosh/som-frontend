
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SubTitle extends StatelessWidget {
  final String? svg;
  final String? text;

  const SubTitle({super.key, this.svg, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(svg!),
        UIHelper.horizontalSpaceSmall,
        Text(text!,
            textAlign: TextAlign.center,
            style: TextFontStyle.headline12StyleMontserrat
                .copyWith(color: AppColors.cB3B3B3)),
      ],
    );
  }
}
