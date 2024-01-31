import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController =
        MobileScannerController(detectionSpeed: DetectionSpeed.normal);
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );
    String overlayText = "Scan Your QR Code";

    void onBarcodeDetect(BarcodeCapture barcodeCapture) {
      final barcode = barcodeCapture.barcodes.last;
      cameraController.stop();
      AutoRouter.of(context).push(const RestaurantDetailView());
      cameraController.start();
      // setState(() {
      //     barcode.rawValue ??
      //     'Barcode has no displayable value';
      // });

      // final List<Barcode> barcodes = barcodeCapture.barcodes;
      // for (final barcode in barcodes) {
      //   debugPrint('Barcode found! ${barcode.rawValue}');
      // }
    }

    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      MobileScanner(
        fit: BoxFit.cover,
        onDetect: onBarcodeDetect,
        controller: cameraController,
        scanWindow: scanWindow,
      ),
      CustomPaint(
        painter: ScannerOverlay(scanWindow),
      ),
      Padding(
        padding: const EdgeInsets.all(96.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Opacity(
            opacity: 1,
            child: Text(
              overlayText,
              style: const TextStyle(
                backgroundColor: Colors.black26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ValueListenableBuilder<TorchState>(
                valueListenable: cameraController.torchState,
                builder: (context, value, child) {
                  final Color iconColor;
                  switch (value) {
                    case TorchState.off:
                      iconColor = Colors.black;
                    case TorchState.on:
                      iconColor = Colors.yellow;
                  }

                  return IconButton(
                    onPressed: () => cameraController.toggleTorch(),
                    icon: Icon(
                      Icons.flashlight_on_outlined,
                      color: iconColor,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;
  final double borderRadius = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    // Create a Paint object for the white border
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Adjust the border width as needed

    // Calculate the border rectangle with rounded corners
    // Adjust the radius as needed
    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // Draw the white border
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
