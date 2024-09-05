import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../providers/drop_down_provider.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.cDFE1E6)),
      child: Consumer<DropDownProvider>(builder: (context, provider, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              hint,
              style: TextFontStyle.headline14StyleOpenSansTextBold700
                  .copyWith(color: AppColors.c4A4A4A),
            ),
            // DropDownItem Showing
            items: provider.businessCategoriesList?.map((String service) {
              return DropdownMenuItem<String>(
                value: service,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    service,
                    // style: mediumTS(dropDownItemColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
            value: provider.selectedBusinessCategory,
            onChanged: (String? value) {
              provider.setSelectedBusinessCategory(value);
            },

            //DropDown Button Style
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              height: 100.h,
            ),
            dropdownStyleData: DropdownStyleData(
              direction: DropdownDirection.left,
              maxHeight: 180.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.w), // Item Horizontal Padding
            ),
            iconStyleData: const IconStyleData(
              openMenuIcon: Icon(Icons.arrow_drop_up),
            ),
          ),
        );
      }),
    );
  }
}
