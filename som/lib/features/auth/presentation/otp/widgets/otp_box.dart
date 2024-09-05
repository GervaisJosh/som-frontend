import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/colors.gen.dart';

class OtpBox extends StatefulWidget {
  const OtpBox({super.key, this.isLast = false, required this.controller});

  final bool isLast;
  final TextEditingController controller;

  @override
  OtpBoxState createState() => OtpBoxState();
}

class OtpBoxState extends State<OtpBox> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = _focusNode.hasFocus || widget.controller.text.isNotEmpty;

    return Container(
      height: 70.h,
      width: 70.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? AppColors.cF8F8F8 : AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1.5,
          color: isActive ? AppColors.c0BCDE0 : AppColors.cDFE1E6,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        onChanged: (value) {
          if (value.length == 1 && !widget.isLast) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(border: InputBorder.none),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

Form buildOtpForm(
    {required TextEditingController pin1,
    required TextEditingController pin2,
    required TextEditingController pin3,
    required TextEditingController pin4}) {
  return Form(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OtpBox(controller: pin1),
        OtpBox(controller: pin2),
        OtpBox(controller: pin3),
        OtpBox(controller: pin4, isLast: true),
      ],
    ),
  );
}
