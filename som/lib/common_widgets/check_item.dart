import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_checkbox.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../providers/auth_provider.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({
    super.key,
    required this.title,
    required this.type,
    this.isAddition = false,
    this.onTap,
  });

  final String title;
  final String type;
  final bool isAddition;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
          crossAxisAlignment:
              isAddition ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // T&C Checkbox or Addition
            isAddition
                ? Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Icon(Icons.add, size: 24.sp),
                  )
                : Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      bool isChecked;
                      Function(String) toggleFunction;

                      if (type == 'expertise') {
                        isChecked = provider.expertiseAreas[title]!;
                        toggleFunction = provider.toggleExpertiseArea;
                      } else {
                        isChecked = provider.supportTypes[title]!;
                        toggleFunction = provider.toggleSupportType;
                      }
                      return CustomCheckbox(
                        isChecked: isChecked,
                        onChanged: (changedVal) {
                          toggleFunction(title);
                        },
                      );
                    },
                  ),
            UIHelper.horizontalSpace(5.w),
            Text(
              title,
              style: TextFontStyle.headline16StyleOpenSansTextRegular400
                  .copyWith(color: AppColors.c4A4A4A, height: 52 / 32),
            ),
          ]),
    );
  }
}
