import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRatingWidget extends StatelessWidget {
  final double rating;
  final bool selectableMood;
  final Color deafultRatingColor;
  final Function(double rate)? getRating;
  final Color unratedColor;
  final double iconSize;
   const CustomRatingWidget({
    super.key,
    required this.rating,
    this.selectableMood = false,
    required this.deafultRatingColor,
    this.getRating,
    this.unratedColor = const Color(0xffFFEBCE), 
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: !selectableMood,
      initialRating: rating,
      minRating: 1,
      itemSize: iconSize.sp,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false,
      unratedColor: unratedColor,
      itemBuilder: (context, _) {
        return Icon(
          Icons.star,
          color: deafultRatingColor,
          //color: AppColors.c2C2C2C,
        );
      },
      onRatingUpdate: (value) => getRating?.call(value),
    );
  }
}
