import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/colors.gen.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  bool isChecked;
  final Function(bool?) onChanged;

  CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CheckboxWithRowState();
}

class _CheckboxWithRowState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.c25D7D8,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      value: widget.isChecked,
      onChanged: widget.onChanged,
    );
  }
}
