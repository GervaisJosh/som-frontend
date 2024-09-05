import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:joshgervais/features/product/presentation/product_details.screen.dart';
import '../common_widgets/webview_helper.dart';
import '../features/auth/presentation/forgot_pw/forgot_pw.dart';
import '../features/auth/presentation/forgot_pw/forgot_pw_screen.dart';
import '../features/auth/presentation/login/login_screen.dart';
import '../features/auth/presentation/new_pw/new_pw.dart';
import '../features/auth/presentation/otp/otp_screen.dart';
import '../features/auth/presentation/signup/signup_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/intro/presentation/onboarding/onboarding_screen.dart';
import '../features/intro/presentation/splash/splash_screen.dart';
import '../features/mobile_verify/input_mobile_num_screen.dart';
import '../features/mobile_verify/otp_verification_screen.dart';
import '../features/profile/presentation/edit_profile_screen.dart';
import '../features/profile/presentation/user_profile_screen.dart';
import '../features/scan/presentation/scan_result.dart';
import '../navigation_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String webview = '/webview';
  static const String onboarding = '/onboarding';
  static const String forogotPWEmail = '/forgot_password_email';
  static const String forogotPW = '/forgot_password';
  static const String signup = '/signup';
  static const String newPW = '/new_password';
  static const String otp = '/otp';
  static const String productDetails = '/product_details';
  static const String mobileNumVerifyScreen = '/mobileNumVerifyScreen';
  static const String mobileOtp = '/mobileOtp';
  static const String navigationScreen = '/NavigationScreen';
  static const String viewProfile = '/viewProfile';
  static const String myProfileScreen = '/myProfileScreen';
  static const String editProfile = '/edit_profile_screen';
  static const String scanResult = '/scan_result_screen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SplashScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const SplashScreen());

      case Routes.login:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: LoginScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const LoginScreen());

      case Routes.home:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: HomeScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const HomeScreen());
      case Routes.productDetails:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProductDetailsScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ProductDetailsScreen());

      case Routes.onboarding:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OnboardingScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const OnboardingScreen());

      case Routes.forogotPWEmail:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ForgotPwWithEmailScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ForgotPwWithEmailScreen());

      case Routes.forogotPW:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ForgotPwScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const ForgotPwScreen());

      case Routes.signup:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SignupScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const SignupScreen());

      case Routes.newPW:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: NewPwScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const NewPwScreen());

      case Routes.otp:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OtpScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const OtpScreen());

      case Routes.mobileNumVerifyScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: MobileNumVerifyScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const MobileNumVerifyScreen());

      case Routes.mobileOtp:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: MobileOtp()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const MobileOtp());

      case Routes.navigationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const NavigationScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const NavigationScreen());

      case Routes.editProfile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const EditProfileScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EditProfileScreen());

      // case Routes.myProfileScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const MyProfileScreen(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const MyProfileScreen());

      case Routes.viewProfile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const UserProfileScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const UserProfileScreen());

      case Routes.scanResult:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScanResultScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ScanResultScreen());

      case Routes.webview:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: WebviewHelper(
                  name: args["name"],
                  url: args["url"],
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => WebviewHelper(
                      name: args["name"],
                      url: args["url"],
                    ));
      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
