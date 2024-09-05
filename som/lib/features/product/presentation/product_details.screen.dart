import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joshgervais/constants/text_font_style.dart';
import 'package:joshgervais/helpers/navigation_service.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_rating.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'widgets/bottle_details_widget.dart';
import 'widgets/bottle_title_more_info_widget.dart';
import 'widgets/food_pairing_widget.dart';
import 'widgets/review_section_widget.dart';
import 'widgets/user_rating_widget.dart';

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
              // user review section
              ListView.separated(
                separatorBuilder: (context, index) {
                  return UIHelper.verticalSpace(10.h);
                },
                shrinkWrap: true,
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
              UIHelper.verticalSpace(50.h),
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
                    UIHelper.customDivider(),
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
}
