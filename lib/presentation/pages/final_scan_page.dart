import 'dart:io';

import 'package:aplikasi_pembayaran_bagogo/config/routes/app_routes.dart';
import 'package:aplikasi_pembayaran_bagogo/presentation/providers/get_distance_location_bloc.dart';
import 'package:aplikasi_pembayaran_bagogo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../providers/get_location_bloc.dart';
import '../providers/qr_code_scanner_bloc.dart';

class FinalScanPage extends StatefulWidget {
  const FinalScanPage({super.key, required this.data});

  final String data;

  @override
  State<FinalScanPage> createState() => _FinalScanPageState();
}

class _FinalScanPageState extends State<FinalScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<GetLocationBloc>().add(OnGetFinalLocationEvent()),
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
                  (result != null)
                      ? Text(
                          '${result!.code}',
                          style: kHeading6,
                        )
                      : Text('Scan QR Anda', style: kHeading6),
                  BlocListener<GetLocationBloc, GetLocationState>(
                    listener: (context, state) {
                      if (state is CombinedLocationLoaded) {
                        final startedLat = state.startLocation.lat;
                        final startedLong = state.startLocation.long;
                        final endLat = state.finalLocation.lat;
                        final endLong = state.finalLocation.long;

                        print(state);
                        context.read<GetDistanceBloc>().add(
                              GetDistanceLocationEvent(
                                startedLat: startedLat as double,
                                startedLong: startedLong as double,
                                endLat: endLat as double,
                                endLong: endLong as double,
                              ),
                            );
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        controller?.stopCamera();
                        context
                            .read<QrCodeScannerBloc>()
                            .add(DeleteScannerDataEvent(widget.data));
                        router.goNamed('payment');
                      },
                      style: TextButton.styleFrom(
                          elevation: 0,
                          minimumSize: const Size(double.maxFinite, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: const Text("OK"),
                    ),
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
      if (scanData.code == widget.data) {
        setState(() {
          result = scanData;
          controller.pauseCamera();
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
