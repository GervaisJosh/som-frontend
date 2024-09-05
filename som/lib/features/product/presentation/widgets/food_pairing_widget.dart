import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';

class FoodPairingWidget extends StatelessWidget {
  const FoodPairingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FoodParingWidget(
          imageName: Assets.icons.beef.path,
          name: 'Beef',
        ),
        FoodParingWidget(
          imageName: Assets.icons.lamb.path,
          name: 'Lamb',
        ),
        FoodParingWidget(
          imageName: Assets.icons.duck.path,
          name: 'Duck',
        ),
        FoodParingWidget(
          imageName: Assets.icons.squid.path,
          name: 'Squid',
        ),
      ],
    );
  }
}


class FoodParingWidget extends StatelessWidget {
  final String imageName;
  final String name;
  const FoodParingWidget({
    required this.imageName,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageName,
          width: 40.w,
        ),
        Text(
          name,
          style: TextFontStyle.headline13w400OpenSans.copyWith(fontSize: 14.sp),
        )
      ],
    );
  }
}
