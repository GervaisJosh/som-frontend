import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joshgervais/gen/assets.gen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanTicketScreen extends StatefulWidget {
  const ScanTicketScreen({super.key});

  @override
  State<ScanTicketScreen> createState() => _ScanTicketScreenState();
}

class _ScanTicketScreenState extends State<ScanTicketScreen>
    with SingleTickerProviderStateMixin {
  MobileScannerController cameraController = MobileScannerController();
  TextEditingController qrCodeController = TextEditingController();
  late AnimationController _animationController;
  bool _animationStopped = false;
  bool scanning = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationController.forward(from: 0.0); // add this line

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  void startScanning() {
    setState(() {
      _animationStopped = false;
      scanning = true;
    });
    animateScanAnimation(false);
  }

  void stopScanning() {
    setState(() {
      _animationStopped = true;
      scanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Ticket")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scanner
            QrScanner(
              cameraController: cameraController,
              qrCodeController: qrCodeController,
              animationController: _animationController,
              animationStopped: _animationStopped,
            ),
          ],
        ),
      ),
    );
  }
}

class QrScanner extends StatelessWidget {
  const QrScanner({
    super.key,
    required this.cameraController,
    required this.qrCodeController,
    required this.animationController,
    required this.animationStopped,
  });

  final MobileScannerController cameraController;
  final TextEditingController qrCodeController;
  final AnimationController animationController;
  final bool animationStopped;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 250.h,
          child: Stack(
            children: [
              // Main Scanner
              MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    final String scannedQR = barcode.rawValue ?? "null";
                    // Check if the scanned QR code is different from the one already assigned
                    if (qrCodeController.text != scannedQR) {
                      debugPrint('Barcode found! $scannedQR');
                      // Update the QR code controller with the scanned QR code value
                      qrCodeController.text = scannedQR;
                    }
                  }
                },
              ),

              // Broken Square Overlay
              Container(
                color: Colors.red.shade100,
                child: SvgPicture.asset(
                  Assets.icons.scannerOverlay,
                  fit: BoxFit.contain,
                ),
              ),
              // CustomPaint(
              //   painter: BrokenSquarePainter(),
              //   child: const SizedBox(
              //     height: double.infinity,
              //     width: double.infinity,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScannerAnimation extends AnimatedWidget {
  final bool stopped;
  final double width;

  const ScannerAnimation(this.stopped, this.width,
      {super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    final scorePosition = (animation.value * 440) + 16;

    Color color1 = const Color(0x5532CD32);
    Color color2 = const Color(0x0032CD32);

    if (animation.status == AnimationStatus.reverse) {
      color1 = const Color(0x0032CD32);
      color2 = const Color(0x5532CD32);
    }

    return Positioned(
      bottom: scorePosition,
      left: 16.0,
      child: Opacity(
        opacity: (stopped) ? 0.0 : 1.0,
        child: Container(
          height: 60.0,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9],
              colors: [color1, color2],
            ),
          ),
        ),
      ),
    );
  }
}

class BrokenSquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    const double gap = 20.0;
    const double length = 30.0;

    // Top-left corner
    canvas.drawLine(const Offset(0, gap), const Offset(0, gap + length), paint);
    canvas.drawLine(const Offset(gap, 0), const Offset(gap + length, 0), paint);

    // Top-right corner
    canvas.drawLine(
        Offset(size.width, gap), Offset(size.width, gap + length), paint);
    canvas.drawLine(Offset(size.width - gap, 0),
        Offset(size.width - gap - length, 0), paint);

    // Bottom-left corner
    canvas.drawLine(Offset(0, size.height - gap),
        Offset(0, size.height - gap - length), paint);
    canvas.drawLine(
        Offset(gap, size.height), Offset(gap + length, size.height), paint);

    // Bottom-right corner
    canvas.drawLine(Offset(size.width, size.height - gap),
        Offset(size.width, size.height - gap - length), paint);
    canvas.drawLine(Offset(size.width - gap, size.height),
        Offset(size.width - gap - length, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScannerScreenState();
  }
}

class ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _animationStopped = false;
  String scanText = "Scan";
  bool scanning = false;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animationController.forward(from: 0.0); // add this line

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: QrScanner(
                          cameraController: MobileScannerController(),
                          qrCodeController: TextEditingController(),
                          animationController: AnimationController(
                            duration: const Duration(seconds: 1),
                            vsync: ScannerScreenState(),
                          ),
                          animationStopped: false,
                        ),
                      ),
                    ),
                  ),
                  ScannerAnimation(
                    _animationStopped,
                    334.w,
                    animation: _animationController,
                  )
                ]),
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: CupertinoButton(
                    color: CupertinoColors.activeGreen,
                    onPressed: () {
                      if (!scanning) {
                        animateScanAnimation(false);
                        setState(() {
                          _animationStopped = false;
                          scanning = true;
                          scanText = "Stop";
                        });
                      } else {
                        setState(() {
                          _animationStopped = true;
                          scanning = false;
                          scanText = "Scan";
                        });
                      }
                    },
                    child: Text(scanText),
                  ),
                )
              ])),
    );
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
