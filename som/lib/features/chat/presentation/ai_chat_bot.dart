// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joshgervais/common_widgets/custom_appbar.dart';
import 'package:joshgervais/constants/text_font_style.dart';
import 'package:joshgervais/gen/assets.gen.dart';
import 'package:joshgervais/gen/colors.gen.dart';
import 'package:joshgervais/helpers/helper_methods.dart';
import 'package:joshgervais/helpers/ui_helpers.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/custome_textfield.dart';
import '../../../providers/auth_provider.dart';

class AiChatBotScreen extends StatefulWidget {
  const AiChatBotScreen({super.key});

  @override
  State<AiChatBotScreen> createState() => _AiChatBotScreenState();
}

class _AiChatBotScreenState extends State<AiChatBotScreen> {
  late final AuthProvider provider;
  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    provider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Som",
        style: TextFontStyle.headline26StyleNanumMyeongjoRegular.copyWith(
            color: AppColors.cFFFFFF, height: 0.05, letterSpacing: -0.26),
        leading: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(Assets.icons.menu),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UIHelper.kDefaultPadding(),
        ),
        child: Column(
          children: [
            _scrollableMessages(),

            // Bottom Portion
            SizedBox(
              height: 80.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Camera
                      GestureDetector(
                          onTap: () {
                            showPickImageBottomSheet(context, null, null,
                                isGalleryNeeded: false);
                          },
                          child: SvgPicture.asset(Assets.icons.camera)),
                      UIHelper.horizontalSpace(16.w),

                      // Media
                      GestureDetector(
                          onTap: () {
                            showPickImageBottomSheet(context, null, null,
                                isCameraNeeded: false);
                          },
                          child: SvgPicture.asset(Assets.icons.media)),
                      UIHelper.horizontalSpace(14.w),

                      // Input
                      Expanded(
                          flex: 1,
                          child: SizedBox(height: 50.h, child: buildInput())),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Consumer<AuthProvider> buildInput() {
    return Consumer<AuthProvider>(builder: (context, hasFocus, _) {
      return CustomFormField(
        textEditingController: inputController,
        hintText: 'Message',
        fillColor: AppColors.c131316,
        enableBorderColor: AppColors.c929292,
        inputType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );
    });
  }

  Widget _scrollableMessages() {
    return Expanded(
      flex: 10,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ChatCard(
              text: "Good evening Josh, How can I help you?",
              isUser: false,
              isFirst: true,
            ),
            UIHelper.verticalSpace(24.h),
            const ChatCard(
                text:
                    "I want to bring a bottle of red to thanksgiving with my friends. What’s something good around \$50, maybe something french?",
                isUser: true),
            const ChatCard(
                text:
                    "Try Sylvain Pataille’s Marsannay Rouge. It has dark fruit, silky tannins, and a smooth finish, similar to a red burgundy you enjoyed recently. Medium-bodied with refreshing acidity, it’s perfect for Thanksgiving. The Austin Wine Merchant, \n\nYou’re about 3 miles away, should have it. Cheers!",
                isUser: false),
          ],
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool isFirst;

  const ChatCard(
      {super.key,
      required this.text,
      required this.isUser,
      this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isFirst ? 0.h : 24.h),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) SvgPicture.asset(Assets.icons.chatProfile),
          if (!isUser) UIHelper.horizontalSpace(12.w),
          Container(
            width: 250.w,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.c353537,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              text,
              style: TextFontStyle.headline16StyleOpenSansTextSemiBold.copyWith(
                color: AppColors.cFFFFFF,
                height: 1.5,
                letterSpacing: -0.16,
              ),
            ),
          ),
          if (isUser) UIHelper.horizontalSpace(12.w),
          if (isUser) Image.asset(Assets.images.userProfile.path, height: 36.h),
        ],
      ),
    );
  }
}
