import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../constants/app_constants.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkAuthStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.c020202,
        height: double.maxFinite,
        width: double.maxFinite,
        // child: Image.asset(Assets.images.splashLogoUpdated.path, height: 250.h),
      ),
    );
  }

  void checkAuthStatus() {
    final status = appData.read(kKeyIsLoggedIn);
    log("Authentication Status: $status");
    // String destination =
    //     appData.read(kKeyIsLoggedIn) ? Routes.home : Routes.login;
    Future.delayed(
      const Duration(seconds: 2),
      () => NavigationService.navigateToReplacement(Routes.login),
      // () => NavigationService.navigateToReplacement(destination),
    );
  }
}
