import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joshgervais/helpers/all_routes.dart';
import 'package:joshgervais/helpers/helper_methods.dart';
import 'package:joshgervais/helpers/navigation_service.dart';
import 'package:joshgervais/helpers/toast.dart';
import 'package:joshgervais/helpers/ui_helpers.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../gen/assets.gen.dart';

class ScannerScreen extends StatefulWidget {
  final VoidCallback? onTap;
  const ScannerScreen({super.key, this.onTap});

  @override
  State<ScannerScreen> createState() => _ScanTicketScreenState();
}

class _ScanTicketScreenState extends State<ScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  TextEditingController qrCodeController = TextEditingController();

  ValueNotifier<bool> isFlashOn = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          // Scanner
          QrScanner2(
            cameraController: cameraController,
            qrCodeController: qrCodeController,
          ),

          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UIHelper.kDefaultPadding(),
                  vertical: UIHelper.kDefaultPadding() * 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _scannerOpt(
                      opt: Assets.icons.circleCross,
                      onTap: widget.onTap,
                    ),
                    Column(
                      children: [
                        _scannerOpt(
                          opt: Assets.icons.circleMedia,
                          onTap: () {
                            showPickImageBottomSheet(context, null, null);
                          },
                        ),
                        UIHelper.verticalSpaceMedium,
                        ValueListenableBuilder(
                            valueListenable: isFlashOn,
                            builder: (context, flashOn, child) {
                              return _scannerOpt(
                                opt: flashOn
                                    ? Assets.icons.circleFlashFilled
                                    : Assets.icons.circleFlash,
                                onTap: toggleFlash,
                              );
                            }),
                      ],
                    )
                  ],
                ),
              ))
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   top: 50.h,
          //   bottom: 0,
          //   child: ScannerAnimation(
          //     _animationStopped,
          //     overlayHeight,
          //     overlayWidth,
          //     animation: _animationController,
          //   ),
          // ),

          // Scan Button
          // Padding(
          //   padding: EdgeInsets.only(top: 32.h),
          //   child: CupertinoButton(
          //     color: CupertinoColors.activeGreen,
          //     onPressed: () {
          //       if (!scanning) {
          //         animateScanAnimation(false);
          //         setState(() {
          //           _animationStopped = false;
          //           scanning = true;
          //           scanText = "Stop";
          //         });
          //       } else {
          //         setState(() {
          //           _animationStopped = true;
          //           scanning = false;
          //           scanText = "Scan";
          //         });
          //       }
          //     },
          //     child: Text(scanText),
          //   ),
          // )
        ]),
      ),
    );
  }

  GestureDetector _scannerOpt({required String opt, VoidCallback? onTap}) {
    return GestureDetector(onTap: onTap, child: SvgPicture.asset(opt));
  }

  // Method to toggle flash
  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;
    cameraController.toggleTorch();
  }

  // Method to scan an already picked image
  // void scanImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  //   if (image != null) {
  //     final Uint8List imageBytes = await image.readAsBytes();
  //     cameraController.analyzeImage(imageBytes);
  //   }
  // }
}

class QrScanner2 extends StatelessWidget {
  const QrScanner2({
    super.key,
    required this.cameraController,
    required this.qrCodeController,
  });

  final MobileScannerController cameraController;
  final TextEditingController qrCodeController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Full Screen Scanner
            Positioned.fill(
              child: MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    final String scannedQR = barcode.rawValue ?? "null";
                    if (qrCodeController.text != scannedQR) {
                      debugPrint('Barcode found! $scannedQR');
                      ToastUtil.showLongToast('Barcode found! $scannedQR');
                      qrCodeController.text = scannedQR;

                      // Detection Successfull Then Navigate To Scan Result Screen
                      NavigationService.navigateTo(Routes.scanResult);
                    }
                  }
                },
              ),
            ),
            // Centered Overlay
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Image.asset(
                  Assets.images.scannerOverlay.path,
                  // height: 334.h,
                  // width: 258.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
