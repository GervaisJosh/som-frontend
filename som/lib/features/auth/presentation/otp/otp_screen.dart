import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/next_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/toast.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../providers/auth_provider.dart';
import 'widgets/otp_box.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 = TextEditingController();

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void resetPins() {
    pin1.clear();
    pin2.clear();
    pin3.clear();
    pin4.clear();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    isLoading.dispose();
    pin1.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(isBackNeeded: true),
      body: Align(
        heightFactor: 1.0,
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          shrinkWrap: true,
          children: [
            Text("Enter your code",
                style: TextFontStyle.headline32StyleOpenSansTextBold700),
            UIHelper.verticalSpaceSmall,
            UIHelper.verticalSpaceMedium,

            // List Of OTP Boxes
            buildOtpForm(pin1: pin1, pin2: pin2, pin3: pin3, pin4: pin4),
            UIHelper.verticalSpaceMedium,

            Text(
              "Didn’t get anything? No worries, let’s try again.",
              style: TextFontStyle.headline14StyleOpenSansTextRegular400
                  .copyWith(height: 23 / 14),
            ),

            GestureDetector(
              onTap: () {
                // AuthApiRepository()
                //     .resendOTP(widget.userFirebaseModel.email!)
                //     .then((value) {
                ToastUtil.showShortToast('OTP Resend Successfully ✔');
                resetPins();
                // });
              },
              child: Text(
                "Resend",
                style: TextFontStyle.headline14StyleOpenSansTextBold700
                    .copyWith(decoration: TextDecoration.underline),
                textAlign: TextAlign.left,
              ),
            ),

            UIHelper.verticalSpaceSemiLarge,
            UIHelper.verticalSpaceSmall,

            // SizedBox(height: Utils.scrHeight * .03),
            Consumer<AuthProvider>(builder: (context, value, _) {
              return NextButton(
                name: "Next",
                onTap: () {
                  final pins = pin1.text + pin2.text + pin3.text + pin4.text;
                  if (pins.isEmpty) {
                    return;
                  }
                  resetPins();
                  NavigationService.navigateTo(Routes.newPW);
                  // value
                  //     .verifyAccountWithOtpApi(
                  //         userFirebaseModel: widget.userFirebaseModel,
                  //         otp: pins,
                  //         context: context)
                  //     .then((c) async {
                  //   unFocus();
                  //   Utils.showFlashBarMessage('OTP Successfully Verified ✔',
                  //       FlasType.success, context);
                  //   await Future.delayed(const Duration(seconds: 3));
                  //   if (context.mounted) {
                  //     CustomReplaceAllRoute.determineRouteWithRoleToken(
                  //         context: context);
                  //   }
                  // }).catchError((error) {
                  //   Utils.showFlashBarMessage(
                  //       error.toString(), FlasType.error, context);
                  // });
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void unFocus() {
    // Remove focus from pin4 text field
    pin4.clear(); // Clearing the text first
    FocusScope.of(context)
        .requestFocus(FocusNode()); // Requesting focus for an empty FocusNode
    FocusScope.of(context).unfocus(); // Unfocusing the current focus
  }
}
