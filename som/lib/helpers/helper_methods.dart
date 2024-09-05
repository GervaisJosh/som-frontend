// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print
import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';
import '/helpers/di.dart';
import '/helpers/toast.dart';
import '../common_widgets/custom_button.dart';
import '../constants/app_constants.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

//declared for cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

Future<void> setInitValue() async {
  await appData.writeIfNull(kKeyIsLoggedIn, false);
  await appData.writeIfNull(kKeyIsExploring, false);
//lisbon
  // appData.writeIfNull(kKeySelectedLat, 38.74631383626653);
  // appData.writeIfNull(kKeySelectedLng, -9.130169921874991);
//codemen
  await appData.writeIfNull(kKeySelectedLat, 22.818285677915657);
  await appData.writeIfNull(kKeySelectedLng, 89.5535583794117);

  // var deviceInfo = DeviceInfoPlugin();
  // if (Platform.isIOS) {
  //   var iosDeviceInfo = await deviceInfo.iosInfo;
  //   appData.writeIfNull(
  //       kKeyDeviceID, iosDeviceInfo.identifierForVendor); // unique ID on iOS
  // } else if (Platform.isAndroid) {
  //   var androidDeviceInfo =
  //       await deviceInfo.androidInfo; // unique ID on Android
  //   appData.writeIfNull(kKeyDeviceID, androidDeviceInfo.id);
  // }
  await Future.delayed(const Duration(seconds: 2));
}

// setLocationLatLong(LatLng latLng, {bool? selectedLocation = false}) async {
//   await appData.write(kKeySelectedLat, latLng.latitude);
//   await appData.write(kKeySelectedLng, latLng.longitude);
//   await appData.write(kKeySelectedLocation, selectedLocation);
// }

// Future<void> getAddressFromPosition(LatLng latLng, BuildContext context) async {
//   List<Placemark> addresses = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

//   var address = addresses.first;

//   Provider.of<PlcaeMarkAddress>(context, listen: false).changePlcaeMarkAddress(
//     addres: address.street.toString(),
//     cty: address.locality.toString(),
//     st: address.administrativeArea.toString(),
//     coun: address.country.toString(),
//     post: address.postalCode.toString(),
//     lati: latLng.latitude.toString(),
//     longi: latLng.longitude.toString(),
//   );
// }

Future<void> initiInternetChecker() async {
  InternetConnectionChecker.createInstance(
          checkTimeout: const Duration(seconds: 1),
          checkInterval: const Duration(seconds: 2))
      .onStatusChange
      .listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        ToastUtil.showShortToast('Data connection is available.');
        break;
      case InternetConnectionStatus.disconnected:
        ToastUtil.showNoInternetToast();
        break;
    }
  });
}

Completer<T> wrapInCompleter<T>(Future<T> future) {
  final completer = Completer<T>();
  future.then(completer.complete).catchError(completer.completeError);
  return completer;
}

Future<void> getInvisible() async {
  Future.delayed(const Duration(milliseconds: 500), () {});
}

void showMaterialDialog(
  BuildContext context,
) {
  showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "Do you want to exit the app?",
              textAlign: TextAlign.center,
              style: TextFontStyle.headline14StyleMontserrat,
            ),
            actions: <Widget>[
              customeButton(
                  name: "No",
                  onCallBack: () {
                    Navigator.of(context).pop(false);
                  },
                  height: 30.sp,
                  minWidth: .3.sw,
                  borderRadius: 30.r,
                  color: AppColors.cF0F0F0,
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 17.sp,
                      color: AppColors.c3EE1D0,
                      fontWeight: FontWeight.w700),
                  context: context),
              customeButton(
                  name: "Yes",
                  onCallBack: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  height: 30.sp,
                  minWidth: .3.sw,
                  borderRadius: 30.r,
                  color: AppColors.c3EE1D0,
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  context: context),
            ],
          ));
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class Alert {
  static showLoadingIndicatorDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              height: 220,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // CircleAvatar(
                  //   backgroundColor: Colors.transparent,
                  //   radius: 45,
                  //   child: Image.asset(Assets.images.splashLogo.path),
                  // ),
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

// ignore: non_constant_identifier_names
Widget showMainLogo({double height_without_sp = 24}) =>
    SvgPicture.asset(Assets.icons.logo, height: height_without_sp.sp);

void changeFocus(
    {required BuildContext context,
    required FocusNode current,
    required FocusNode next}) {
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}

List<String> generateYears() {
  int currentYear = DateTime.now().year;
  return List<String>.generate(
      currentYear - 1900 + 1, (index) => (currentYear - index).toString());
}

void showPickImageBottomSheet(
  BuildContext context,
  ValueNotifier<List<XFile?>>? selectedImagesNotifier,
  ValueNotifier<XFile?>? imageFileNotifier, {
  bool isCameraNeeded = true,
  bool isGalleryNeeded = true,
  bool areMultiPickImage = false,
}) {
  final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  showCupertinoModalPopup(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
            title: TextStyleExample(
                name: 'Choose Image',
                style: textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 0.1)),
            message: TextStyleExample(
                name: "Choose an image from your camera or existing gallery.",
                style: textTheme.bodyMedium!.copyWith(letterSpacing: 0.1)),
            actions: <Widget>[
              // List of actions
              isCameraNeeded
                  ? CupertinoActionSheetAction(
                      child: TextStyleExample(
                          name: 'Camera',
                          style: textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary)),
                      onPressed: () {
                        selectImageFromCamera(context, imageFileNotifier);
                      },
                    )
                  : const SizedBox.shrink(),
              isGalleryNeeded
                  ? CupertinoActionSheetAction(
                      child: TextStyleExample(
                          name: 'Gallery',
                          style: textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary)),
                      onPressed: () {
                        areMultiPickImage
                            ? multiPickImageFromGallery(
                                context, selectedImagesNotifier)
                            : selectImageFromGallery(
                                context, imageFileNotifier);
                      },
                    )
                  : const SizedBox.shrink(),
            ],
            // A cancel button at the bottom of the modal popup
            cancelButton: CupertinoActionSheetAction(
              child: TextStyleExample(
                  name: 'Close',
                  style: textTheme.titleLarge!
                      .copyWith(color: Colors.grey, letterSpacing: 0.1)),
              onPressed: () {
                Navigator.pop(context); // Close the modal popup
              },
            ),
          ));
}

Future<void> selectImageFromCamera(
    BuildContext context, ValueNotifier<XFile?>? imageFileNotifier) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);
  dev.log('pickedFile is: $pickedFile');
  if (pickedFile != null) {
    imageFileNotifier?.value = pickedFile;
    dev.log('imageFile is : ${imageFileNotifier?.value}');
  }

  // Collapse the modal popup menu for hiding bottom sheet
  if (context.mounted) {
    Navigator.pop(context);
  }
}

Future<void> selectImageFromGallery(
    BuildContext context, ValueNotifier<XFile?>? imageFileNotifier) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  dev.log('pickedFile is: $pickedFile');
  if (pickedFile != null) {
    imageFileNotifier?.value = pickedFile;
    dev.log('imageFile is : ${imageFileNotifier?.value}');

    // Collapse the modal popup menu for hiding bottom sheet
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({super.key, required this.name, required this.style});

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.sp),
      child: Text(name, style: style.copyWith(letterSpacing: 1.0)),
    );
  }
}

Future<void> multiPickImageFromGallery(BuildContext context,
    ValueNotifier<List<XFile?>>? selectedImagesNotifier) async {
  final ImagePicker picker = ImagePicker();
  final List<XFile?> images = await picker.pickMultiImage(
    imageQuality: 80,
  );

  if (images.isNotEmpty) {
    if (selectedImagesNotifier!.value.length + images.length > 3) {
      // Show a message or handle the case where the user tries to pick more than 3 images
      ToastUtil.showShortToast("You can only select up to 3 images.");

      // Collapse the modal popup menu for hiding bottom sheet (only when more than 3 images selected)
      if (context.mounted) {
        Navigator.pop(context);
      }

      return;
    }

    selectedImagesNotifier.value = List.from(selectedImagesNotifier.value)
      ..addAll(images.take(3 - selectedImagesNotifier.value.length));
  }

  // Collapse the modal popup menu for hiding bottom sheet
  if (context.mounted) {
    Navigator.pop(context);
  }
}

Future<dynamic> buildRequestPermissionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Permission Required'),
      content: const Text(
        'Please grant access to the camera and storage in settings to proceed.',
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            openAppSettings(); // Open app settings
          },
          child: const Text('Open Settings'),
        ),
      ],
    ),
  );
}
