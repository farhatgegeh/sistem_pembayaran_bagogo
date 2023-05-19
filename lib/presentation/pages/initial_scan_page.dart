import 'dart:io';

import 'package:aplikasi_pembayaran_bagogo/config/routes/app_routes.dart';
import 'package:aplikasi_pembayaran_bagogo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../providers/get_location_bloc.dart';
import '../providers/qr_code_scanner_bloc.dart';

class InitialScanPage extends StatefulWidget {
  const InitialScanPage({super.key});

  @override
  State<InitialScanPage> createState() => _InitialScanPageState();
}

class _InitialScanPageState extends State<InitialScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<GetLocationBloc>().add(OnGetStartedLocationEvent()),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              cameraFacing: CameraFacing.back,
              key: qrKey,
              overlay: QrScannerOverlayShape(borderRadius: 20),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (result != null)
                          ? Text(
                              '${result!.code}',
                              style: kHeading6,
                            )
                          : Text('Scan a code', style: kHeading6),
                      IconButton(
                        onPressed: () {
                          controller?.resumeCamera();
                        },
                        icon: const Icon(Icons.refresh_rounded),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<QrCodeScannerBloc>()
                          .add(OnScannerEvent(result!.code.toString()));
                      controller?.stopCamera();
                      router.goNamed('home');
                    },
                    style: TextButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(double.maxFinite, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: const Text("Lanjut"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
