import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../gen/assets.gen.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circularBorder(Assets.icons.reload),
        circularBorder(Assets.icons.premium),
      ],
    );
  }

  Container circularBorder(String svg) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: const ShapeDecoration(
          shape: OvalBorder(
        side: BorderSide(width: 1, color: Colors.white),
      )),
      child: Padding(
          padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(svg)),
    );
  }
}
