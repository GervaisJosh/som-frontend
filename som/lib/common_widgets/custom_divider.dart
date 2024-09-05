import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gen/colors.gen.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {super.key,
      this.height = 1,
      this.verticalMergin = 12,
      this.width,
      this.color});

  final double height;
  final double? width;
  final double verticalMergin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100.w,
      height: height,
      margin: EdgeInsets.symmetric(vertical: verticalMergin),
      color: color ?? AppColors.c8092A5,
    );
  }
}

