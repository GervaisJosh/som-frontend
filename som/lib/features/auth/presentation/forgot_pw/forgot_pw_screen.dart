import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/next_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class ForgotPwScreen extends StatelessWidget {
  const ForgotPwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isBackNeeded: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your email",
                  style: TextFontStyle.headline32StyleOpenSansTextBold700),
              UIHelper.verticalSpace32,
              Text(
                  'Don’t worry! It happens. Please choose any option below to recover your password.',
                  style: TextFontStyle.headline14StyleOpenSansTextRegular400),
              UIHelper.verticalSpaceMediumLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NextButton(width: 168.w, name: 'Email'),
                  NextButton(width: 168.w, name: 'Phone'),
                ],
              ),
              UIHelper.verticalSpace48,
              const NextButton(name: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
