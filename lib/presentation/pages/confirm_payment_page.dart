import 'package:aplikasi_pembayaran_bagogo/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ConfirmPaymentPage extends StatelessWidget {
  const ConfirmPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff008821),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/verified.png'),
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'PEMBAYARAN BERHASIL',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                ),
                onPressed: () {
                  router.pushReplacementNamed('home');
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                      color: Color(0xff008821),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
