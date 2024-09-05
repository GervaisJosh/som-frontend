// ignore_for_file: unused_field, deprecated_member_use

import 'dart:developer';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joshgervais/features/chat/presentation/ai_chat_bot.dart';
import '/gen/assets.gen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/profile/presentation/user_profile_screen.dart';
import 'features/scan/presentation/scanner.dart';
import 'gen/colors.gen.dart';
import 'helpers/helper_methods.dart';

final class NavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const NavigationScreen({super.key, this.pageNum});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // final appData = GetStorage();
  //Variable for navigation Index
  int _currentIndex = 0;
  //Variable for navigation Color Index
  int _colorIndex = 0;

  final bool _isFisrtBuild = true;
  bool _navigationOn = true;
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  late List<Widget> _screens;

  void setToIndex(int index) {
    log(_currentIndex.toString());
    setState(() {
      _currentIndex = index;
      log(_currentIndex.toString());
    });
  }

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      ScannerScreen(
        onTap: () {
          setToIndex(0);
        },
      ),
      const AiChatBotScreen(),
      const UserProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatefulWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }
    if (args != null) {
      _colorIndex = 4;
      screenPage = args as StatefulWidget;
      var newColorindex = -1;

      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _colorIndex = newColorindex;
          _currentIndex = newColorindex;
          break;
        }
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        onDrawerChanged: (isOpened) => setState(() {
          _navigationOn = !isOpened;
        }),
        body: Center(
            child: (screenPage != null)
                ? screenPage
                : _screens.elementAt(_currentIndex)),
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.r,
          selectedColor: Colors.red,
          strokeColor: AppColors.c3EE1D0,
          unSelectedColor: Colors.black,
          backgroundColor: Colors.black,
          items: [
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                (_currentIndex == 0)
                    ? Assets.icons.homeFilled
                    : Assets.icons.home,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                (_currentIndex == 1)
                    ? Assets.icons.scanFilled
                    : Assets.icons.scan,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                (_currentIndex == 2)
                    ? Assets.icons.messageFilled
                    : Assets.icons.message,
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                (_currentIndex == 3)
                    ? Assets.icons.personFilled
                    : Assets.icons.person,
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
