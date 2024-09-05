// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joshgervais/constants/text_font_style.dart';
import 'package:joshgervais/helpers/all_routes.dart';
import 'package:joshgervais/helpers/ui_helpers.dart';
import 'package:joshgervais/providers/search_provider.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/custome_textfield.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SearchProvider provider;
  final TextEditingController searchController = TextEditingController();
  FocusNode searchFN = FocusNode();
  ValueNotifier<bool> searchHasFocus = ValueNotifier<bool>(false);

  @override
  void initState() {
    provider = Provider.of<SearchProvider>(context, listen: false);
    searchFN.addListener(provider.toggleSearchFocus);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFN.dispose();
    searchHasFocus.dispose();
    searchFN.removeListener(provider.toggleSearchFocus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaultPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge,
            buildSearchInput(),
            UIHelper.verticalSpaceMediumLarge,
            Text(
              "Bottles For You",
              style: TextFontStyle.headline26StyleNanumMyeongjoRegular
                  .copyWith(color: AppColors.cFFFFFF),
            ),
            UIHelper.verticalSpaceMedium,
            _scrollableContent(),
          ],
        ),
      ),
    );
  }

  Expanded _scrollableContent() {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            UIHelper.verticalSpaceSemiLarge,
            BottleInfoCard(
              imgPath: Assets.images.splashWine.path,
              title: "Tattinter Comtes De Champagne Grand Cru Blanc De Lancs",
              region: "Pierre Taittinger",
              score: 92,
            ),
            UIHelper.verticalSpace(100.h),
            BottleInfoCard(
              imgPath: Assets.images.splashWine.path,
              title: "Tattinter Comtes De Champagne Grand Cru Blanc De Lancs",
              region: "Pierre Taittinger",
              score: 92,
            ),
            UIHelper.verticalSpace(100.h),
            BottleInfoCard(
              imgPath: Assets.images.splashWine.path,
              title: "Tattinter Comtes De Champagne Grand Cru Blanc De Lancs",
              region: "Pierre Taittinger",
              score: 92,
            ),
            UIHelper.verticalSpace(100.h),
            BottleInfoCard(
              imgPath: Assets.images.splashWine.path,
              title: "Tattinter Comtes De Champagne Grand Cru Blanc De Lancs",
              region: "Pierre Taittinger",
              score: 92,
            ),
            UIHelper.verticalSpace(100.h),
            BottleInfoCard(
              imgPath: Assets.images.splashWine.path,
              title: "Tattinter Comtes De Champagne Grand Cru Blanc De Lancs",
              region: "Pierre Taittinger",
              score: 92,
            ),
            UIHelper.verticalSpace(100.h),
            BottleInfoCard(
              imgPath: Assets.images.splashWine.path,
              title: "Tattinter Comtes De Champagne Grand Cru Blanc De Lancs",
              region: "Pierre Taittinger",
              score: 92,
            ),
            UIHelper.verticalSpace(50.h),
          ],
        ),
      ),
    );
  }

  Consumer<SearchProvider> buildSearchInput() {
    return Consumer<SearchProvider>(builder: (context, hasFocus, _) {
      return CustomFormField(
        textEditingController: searchController,
        hintText: 'Search your favorite wine',
        inputType: TextInputType.name,
        textInputAction: TextInputAction.done,
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 8.w, right: 4.w),
          padding: EdgeInsets.all(5.sp),
          child: SvgPicture.asset(
            Assets.icons.search,

            // Implement prefix icon highligh while focus enabled
            color: (provider.searchHasFocus ||
                    searchController.text.trim().isNotEmpty)
                ? AppColors.cFFFFFF
                : AppColors.c8993A4,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
        focusNode: searchFN,
      );
    });
  }
}

class BottleInfoCard extends StatefulWidget {
  final String title;
  final VoidCallback? onFav;
  final String region;
  final int score;
  final String imgPath;
  final double? imgHeight;

  const BottleInfoCard({
    super.key,
    required this.title,
    this.onFav,
    required this.region,
    required this.score,
    required this.imgPath,
    this.imgHeight,
  });

  @override
  State<BottleInfoCard> createState() => _BottleInfoCardState();
}

class _BottleInfoCardState extends State<BottleInfoCard> {
  ValueNotifier<bool> isFav = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.navigateTo(Routes.productDetails);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Outline Card
          Container(
            decoration: BoxDecoration(
              color: AppColors.c000000,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
              child: Row(
                children: [
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Favourite Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170.w,
                            child: Text(
                              widget.title,
                              style: TextFontStyle
                                  .headline16StyleOpenSansTextSemiBold
                                  .copyWith(
                                color: AppColors.ce4e4e4,
                                height: 63 / 36,
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: isFav,
                              builder: (context, fav, child) {
                                return GestureDetector(
                                  onTap: widget.onFav ??
                                      () {
                                        isFav.value = !isFav.value;
                                      },
                                  child: Padding(
                                    padding: EdgeInsets.all(6.sp),
                                    child: SvgPicture.asset(
                                      Assets.icons.heart,
                                      height: 24.sp,
                                      color: fav ? AppColors.cFFFFFF : null,
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),

                      UIHelper.verticalSpace(16.h),

                      // Region
                      Text(
                        "Region",
                        style: TextFontStyle
                            .headline12StyleOpenSansTextRegular400
                            .copyWith(
                                color: AppColors.cc2c2c2, height: 16 / 10),
                      ),
                      UIHelper.verticalSpace(4.h),

                      // Type
                      Text(
                        widget.region,
                        style: TextFontStyle
                            .headline12StyleOpenSansTextRegular400
                            .copyWith(
                                color: AppColors.cc2c2c2, height: 16 / 10),
                      ),
                      UIHelper.verticalSpaceMedium,

                      // Compatibility Score
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Compatibility Score: ',
                            style: TextFontStyle
                                .headline14StyleOpenSansTextRegular400
                                .copyWith(
                              color: AppColors.c8993A4,
                            ),
                          ),
                          Text(
                            '${widget.score}%',
                            style: TextFontStyle
                                .headline26StyleNanumMyeongjoRegular
                                .copyWith(color: AppColors.cFFFFFF),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Floating Bottle
          Positioned(
            top: -35.h,
            left: 16.w,
            child:
                Image.asset(widget.imgPath, height: widget.imgHeight ?? 300.h),
          )
        ],
      ),
    );
  }
}
