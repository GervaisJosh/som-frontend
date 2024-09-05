import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joshgervais/welcome_screen.dart';
import 'package:provider/provider.dart';
import '/helpers/all_routes.dart';
import 'gen/colors.gen.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/keyboard.dart';
import 'helpers/navigation_service.dart';
import 'helpers/register_provider.dart';
import 'networks/dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetup();
  initiInternetChecker();
  DioSingleton.instance.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    KeyboardUtil.hideKeyboard(context);
    return MultiProvider(
      providers: providers,
      child: const SomAppRoot(),
    );
  }
}

class SomAppRoot extends StatelessWidget {
  const SomAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Som',
          theme: ThemeData(
            primaryColor: AppColors.c25D7D8,
            scaffoldBackgroundColor: AppColors.c131316,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.cFFFFFF,
            ),
            unselectedWidgetColor: AppColors.c22252D,
          ),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context),
              child: widget!,
            );
          },
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}