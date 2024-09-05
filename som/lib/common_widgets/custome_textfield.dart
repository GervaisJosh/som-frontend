import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

// ignore: must_be_immutable
final class CustomFormField extends StatelessWidget {
  String? hintText;
  final String? labelText;
  TextEditingController? textEditingController;
  final TextInputType inputType;
  double? fieldHeight;
  int? maxline;
  final String? Function(String?)? validator;
  bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  bool isObsecure;
  bool isPass;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  Function(String)? onFieldSubmitted;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final double? cursorHeight;
  final Color? disableColor;
  final Color? fillColor;
  final Color? strokeColor;
  final Color? enableBorderColor;

  CustomFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.textEditingController,
    required this.inputType,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.validation = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    this.disableColor,
    this.fillColor,
    this.strokeColor,
    this.enableBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: cursorHeight ?? 20.h,
      cursorColor: AppColors.cFFFFFF,
      focusNode: focusNode,
      obscureText: isPass ? isObsecure : false,
      textInputAction: textInputAction,
      autovalidateMode:
          validation! ? AutovalidateMode.always : AutovalidateMode.disabled,
      validator: validator,
      maxLines: maxline ?? 1,
      controller: textEditingController,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      enabled: isEnabled,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? AppColors.c000000,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.c8993A4,
        ),
        labelText: labelText,
        labelStyle: labelStyle ??
            TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.cFFFFFF,
            ),
        errorStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: Colors.red,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: AppColors.cFFFFFF,
            width: 1.sp,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: disableColor ?? AppColors.cDEE4F2,
            width: 1.sp,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.sp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: enableBorderColor ?? AppColors.c000000,
            width: 1.sp,
          ),
        ),
      ),
      style: style ??
          TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.cFFFFFF,
          ),
      keyboardType: inputType,
    );
  }
}
