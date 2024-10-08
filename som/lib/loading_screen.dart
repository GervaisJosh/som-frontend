import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'networks/dio/dio.dart';
import 'welcome_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = false;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    // AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();
    // await getAllShopCategoryRXObj.fetchAllShopCategoryData();
    // await getAllShopRXObj.fetchAllShopData();
    // await getSliderRXObj.fetchSliderData();
    // await getAllSubCategoryRXObj.fetchGetAllSubCategoryData();

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      // await getAllAddressRXObj.fetchAllDeliveryAddressData();
      // getProfileRXObj.fetchProfileData();
      // getCartRXObj.fetchCartData("0.0");
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return Container();
      // Need to place screen later...
      //  appData.read(kKeyIsLoggedIn) || appData.read(kKeyIsExploring) ? const NavigationScreen() : LoginScreen();
    }
  }
}
