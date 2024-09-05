import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joshgervais/helpers/ui_helpers.dart';
import '../gen/colors.gen.dart';
import '../helpers/navigation_service.dart';

@immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> action;
  final bool isBackNeeded;
  final bool centerTitle;
  final VoidCallback? onTap;
  final VoidCallback? onPop;
  final bool isCross;
  final TextStyle? style;
  final Widget? leading;

  const CustomAppBar({
    this.title = "",
    this.action = const [],
    this.isBackNeeded = false,
    super.key,
    this.onTap,
    this.centerTitle = true,
    this.onPop,
    this.isCross = false,
    this.style,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UIHelper.kDefaultPadding()),
      child: AppBar(
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: isBackNeeded,
        title: Text(
          title,
          style: style,
          textAlign: TextAlign.left,
        ),
        // leadingWidth: Utils.scrHeight * .08,
        leading: leading ??
            (isBackNeeded
                ? GestureDetector(
                    onTap: onPop ??
                        () {
                          NavigationService.goBack();
                        },
                    child: isCross
                        ? Icon(Icons.close,
                            size: 35.sp, color: AppColors.cFFFFFF)
                        : Icon(Icons.arrow_back_ios,
                            color: AppColors.cFFFFFF, size: 28.sp),
                  )
                : null),
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
