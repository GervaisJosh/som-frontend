import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import 'subtitle.dart';
import 'title.dart';

class PartnerInfo extends StatelessWidget {
  const PartnerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 11.sp, top: 70.sp),
      width: double.infinity,
      height: 230.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: LinearGradient(
            colors: [
              Colors.transparent,
              const Color(0xFF000000).withOpacity(0.8),
              const Color(0xFF000000)
            ],
            stops: const [
              0.4,
              0.8,
              1
            ], // Defines the point where the gradient ends and the solid color begins
            begin: const Alignment(0.00, -1.00),
            end: const Alignment(0, -.1)),
      ),
      child: Column(children: [
        const TitleWidget(),
        UIHelper.verticalSpaceSmall,
        SubTitle(svg: Assets.icons.home2, text: 'Washington DC, US'),
        UIHelper.verticalSpaceSmall,
        SubTitle(svg: Assets.icons.find, text: 'Looking for'),
        UIHelper.verticalSpaceSmall,
        SubTitle(svg: Assets.icons.job, text: 'CloudPulse')
      ]),
    );
  }
}
