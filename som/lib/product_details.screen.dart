import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joshgervais/constants/text_font_style.dart';
import 'package:joshgervais/helpers/navigation_service.dart';
import 'common_widgets/custom_button.dart';
import 'common_widgets/custom_rating.dart';
import 'gen/assets.gen.dart';
import 'gen/colors.gen.dart';
import 'helpers/ui_helpers.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final onToggole = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c131316,
      appBar: AppBar(
        backgroundColor: AppColors.c131316,
        leading: IconButton(
            onPressed: () {
              NavigationService.goBack;
            },
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: ValueListenableBuilder<bool>(
              valueListenable: onToggole,
              builder: (context, notifyValue, _) {
                return GestureDetector(
                  onTap: () {
                    onToggole.value =
                        !notifyValue; // Update the ValueListenable
                    log("Toggled: ${onToggole.value}");
                  },
                  child: Icon(
                    Icons.favorite,
                    color: notifyValue ? AppColors.cFFFFFF : AppColors.c000000,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // in this section have bottole pic bottole title compatibillity score rating and type region
              BottoleTitleMoreInfoWidget(
                bottoleImage: Assets.images.splashWine.path,
                bottoleTitle:
                    "Tattinter Comtes De Champagne Grand Cru Blanc De Lancs",
                compatibility: '92',
                type: 'Red Dry',
                region: 'Pierre Taittinger',
              ),
              UIHelper.verticalSpace(24.h),
              // in this section have testing notes and testing details
              const BottoleDetailsWidget(
                detailsType: "Tasting Notes:",
                details:
                    "The 2011 vintage bursts with aromas of orchard and stone fruits, pastry cream, and blanched almonds, leading to a medium to full-bodied palate with lively acids, flavors of gingerbread, licorice, meringue, and a delicate mousse finish.",
              ),
              UIHelper.verticalSpace(24.h),
              // in this section have producer note and details
              const BottoleDetailsWidget(
                detailsType: "Producer Notes:",
                details:
                    "Established by Pierre Taittinger in 1932. Notale for Chardonnay-dominant cuvees and prestigious Comtes de Champagne, The brand was further developed by his son Francois Taittinger.",
              ),
              UIHelper.verticalSpace(40.h),
              Text(
                'Food Pairings:',
                style: TextFontStyle.headline16w600OpenSans,
              ),
              UIHelper.verticalSpace(12.h),
              // in this section have food pairing icon and name, in future you think image and name are dynamic then you can decler permeter in this widget
              const FoodPairingWidget(),
              UIHelper.verticalSpace(24.h),
              // in this section have review count down and all revire button
              const ReviewandAllReviewSection(
                reviewCountDown: '758',
              ),
              UIHelper.verticalSpace(24.h),

              ListView.separated(
                separatorBuilder: (context, index) {
                  return UIHelper.verticalSpace(10.h);
                },
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return UserRatingWidget(
                    ratingTitle:
                        "“I really liked it. Perhaps the best wine I’ve ever tasted.”",
                    userImage: Assets.images.personDummyImage.path,
                    userName: 'Adam Williams',
                    date: '05 May 2024',
                  );
                },
              ),

              UIHelper.verticalSpace(24.h),

              // Action button
              customeButton(
                borderRadius: 12.r,
                color: AppColors.c131316,
                height: 50,
                minWidth: double.infinity,
                name: 'Submit feedback',
                onCallBack: () {
                  showFeedbackInputBottomSheet(context);
                },
                borderColor: AppColors.cFFFFFF,
                textStyle: TextFontStyle.headline16w600OpenSans,
                context: context,
              ),
              UIHelper.verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }

  void showFeedbackInputBottomSheet(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    showCupertinoModalPopup(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          'Rate Us',
          style: textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: 0.1,
          ),
        ),
        message: Text(
          "Rate your experience with our app.",
          style: TextFontStyle.headline16w400OpenSans
              .copyWith(color: AppColors.c131316),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRatingWidget(
                      iconSize: 30.sp,
                      unratedColor: Colors.white,
                      deafultRatingColor: Colors.black,
                      rating: 0,
                      selectableMood: true,
                    ),
                    UIHelper.verticalSpace(16.h),
                    Material(
                      color: Colors.transparent,
                      child: TextFormField(
                        cursorColor: AppColors.c131316,
                        decoration: InputDecoration(
                          hintText: 'Enter your feedback',

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.cFFFFFF, width: 2.w),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.cFFFFFF, width: 2.w),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.cFFFFFF, width: 2.w),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.cFFFFFF, width: 2.w),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.w),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          // Add other properties as needed
                          // Example: hintText, prefixIcon, suffixIcon, etc.
                        ),
                        maxLines: 3,
                      ),
                    ),
                    UIHelper.verticalSpace(12.r),
                    CupertinoActionSheetAction(
                      child: Text(
                        'Submit',
                        style: textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close the modal popup
                      },
                    ),
                    UIHelper.customDivider(),
                  ],
                ),
              ),
            ),
            onPressed: () {},
          ),
        ],
        // A cancel button at the bottom of the modal popup
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            'Close',
            style: textTheme.titleLarge!.copyWith(
              color: Colors.grey,
              letterSpacing: 0.1,
            ),
          ),
          onPressed: () {
            Navigator.pop(context); // Close the modal popup
          },
        ),
      ),
    );
  }

  // void showFeedbackInputBottomSheet(
  //   BuildContext context,
  // ) {
  //   final textTheme = Theme.of(context)
  //       .textTheme
  //       .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: SafeArea(
  //           child: SingleChildScrollView(
  //             child: Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(
  //                     'Rate Us',
  //                     style: textTheme.headlineSmall!.copyWith(
  //                       color: Theme.of(context).colorScheme.primary,
  //                       letterSpacing: 0.1,
  //                     ),
  //                   ),
  //                   SizedBox(height: 16),
  //                   Text(
  //                     "Choose an image from your camera or existing gallery.",
  //                     style: textTheme.bodyMedium!.copyWith(letterSpacing: 0.1),
  //                   ),
  //                   SizedBox(height: 16),
  //                   const CustomRatingWidget(
  //                     deafultRatingColor: Colors.red,
  //                     rating: 0,
  //                     selectableMood: true,
  //                   ),
  //                   SizedBox(height: 16),
  //                   TextFormField(
  //                     decoration: InputDecoration(
  //                       labelText: 'Enter your feedback',
  //                       border: OutlineInputBorder(),
  //                     ),
  //                     maxLines: 3,
  //                   ),
  //                   SizedBox(height: 16),
  //                   SizedBox(
  //                     width: double.infinity,
  //                     child: ElevatedButton(
  //                       onPressed: () {
  //                         Navigator.pop(context); // Close the modal popup
  //                       },
  //                       child: Text(
  //                         'Submit',
  //                         style: textTheme.titleMedium!.copyWith(
  //                           color: Theme.of(context).colorScheme.secondary,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(height: 16),
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       Navigator.pop(context); // Close the modal popup
  //                     },
  //                     child: Text(
  //                       'Close',
  //                       style: textTheme.titleLarge!.copyWith(
  //                         color: Colors.grey,
  //                         letterSpacing: 0.1,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // void showFeedbackInputBottomSheet(
  //   BuildContext context,
  // ) {
  //   final textTheme = Theme.of(context)
  //       .textTheme
  //       .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoActionSheet(
  //             title: TextStyleExample(
  //                 name: 'Rate Us',
  //                 style: textTheme.headlineSmall!.copyWith(
  //                     color: Theme.of(context).colorScheme.primary,
  //                     letterSpacing: 0.1)),
  //             message: TextStyleExample(
  //                 name: "Choose an image from your camera or existing gallery.",
  //                 style: textTheme.bodyMedium!.copyWith(letterSpacing: 0.1)),
  //             actions: <Widget>[
  //               // List of actions
  //               // Star Rating
  //               CupertinoActionSheetAction(
  //                 child: Column(
  //                   children: [
  //                     const CustomRatingWidget(
  //                       deafultRatingColor: Colors.red,
  //                       rating: 0,
  //                       selectableMood: true,
  //                     ),
  //                     TextFormField()
  //                   ],
  //                 ),
  //                 onPressed: () {},
  //               ),

  //               // Submit
  //               CupertinoActionSheetAction(
  //                 child: TextStyleExample(
  //                     name: 'Submit',
  //                     style: textTheme.titleMedium!.copyWith(
  //                         color: Theme.of(context).colorScheme.secondary)),
  //                 onPressed: () {
  //                   Navigator.pop(context); // Close the modal popup
  //                 },
  //               ),
  //             ],

  //             // A cancel button at the bottom of the modal popup
  //             cancelButton: CupertinoActionSheetAction(
  //               child: TextStyleExample(
  //                   name: 'Close',
  //                   style: textTheme.titleLarge!
  //                       .copyWith(color: Colors.grey, letterSpacing: 0.1)),
  //               onPressed: () {
  //                 Navigator.pop(context); // Close the modal popup
  //               },
  //             ),
  //           ));
  // }
}

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

class BottoleTitleMoreInfoWidget extends StatelessWidget {
  final String bottoleImage;
  final String bottoleTitle;
  final String compatibility;
  final String type;
  final String region;
  const BottoleTitleMoreInfoWidget({
    required this.bottoleImage,
    required this.bottoleTitle,
    required this.compatibility,
    required this.type,
    required this.region,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          bottoleImage,
          width: 120,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bottoleTitle,
                style: TextFontStyle.headline24w400nanumMyeongjo,
              ),
              UIHelper.verticalSpace16,
              Text(
                'Compatibility Score: $compatibility%',
                style: TextFontStyle.headline16w600OpenSans,
              ),
              UIHelper.verticalSpace(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomRatingWidget(
                    rating: 5,
                    selectableMood: false,
                    deafultRatingColor: AppColors.c000000,
                  ),
                  UIHelper.horizontalSpace(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5.0 (758 Reviews)',
                        style: TextFontStyle.headline13w400OpenSans,
                      ),
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'Type: ',
                        style: TextFontStyle.headline13w400OpenSans
                            .copyWith(fontSize: 14.sp),
                      ),
                      UIHelper.verticalSpace(4.h),
                      Text(
                        type,
                        style: TextFontStyle.headline16w400OpenSans,
                      ),
                      UIHelper.verticalSpace16,
                      Text(
                        'Region:',
                        style: TextFontStyle.headline13w400OpenSans
                            .copyWith(fontSize: 14.sp),
                      ),
                      UIHelper.verticalSpace4,
                      Text(
                        region,
                        style: TextFontStyle.headline16w400OpenSans,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class UserRatingWidget extends StatelessWidget {
  final String ratingTitle;
  final String userImage;
  final String userName;
  final String date;
  const UserRatingWidget({
    required this.ratingTitle,
    required this.userImage,
    required this.date,
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: AppColors.c070708, borderRadius: BorderRadius.circular(6.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomRatingWidget(
            rating: 5,
            deafultRatingColor: AppColors.c2C2C2C,
          ),
          UIHelper.verticalSpace(8.h),
          Text(
            ratingTitle,
            // "“I really liked it. Perhaps the best wine I’ve ever tasted.”",
            style: TextFontStyle.headline16w400OpenSans
                .copyWith(color: AppColors.c97A0AF),
          ),
          UIHelper.verticalSpace(16.h),
          Row(
            children: [
              CircleAvatar(
                radius: 30.sp,
                backgroundImage: AssetImage(userImage),
              ),
              UIHelper.horizontalSpace(16.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextFontStyle.headline16w400OpenSans,
                  ),
                  UIHelper.verticalSpace4,
                  Text(
                    date,
                    style: TextFontStyle.headline13w400OpenSans
                        .copyWith(fontSize: 12.sp),
                  ),
                ],
              )
            ],
          )
        ],
      ),
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
