import 'package:flutter/material.dart';
import '../../../../common_widgets/action_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: ActionButton(
            isBorderSide: true,
            style: TextFontStyle.headline16StyleOpenSansTextBold700ColorWhite
                .copyWith(color: AppColors.c22252D),
            colors: const [Colors.white, Colors.white],
            name: 'View Porfile',
            onTap: () {
              NavigationService.navigateTo(Routes.viewProfile);
            },
          ),
        ),
        UIHelper.horizontalSpaceSmall,
        const Expanded(
          flex: 1,
          child: ActionButton(name: 'Send Massage'),
        )
      ],
    );
  }
}
